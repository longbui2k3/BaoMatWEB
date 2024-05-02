package hcmute.controllers;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import hcmute.entity.AnswerLesson;
import hcmute.entity.AnswerLessonUser;
import hcmute.entity.AnswerUser;
import hcmute.entity.CommentLesson;
import hcmute.entity.EnrrolLesson;
import hcmute.entity.Lesson;
import hcmute.entity.RepComment;
import hcmute.entity.User;
import hcmute.services.AnswerLessonServiceImpl;
import hcmute.services.AnswerLessonUserServiceImpl;
import hcmute.services.CommentServiceImpl;

import hcmute.services.EnrollLessonServiceImpl;
import hcmute.services.IAnswerLessonService;
import hcmute.services.IAnswerLessonUserService;
import hcmute.services.ICommentService;
import hcmute.services.IEnrollLessonService;
import hcmute.services.ILessonService;
import hcmute.services.IRepCommentService;
import hcmute.services.IUserService;
import hcmute.services.LessonServiceImpl;
import hcmute.services.RepCommentServiceImpl;
import hcmute.services.UserServiceImpl;
import hcmute.utils.Constants;
import hcmute.utils.HttpUtil;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 50)
@WebServlet(urlPatterns = { "/user/lesson", "/user/reply", "/user/comment", "/user/rate", "/api-AnswerLessonUser",
		"/user/resetEnrollLesson", "/user/completeEnrollLesson" })
public class UserLessonController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ILessonService lessonService = new LessonServiceImpl();
	ICommentService cmtService = new CommentServiceImpl();
	IRepCommentService repService = new RepCommentServiceImpl();
	IUserService userService = new UserServiceImpl();
	IEnrollLessonService enrService = new EnrollLessonServiceImpl();
	IAnswerLessonService ansService = new AnswerLessonServiceImpl();
	IAnswerLessonUserService answerLessonUserService = new AnswerLessonUserServiceImpl();
	Date curDate = new Date();// current date
	Lesson curLesson = new Lesson();// current lesson

	User user = new User();// session login

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI().toString();

		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
		} else {
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
			rd.forward(req, resp);
		}

		if (url.contains("lesson")) {
			String lessID = req.getParameter("id");
			curLesson = lessonService.findOneById(lessID);
			List<RepComment> listRep = repService.findAll();
			List<CommentLesson> listCmt = cmtService.findAll();
			List<User> listUser = userService.findAll();
			List<EnrrolLesson> listEnroll = enrService.findAll();

			req.setAttribute("folder", Constants.FOLDER_VIDEO);
			req.setAttribute("lesson", curLesson);
			req.setAttribute("listCmt", listCmt);
			req.setAttribute("listRep", listRep);
			req.setAttribute("listUser", listUser);
			req.setAttribute("user", user);
			req.setAttribute("listEnroll", listEnroll);
			EnrrolLesson enrollLesson = enrService.findByUserIdAndLessonId(user.getUserId(), lessID);
			if (enrollLesson != null && enrollLesson.getNumberOfStar() != null)
				req.setAttribute("starUser", enrollLesson.getNumberOfStar());
			else
				req.setAttribute("starUser", 0);
			
			
			// thêm danh sách câu hỏi
			List<AnswerLesson> listAnswer = ansService.findAll();
			req.setAttribute("enrollLesson", enrollLesson);
			List<AnswerLesson> listAnswerLesson = ansService.findByLessonId(lessID);
			listAnswerLesson.sort((a, b) -> a.getNumber() - b.getNumber());
			req.setAttribute("listAnswerLesson", listAnswerLesson);
			req.setAttribute("listAnswer", listAnswer);

			List<EnrrolLesson> enrollLessonList = enrService.findByLesson(lessID);
			req.setAttribute("enrollLessonList", enrollLessonList);

			int[] percentCountOfStars = new int[] { 0, 0, 0, 0, 0 };
			int people = 0;
			for (EnrrolLesson enrrolLesson : enrollLessonList) {
				int star = enrrolLesson.getNumberOfStar() == null ? 0 : enrrolLesson.getNumberOfStar();
				if (star > 0) {
					percentCountOfStars[star - 1] += 1;
					people += 1;
				}
			}
			if (people > 0) {
				for (int i = 0; i < 5; i++) {
					System.out.println(((percentCountOfStars[i] * 100) / (float) people) + "%%%");
					percentCountOfStars[i] = ((((percentCountOfStars[i] * 100) / (float) people)
							- (int) ((percentCountOfStars[i] * 100) / (float) people)) >= 0.5)
									? (int) ((percentCountOfStars[i] * 100) / (float) people) + 1
									: (int) ((percentCountOfStars[i] * 100) / (float) people);
				}
			}
			req.setAttribute("percentCountOfStars", percentCountOfStars);
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/Lesson-content.jsp");
			rd.forward(req, resp);
		} else if (url.contains("reply")) {

		} else if (url.contains("completeEnrollLesson")) {
			String enrollLessonId = req.getParameter("enrollLessonId");
			
			req.setAttribute("e", enrollLessonId);
			//RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
			//rd.forward(req, resp);
			enrService.completeTest(enrollLessonId);
			String lessonId = req.getParameter("lessonId");
			resp.sendRedirect(req.getContextPath() + "/user/lesson?id=" + lessonId);
		} else if (url.contains("resetEnrollLesson")) {
			String enrollLessonId = req.getParameter("enrollLessonId");
			enrService.resetTest(enrollLessonId);
			String lessonId = req.getParameter("lessonId");
			resp.sendRedirect(req.getContextPath() + "/user/lesson?id=" + lessonId);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String url = req.getRequestURI().toString();

		if (url.contains("reply")) {
			CommentLesson c = cmtService.findOneById(req.getParameter("id"));

			RepComment rep = new RepComment();
			rep.setRepCommentId("id");
			rep.setUsers(user);
			rep.setReplyComment(req.getParameter("reply-content"));
			rep.setCommentLesson(c);
			rep.setCreateTime(curDate);
			try {
				repService.insert(rep);
//				req.setAttribute("u", user);
//				req.setAttribute("text", req.getParameter("reply-content"));
//				req.setAttribute("cmt", c);
				resp.sendRedirect(req.getContextPath() + "/user/lesson?id=" + curLesson.getLessonId());
			} catch (Exception e) {
				e.getStackTrace();

				RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
				rd.forward(req, resp);
			}

			// gửi bằng req để truyền được cái listCmt mới vào và để truyền được url là
			// #review
			// cho JSP biết

		} else if (url.contains("comment")) {

			CommentLesson c = new CommentLesson();
			c.setUsers(user);
			c.setCommentId("ID");
			c.setComment(req.getParameter("comment-content"));
			c.setCreateTime(curDate);
			Lesson l = lessonService.findOneById(req.getParameter("lessId"));
			c.setLessons(l);

			try {
				cmtService.insert(c);
				resp.sendRedirect(req.getContextPath() + "/user/lesson?id=" + curLesson.getLessonId());
			} catch (Exception e) {
				e.getMessage();
				RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
				rd.forward(req, resp);
			}

		} else if (url.contains("rate")) {

			EnrrolLesson enr = enrService.findByUserIdAndLessonId(user.getUserId(), curLesson.getLessonId());
			Integer numRating = Integer.parseInt(req.getParameter("result-rating"));
			enr.setNumberOfStar(numRating);

			try {
				enrService.update(enr);
				resp.sendRedirect(req.getContextPath() + "/user/lesson?id=" + curLesson.getLessonId());
			} catch (Exception e) {
				e.getMessage();
				req.setAttribute("e", e);
				RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
				rd.forward(req, resp);
			}

		} else if (url.contains("/api-AnswerLessonUser")) {
			try {
				HttpUtil httpUtil = HttpUtil.of(req.getReader());
				AnswerLessonUser answerLessonUser = httpUtil.toModel(AnswerLessonUser.class);
				EnrrolLesson enrollLesson = enrService.findOneById(answerLessonUser.getEnrrolLesson().getEnrrolId());
				AnswerLesson ansLesson = ansService.findOneById(answerLessonUser.getAnswerLesson().getAnswerId());
				
				if (enrollLesson != null && ansLesson != null) {
					answerLessonUser.setEnrrolLesson(enrollLesson);
					answerLessonUser.setAnswerLesson(ansLesson);
					answerLessonUserService.saveOrUpdate(answerLessonUser);
				}
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(resp.getOutputStream(), answerLessonUser);
			} catch (Exception e) {
				e.printStackTrace();
				//resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			}
		}
	}
}
