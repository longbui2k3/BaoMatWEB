package hcmute.controllers;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import hcmute.entity.AnswerTest;
import hcmute.entity.AnswerUser;
import hcmute.entity.EnrrolTest;
import hcmute.entity.ListeningPart;
import hcmute.entity.User;
import hcmute.services.AnswerUserService;
import hcmute.services.EnrollTestService;
import hcmute.services.IListeningPartService;
import hcmute.services.ListeningPartServiceImpl;
import hcmute.utils.HttpUtil;

@WebServlet(urlPatterns = { "/test/luyende_test", "/test/complete_test", "/api-comfirm-answers", "/api-luyende_test" })
public class TestControllers extends HttpServlet {

	private IListeningPartService listeningPartService = new ListeningPartServiceImpl();
	private EnrollTestService enrollTestService = new EnrollTestService();
	private AnswerUserService answerUserService = new AnswerUserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI().toString();
		if (url.contains("test/luyende_test")) {
			getLuyenDeTest(req, resp);
		} else if (url.contains("test/complete_test")) {
			getCompleteTest(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		String url = req.getRequestURI().toString();
		if (url.contains("api-luyende_test")) {
			postSaveAnswers(req, resp);
		} else if (url.contains("api-comfirm-answers")) {
			postApiLayDanhSachCauHoi(req, resp);
		}
	}

	protected void getLuyenDeTest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			String enrollTestId = req.getParameter("enrollTestId");
			if (enrollTestId == null) {
				resp.setContentType("text/html");
				String errorMsg = "<p>Không có bài kiểm tra</p>";
				resp.getWriter().print(errorMsg);
				return;
			}
			// Kiểm tra có phải là user sở hữu enrollTest truy cập không
			EnrrolTest enrollTest = enrollTestService.findByIdContainAnsTestAndAnswerUser(enrollTestId);
			if (enrollTest == null) {
				resp.setContentType("text/html");
				String errorMsg = "<p>Không tìm thấy bài kiểm tra</p>";
				resp.getWriter().print(errorMsg);
				return;
			}
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			if (user == null || !(user.getUserId().equals(enrollTest.getUsers().getUserId()))) {
				resp.setContentType("text/html");
				String errorMsg = "<p>Không có quyền truy cập vào bài kiểm tra này</p>";
				resp.getWriter().print(errorMsg);
				return;
			}
			if (enrollTest.getMockTests().getListeningParts() != null) {
				enrollTest.getMockTests().getListeningParts().sort((a, b) -> a.getNumber() - b.getNumber());
				enrollTest.getMockTests().getListeningParts().forEach(part -> {
					part.getAnswerTests().sort((a, b) -> a.getNumber() - b.getNumber());
				});
			}
			
			String currentPartId = null;
			if(enrollTest.getMockTests().getListeningParts() != null) {
				if (req.getParameter("currentPartId") == null) {
					currentPartId = enrollTest.getMockTests().getListeningParts().get(0).getPartId();
				} else {
					currentPartId = req.getParameter("currentPartId");
				}
				
			}
			
			// set thời gian
			Date currentDate = new Date(System.currentTimeMillis());
			int timeTest = 40 * 60; // thời gian làm test mặc định 40p
			
			Date enrollmentDate = enrollTest.getEnrrollmentDate();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(enrollmentDate);
			calendar.add(Calendar.SECOND, timeTest);
			Date endingEnrollmentDate = calendar.getTime();
			
			if (currentDate.after(endingEnrollmentDate) || enrollTest.getScore() >= 0) {
				// đăng nhập sau khi test đã hoàn thành
				if (enrollTest.getScore() < 0) {
					double score = enrollTestService.completeTest(enrollTest.getEnrrolId());
					enrollTest.setScore(score);
				}
				req.setAttribute("currentTime", 0);
				req.setAttribute("endingTime", 0);
				req.setAttribute("isCompleted", "True");
				long numberOfCorrectAnswers = enrollTestService.calcNumberOfCorrectAnswers(enrollTestId);
				long numberOfQuestTion = enrollTestService.calcNumberOfQuestTion(enrollTestId);
				req.setAttribute("numberOfCorrectAnswers", numberOfCorrectAnswers);
				req.setAttribute("numberOfQuestTion", numberOfQuestTion);
				String userId = enrollTest.getUsers().getUserId();
				String mockTestId = enrollTest.getMockTests().getTestId();
				List<EnrrolTest> listHistoryTest = enrollTestService.findByUserIdAndMockTestId(userId, mockTestId);
				listHistoryTest.sort((a,b) -> b.getEnrrollmentDate().compareTo(a.getEnrrollmentDate()));
				req.setAttribute("listHistoryTest", listHistoryTest);
			} else if (currentDate.after(enrollmentDate) && currentDate.before(endingEnrollmentDate)) {
				// thời gian làm test nằm trong thời gian hiệu lực
				req.setAttribute("currentTime", (currentDate.getTime() - enrollmentDate.getTime()) / 1000);
				req.setAttribute("endingTime", timeTest);
			} else if (currentDate.before(enrollmentDate)) {
				// đăng nhập sớm hơn thời gian làm bài
				// req.setAttribute("errorMessage", "Chưa đến giờ làm bài, hãy quay lại vào lúc:
				// " + endingEnrollmentDate);
				resp.setContentType("text/html");
				resp.getWriter().println("<p>" + "Chưa đến giờ làm bài, hãy quay lại vào lúc: " + enrollmentDate + "</p>");
				// Tạm thời xuất thông báo, sau này sẽ chuyển hướng quay ngược lại trang
				// test_home và set 1 đoạn tin nhắn đỏ
				// Thông báo rằng chưa đến giờ làm test
				return;
			}
			
			// set next part
			ListeningPart currentPart = listeningPartService.findById(currentPartId);
			
			List<ListeningPart> parts = enrollTest.getMockTests().getListeningParts();
			String prevPart = null;
			String nextPart = null;
			if(parts != null) {
				for (ListeningPart part : parts) {
					if (part.getPartId().equals(currentPartId)) {
						int index = parts.indexOf(part);
						if (index != (parts.size() - 1)) {
							nextPart = parts.get(index + 1).getPartId();
						}
						if (index != 0) {
							prevPart = parts.get(index - 1).getPartId();
						}
						break;
					}
				}
			}
			req.setAttribute("prevPart", prevPart);
			req.setAttribute("nextPart", nextPart);
			req.setAttribute("enrollTest", enrollTest);
			req.setAttribute("currentPart", currentPart);
			req.getRequestDispatcher("/views/luyende/luyende_test.jsp").forward(req, resp);
			
		} catch (Exception e) {
			req.setAttribute("e", e.getMessage());
			req.getRequestDispatcher("/views/user/error404.jsp").forward(req, resp);
		}
	}

	protected void getCompleteTest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String enrollTestId = req.getParameter("enrollTestId");
		EnrrolTest enrollTest = enrollTestService.findById(enrollTestId);
		if (enrollTest != null && enrollTest.getScore() < 0) {
			enrollTestService.completeTest(enrollTestId);
		}
		String childUrl = "/test/luyende_test?enrollTestId=" + enrollTestId;
		resp.sendRedirect(req.getContextPath() + childUrl);
	}

	protected void postSaveAnswers(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpUtil httpUtil = HttpUtil.of(req.getReader());
		AnswerUser answerUser = httpUtil.toModel(AnswerUser.class);
		EnrrolTest enrollTest = enrollTestService.findById(answerUser.getAnswerUserId().getEnrrolId());
		if (enrollTest != null && enrollTest.getScore() < 0) {
			answerUserService.SaveOrUpdate(answerUser);
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(resp.getOutputStream(), answerUser);
		}
	}

	protected void postApiLayDanhSachCauHoi(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpUtil httpUtil = HttpUtil.of(req.getReader());
		EnrrolTest enrrolTest = httpUtil.toModel(EnrrolTest.class);
		EnrrolTest enrrolTest2 = enrollTestService.findByIdContainAnsTestAndAnswerUser(enrrolTest.getEnrrolId());
		String json = "[";
		try {
			if (enrrolTest2 != null) {
				enrrolTest2.getMockTests().getListeningParts().sort((a, b) -> a.getNumber() - b.getNumber());
				enrrolTest2.getMockTests().getListeningParts().forEach(part -> {
					part.getAnswerTests().sort((a, b) -> a.getNumber() - b.getNumber());
				});
				int number = 0;
				for (ListeningPart part : enrrolTest2.getMockTests().getListeningParts()) {
					for (AnswerTest answerTest : part.getAnswerTests()) {
						json += "{ \"CauHoiSo\" : %d,".formatted(number + answerTest.getNumber());
						boolean isAnwser = false;
						if (enrrolTest2.getAnswerUsers() != null) {
							for (AnswerUser answerUser : enrrolTest2.getAnswerUsers()) {
								if (answerTest.getAnswerId().equals(answerUser.getAnswerTest().getAnswerId())
										&& answerUser.getAnswer() != null && !answerUser.getAnswer().isEmpty()) {
									isAnwser = true;
								}
							}
						}
						json += "\"DaTraLoi\" :%b}".formatted(isAnwser);
					}
					number += part.getAnswerTests().size();
				}
				json = json.replace("}{", "},{");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		json += "]";
		resp.getWriter().write(json);
	}

	private static final long serialVersionUID = 1L;

}
