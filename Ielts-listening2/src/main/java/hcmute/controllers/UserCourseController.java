package hcmute.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hcmute.entity.Course;
import hcmute.entity.EnrollLessonCombine;
import hcmute.entity.EnrrolLesson;
import hcmute.entity.Lesson;
import hcmute.entity.User;
import hcmute.entity.UserCourse;
import hcmute.services.AdminKhoaHocServiceImpl;
import hcmute.services.CourseServiceImpl;
import hcmute.services.EnrollLessonServiceImpl;
import hcmute.services.IAdminKhoaHocService;
import hcmute.services.ICourseService;
import hcmute.services.IEnrollLessonService;
import hcmute.services.ILessonService;
import hcmute.services.IUserCourseService;
import hcmute.services.LessonServiceImpl;
import hcmute.services.UserCourseServiceImpl;

@WebServlet(urlPatterns = { "/user/course", "/user/course-detail" })
public class UserCourseController extends HttpServlet {
	private static final long serialVersionUID = -687052188296756743L;

	IAdminKhoaHocService adminKhoaHocService = new AdminKhoaHocServiceImpl();
	ICourseService courseService = new CourseServiceImpl();
	ILessonService lessonService = new LessonServiceImpl();
	IUserCourseService userCourseService = new UserCourseServiceImpl();
	IEnrollLessonService enrollLessonService = new EnrollLessonServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		String gia = req.getParameter("gia") == null ? "" : req.getParameter("gia");
		String rate = req.getParameter("rate") == null ? "" : req.getParameter("rate");
		int page = Integer.parseInt(req.getParameter("page") == null ? "1" : req.getParameter("page"));
		int tab = 1;
		int pagesize = 8;
		String searchStr = req.getParameter("search") == null ? "" : req.getParameter("search");
		if (url.contains("course-detail")) {
			String courseId = req.getParameter("courseId");
			Course course = courseService.findById(courseId);
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			String userId;
			if (user != null)
				userId = user.getUserId();
			else
				userId = "0";
			List<UserCourse> listUserCourse = userCourseService.findByUserIdAndCourseId(userId, courseId);

			req.setAttribute("countUser", userCourseService.countUserCourse(courseId));

			List<Lesson> listLesson = lessonService.findLessonByCourse(courseId);
			if (listUserCourse.size() != 0) { // user da dang ki khoa hoc
				req.setAttribute("isBuy", 1);
				List<EnrollLessonCombine> listEnCombine = new ArrayList<EnrollLessonCombine>();
				for (Lesson lesson : listLesson) {
					EnrrolLesson enrollLesson = enrollLessonService.findByUserIdAndLessonId(userId,
							lesson.getLessonId());

					EnrollLessonCombine en = new EnrollLessonCombine();
					en.setEnrollLesson(enrollLesson);
					en.setLesson(lesson);
					listEnCombine.add(en);
				}
				req.setAttribute("listLesson", listEnCombine);
				req.setAttribute("course", course);
			} else {
				req.setAttribute("isBuy", 0);
				req.setAttribute("listLesson", listLesson);
				req.setAttribute("course", course);
			}
			int[] percentCountOfStars = new int[] { 0, 0, 0, 0, 0 };
			int people = 0;
			for (Lesson lesson : course.getLessons()) {
				for (EnrrolLesson enrrolLesson : lesson.getEnrrolLesson()) {
					int star = enrrolLesson.getNumberOfStar() == null ? 0 : enrrolLesson.getNumberOfStar();
					if (star > 0) {
						percentCountOfStars[star - 1] += 1;
						people += 1;
					}
				}
			}
			if (people > 0) {
				for (int i = 0; i < 5; i++) {
					System.out.println(((percentCountOfStars[i] * 100) / (float) people));
					percentCountOfStars[i] = ((((percentCountOfStars[i] * 100) / (float) people)
							- (int) ((percentCountOfStars[i] * 100) / (float) people)) >= 0.5)
									? (int) ((percentCountOfStars[i] * 100) / (float) people) + 1
									: (int) ((percentCountOfStars[i] * 100) / (float) people);
				}
			}
			req.setAttribute("percentCountOfStars", percentCountOfStars);
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/LessonList.jsp");
			rd.forward(req, resp);

		} else {
			if (gia.equals("thapdencao")) {
				tab = 4;
			} else if (gia.equals("caodenthap")) {
				tab = 5;
			} else if (rate.equals("thapdencao")) {
				tab = 2;
			} else if (rate.equals("caodenthap")) {
				tab = 3;

			}
			Long count = adminKhoaHocService.countKhoaHoc();
			List<Course> allCourseList = adminKhoaHocService.findAll(searchStr, tab);
			for (Course course : allCourseList) {
				System.out.print("course" + course.getCourseId());
			}
			List<Course> CourseList = adminKhoaHocService.findAll(page - 1, pagesize, searchStr, tab);
			req.setAttribute("countCourse", count);
			int pageNum = (int) (allCourseList.size() / pagesize) + (allCourseList.size() % pagesize == 0 ? 0 : 1);

			req.setAttribute("course", CourseList);
			req.setAttribute("pagesize", pagesize);
			req.setAttribute("pageNum", pageNum);
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/coursePage.jsp");
			rd.forward(req, resp);
		}
	}

}
