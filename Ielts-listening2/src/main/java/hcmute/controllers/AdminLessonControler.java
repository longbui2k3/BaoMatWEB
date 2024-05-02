package hcmute.controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import hcmute.entity.AnswerLesson;
import hcmute.entity.AnswerTest;
import hcmute.entity.Course;
import hcmute.entity.Lesson;
import hcmute.entity.ListeningPart;
import hcmute.entity.MockTest;
import hcmute.entity.TopicTest;
import hcmute.services.AdminKhoaHocServiceImpl;
import hcmute.services.AnswerLessonService;
import hcmute.services.CourseServiceImpl;
import hcmute.services.IAdminKhoaHocService;

import hcmute.services.LessonServiceImpl;
import hcmute.utils.Constants;
import hcmute.utils.DeleteImage;
import hcmute.utils.UploadUtils;

@MultipartConfig
@WebServlet(urlPatterns = { "/admin/listLesson", "/admin/addLesson", "/admin/deleteLesson", "/admin/editLesson"})
public class AdminLessonControler extends HttpServlet {

	private static final long serialVersionUID = 1L;
	String courseIdAdd;
	String LessonIdAdd;

	LessonServiceImpl lessonService = new LessonServiceImpl ();
	CourseServiceImpl courseService = new CourseServiceImpl();
	AnswerLessonService answerLessonService = new AnswerLessonService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		if (url.contains("listLesson")) {
			String courseId = req.getParameter("courseId");
			courseIdAdd = courseId;
			List<Lesson> listLesson = lessonService.findLessonByCourse(courseId);
			Course course = courseService.findById(courseId);
			
			req.setAttribute("folder", Constants.FOLDER_VIDEO);
			req.setAttribute("courseID", courseId);
			req.setAttribute("course", course);
			req.setAttribute("listLesson", listLesson);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/AdminLesson.jsp");
			rd.forward(req, resp);

		} else if (url.contains("editLesson")) {
			String lessonId = req.getParameter("lessonId");
			LessonIdAdd = lessonId;
			System.out.print(LessonIdAdd);
			/* System.out.print("ttt" + lessonId); */
			Lesson lesson = lessonService.findOneById(lessonId);
			List<AnswerLesson> listAns = answerLessonService.findAnswerByLesson(lessonId);
			
			req.setAttribute("folder", Constants.FOLDER_VIDEO);
			req.setAttribute("lesson", lesson);
			req.setAttribute("listAns", listAns);
		
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/EditLesson.jsp"); // file .jsp viết giao diện
			rd.forward(req, resp);
		} else if (url.contains("deleteLesson")) {
			String lessonId = req.getParameter("id");
			try {
				lessonService.delete(lessonId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/listLesson?courseId="+courseIdAdd);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String url = req.getRequestURL().toString();

		if (url.contains("addLesson")) {
			Lesson lesson = new Lesson();
			
			lesson.setLessonId("");
			lesson.setLessonName(req.getParameter("lessonName"));
			lesson.setAnswerSheet(req.getParameter("answerSheet"));
			Course course = courseService.findById(courseIdAdd);
			lesson.setCourses(course);
			
			if (req.getPart("video").getSize() != 0) {
				// tạo tên file mới để khỏi bị trùng
				String fileName = "" + System.currentTimeMillis();
				lesson.setVideo(UploadUtils.processUpload("video", req, Constants.DIR + "\\"+Constants.FOLDER_VIDEO+"\\", fileName));
			}
			lessonService.insert(lesson);
		
			
			Lesson newLesson = lessonService.getNewLesson();
			List<AnswerLesson> anslesssons = new ArrayList<AnswerLesson>();
			for (int i = 1; i < 100; i++) {
				String answer = req.getParameter("answer" + i);
				if (answer == null)
					break;
				
				AnswerLesson ansLesson = new AnswerLesson();
				ansLesson.setAnswerId("");
				ansLesson.setAnswerKey(answer);
				ansLesson.setNumber(i);
				ansLesson.setLessons(newLesson);
				anslesssons.add(ansLesson);	
			}
			for (AnswerLesson ansLesson : anslesssons) {
				answerLessonService.insert(ansLesson);
			}
			
			resp.sendRedirect(req.getContextPath() + "/admin/listLesson?courseId="+courseIdAdd);
			
		} else if (url.contains("editLesson")) {
			Lesson lesson = new Lesson();
			Lesson oldLesson = lessonService.findOneById(LessonIdAdd);
			lesson.setLessonId(LessonIdAdd);
			lesson.setLessonName(req.getParameter("lessonName"));
			lesson.setDescription(oldLesson.getDescription());
			lesson.setImage(oldLesson.getImage());
			lesson.setAudio(oldLesson.getAudio());
			lesson.setCreatedDate(new java.util.Date());
			lesson.setCourses(oldLesson.getCourses());
			lesson.setAnswerSheet(req.getParameter("answerSheet"));
			if (req.getPart("video").getSize() != 0) {
				// tạo tên file mới để khỏi bị trùng
				String fileName = "" + System.currentTimeMillis();
				lesson.setVideo(UploadUtils.processUpload("video", req, Constants.DIR + "\\videoLesson\\", fileName));
			} else
				lesson.setVideo(req.getParameter("preVideo"));
			
			
			List<AnswerLesson> anslesssons = new ArrayList<AnswerLesson>();
			for (int i = 1; i < 100; i++) {
				String answerKey = req.getParameter("answer" + i);
				String answerId = req.getParameter("answerId" + i);
				if (answerKey == null)
					break;
				
				AnswerLesson ansLesson = new AnswerLesson();
				ansLesson.setAnswerId(answerId);
				ansLesson.setAnswerKey(answerKey);
				ansLesson.setNumber(i);
				ansLesson.setLessons(lesson);
				anslesssons.add(ansLesson);	
			}
			
			lessonService.update(lesson);
			for (AnswerLesson ansLesson : anslesssons) {
				answerLessonService.update(ansLesson);
			}
			resp.sendRedirect(req.getContextPath() + "/admin/listLesson?courseId="+courseIdAdd);
		}
	}
}
