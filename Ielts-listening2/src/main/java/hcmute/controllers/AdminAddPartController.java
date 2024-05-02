package hcmute.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JPAConfig.JPAConfig;
import hcmute.entity.AnswerTest;
import hcmute.entity.ListeningPart;
import hcmute.entity.MockTest;
import hcmute.services.AnswerTestServiceImpl;
import hcmute.services.IAnswerTestService;
import hcmute.services.IListeningPartService;
import hcmute.services.IMockTestService;
import hcmute.services.ListeningPartServiceImpl;
import hcmute.services.MockTestServiceImpl;
import hcmute.utils.Constants;
import hcmute.utils.UploadUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 100, // 10 MB
		maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(urlPatterns = { "/admin/listPart", "/admin/addPart", "/admin/deletePart", "/admin/editPart" })
public class AdminAddPartController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	IMockTestService testService = new MockTestServiceImpl();
	IListeningPartService listeningPartService = new ListeningPartServiceImpl();
	IAnswerTestService answerTestService = new AnswerTestServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		if (url.contains("listPart")) {
			String idTest = req.getParameter("idTest");
			List<ListeningPart> listListeningPart = listeningPartService.findByMockTestId(idTest);
			req.setAttribute("idTest", idTest);
			req.setAttribute("count", listListeningPart.size());
			req.setAttribute("listPart", listListeningPart);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/admin_listening-part.jsp");
			rd.forward(req, resp);
		} else if (url.contains("editPart")) {
			String partId = req.getParameter("id");
			ListeningPart listeningPart = listeningPartService.findById(partId);
			List<AnswerTest> listAnswer = answerTestService.findByPartId(partId);
			PrintWriter out = resp.getWriter();
			req.setAttribute("listeningPart", listeningPart);
			req.setAttribute("listAnswer", listAnswer);
			req.getRequestDispatcher("/views/admin/EditPart.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		if (url.contains("addPart")) {
			EntityManager entityManager = JPAConfig.getEntityManager();
			EntityTransaction transaction = entityManager.getTransaction();
			String image = "imageTemp";
			String idTest = req.getParameter("idTest");
			String partNumberStr = req.getParameter("partNumber");
			String audio = "audioTemp";
			Integer partNumber = Integer.parseInt(partNumberStr);
			String answerSheet = req.getParameter("answerSheet");
			MockTest mockTest = testService.findById(idTest);

			ListeningPart listeningPart = new ListeningPart();
			listeningPart.setPartId("ID");
			listeningPart.setImage("imageTemp");
			listeningPart.setNumber(partNumber);
			listeningPart.setAudio("audioTemp");
			listeningPart.setAnswerSheet(answerSheet);
			listeningPart.setMockTests(mockTest);
			if (req.getPart("audioFile").getSize() != 0) {
				// tạo tên file mới để khỏi bị trùng
				String fileName = "" + System.currentTimeMillis();
				listeningPart.setAudio(
						UploadUtils.processUpload("audioFile", req, Constants.DIR + "\\topicAudio\\", fileName));
			}

			listeningPartService.insert(listeningPart);
			ListeningPart newListeningPart = listeningPartService.findByTestIDandNumber(mockTest, partNumber);
			List<AnswerTest> answerTests = new ArrayList<AnswerTest>();
			for (int i = 1; i < 100; i++) {
				String answer = req.getParameter("answer" + i);
				if (answer == null)
					break;

				AnswerTest answerTest = new AnswerTest();
				answerTest.setAnswerId("ID"); // You may need to implement a method to generate unique IDs
				answerTest.setAnswerKey(answer);
				answerTest.setNumber(i);
				answerTest.setListeningParts(newListeningPart);
				answerTests.add(answerTest);
			}
			for (AnswerTest answerTest : answerTests) {
				answerTestService.insert(answerTest);

//				out.println(answerTest.getAnswerId() + " " + answerTest.getListeningParts().getPartId() + " "
//						+ answerTest.getAnswerKey() + " " + answerTest.getNumber());
			}

			resp.sendRedirect(req.getContextPath() + "/admin/listPart?idTest=" + idTest);

		} else if (url.contains("deletePart")) {
			String idTest = req.getParameter("idTest");
			String partId = req.getParameter("id");
			try {
				listeningPartService.delete(partId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/listPart?idTest=" + idTest);
		} else if (url.contains("editPart")) {
			String partId = req.getParameter("partId");
			String answerSheet = req.getParameter("answerSheet");
			String image = "imageTemp";
			String testid = req.getParameter("testId");
			String partNumber = req.getParameter("partNumber");
			ListeningPart listeningPart = new ListeningPart();
			listeningPart.setPartId(partId);
			listeningPart.setAnswerSheet(answerSheet);
			listeningPart.setNumber(Integer.parseInt(partNumber));
			MockTest mock = testService.findById(testid);
			listeningPart.setMockTests(mock);
			listeningPart.setImage(image);
			if (req.getPart("audioFile").getSize() != 0) {
				// tạo tên file mới để khỏi bị trùng
				String fileName = "" + System.currentTimeMillis();
				listeningPart.setAudio(
						UploadUtils.processUpload("audioFile", req, Constants.DIR + "\\topicAudio\\", fileName));
			} else
				listeningPart.setAudio(req.getParameter("preAudio"));
			
			List<AnswerTest> answerTests = new ArrayList<AnswerTest>();
			for (int i = 1; i < 100; i++) {
				String answerKey = req.getParameter("answer" + i);
				String answerId = req.getParameter("answerId" + i);
				if (answerKey == null)
					break;
				AnswerTest answerTest = new AnswerTest();
				answerTest.setAnswerId(answerId);
				answerTest.setAnswerKey(answerKey);
				answerTest.setNumber(i);
				answerTest.setListeningParts(listeningPart);
				answerTests.add(answerTest);
			}

			listeningPartService.update(listeningPart);
			for (AnswerTest ans : answerTests)
				answerTestService.update(ans);
			resp.sendRedirect(req.getContextPath() + "/admin/listPart?idTest=" + testid);
		}
	}
}
