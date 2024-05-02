package hcmute.controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmute.entity.Course;
import hcmute.entity.TopicTest;
import hcmute.services.AdminKhoaHocServiceImpl;
import hcmute.services.CourseServiceImpl;
import hcmute.services.IAdminKhoaHocService;
import hcmute.services.ICourseService;
import hcmute.utils.Constants;
import hcmute.utils.UploadUtils;

@MultipartConfig
@WebServlet(urlPatterns = { "/admin/khoahoc", "/admin/deletecourse", "/admin/insertCourse", "/admin/lesson",
		"/admin/updateCourse" })
public class AdminKhoaHocController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	ICourseService courseService = new CourseServiceImpl();
	IAdminKhoaHocService adminKhoaHocService = new AdminKhoaHocServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String url = req.getRequestURI().toString();
		String gia = req.getParameter("gia") == null ? "" : req.getParameter("gia");
		String rate = req.getParameter("rate") == null ? "" : req.getParameter("rate");
		String searchStr = req.getParameter("search") == null ? "" : req.getParameter("search");
		int page = Integer.parseInt(req.getParameter("page") == null ? "1" : req.getParameter("page"));
		int tab = 1;
		int pagesize = 8;
		if (url.contains("/deletecourse")) {
			Delete(req, resp);
			resp.sendRedirect(req.getContextPath() + "/admin/khoahoc");
		} else {
			if (gia.equals("thapdencao")) {
				tab = 4;
			} else if (gia.equals("caodenthap")) {
				tab = 5;
			} else if (rate.equals("thapdencao")) {
				tab = 2;
			} else if (rate.equals("caodenthap")) {
				tab = 3;

			} else if (url.contains("lesson")) {
				RequestDispatcher rd = req.getRequestDispatcher("/views/khoahoc/AdminLesson.jsp");
				rd.forward(req, resp);
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
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/AdminKhoaHoc.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		if (url.contains("insertCourse")) {
			Course model = new Course();
			try {
				// BeanUtils.populate(model, req.getParameterMap());
				model.setCourseId("");
				model.setCourseName(req.getParameter("courseName"));
				model.setDescription(req.getParameter("description"));
				model.setCost(Integer.parseInt(req.getParameter("cost")));
				if (req.getPart("image").getSize() != 0) {
					// tạo tên file mới để khỏi bị trùng
					String fileName = "" + System.currentTimeMillis();
					model.setImage(UploadUtils.processUpload("image", req, Constants.DIR + "\\"+Constants.FOLDER_COURSE+"\\", fileName));
				}
				if (req.getPart("trailer").getSize() != 0) {
					// tạo tên file mới để khỏi bị trùng
					String fileName = "" + System.currentTimeMillis();
					model.setTrailer(UploadUtils.processUpload("trailer", req,
							Constants.DIR + "\\" + Constants.FOLDER_VIDEO + "\\", fileName));
				}
				Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("enrrollmentDate"));
				model.setEnrrolmentDate(date1);
				courseService.insert(model);
				req.setAttribute("course", model);
				req.setAttribute("message", "add succes");
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "add faild");
			}
			resp.sendRedirect(req.getContextPath() + "/admin/khoahoc");

		} else if (url.contains("updateCourse")) {
			Course model = new Course();
			Course course = courseService.findById(req.getParameter("CourseId"));
			try {
				// BeanUtils.populate(model, req.getParameterMap());
				model.setCourseId(req.getParameter("CourseId"));
				model.setCourseName(req.getParameter("CourseName"));
				model.setDescription(req.getParameter("Description"));
				model.setCost(Integer.parseInt(req.getParameter("Cost")));
				if (req.getPart("Image").getSize() != 0) {
					// tạo tên file mới để khỏi bị trùng
					String fileName = "" + System.currentTimeMillis();
					model.setImage(UploadUtils.processUpload("Image", req, Constants.DIR + "\\courseIMG\\", fileName));
				} else {
					model.setImage(course.getImage());
				}
				if (req.getPart("Trailer").getSize() != 0) {
					// tạo tên file mới để khỏi bị trùng
					String fileName = "" + System.currentTimeMillis();
					model.setTrailer(UploadUtils.processUpload("Trailer", req,
							Constants.DIR + "\\" + Constants.FOLDER_VIDEO + "\\", fileName));
				} else {
					model.setTrailer(course.getTrailer());
				}

				Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("EnrrollmentDate"));
				model.setEnrrolmentDate(date1);
				courseService.update(model);
				req.setAttribute("course", model);
				req.setAttribute("message", "add succes");
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "add faild");
			}
			resp.sendRedirect(req.getContextPath() + "/admin/khoahoc");

		}

	}

	private void FindAllDecreaseRate(HttpServletRequest req, HttpServletResponse resp) {
		try {
			List<Course> list = adminKhoaHocService.FindAllCourseDecreaseRate();

			req.setAttribute("course", list);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}

	}

	private void FindAllIncreaseRate(HttpServletRequest req, HttpServletResponse resp) {
		try {
			List<Course> list = adminKhoaHocService.FindAllCourseIncreaseRate();

			req.setAttribute("course", list);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}

	}

	private void Delete(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String courseId = req.getParameter("courseId");
			System.out.print("courseId la: " + courseId);
			adminKhoaHocService.deleteCourse(courseId);
			req.setAttribute("Message", "Da xoa thanh cong");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}

	}

	private void FindAllDecreaseCost(HttpServletRequest req, HttpServletResponse resp) {
		try {
			List<Course> list = adminKhoaHocService.FindAllCourseDecreaseCost();

			req.setAttribute("course", list);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}
	}

	private void FindAllIncreaseCost(HttpServletRequest req, HttpServletResponse resp) {
		try {
			List<Course> list = adminKhoaHocService.FindAllCourseIncreaseCost();

			req.setAttribute("course", list);
			String courseId = req.getParameter("courseId");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}
	}

	private void FindAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			List<Course> list = adminKhoaHocService.FindAllCourse();

			req.setAttribute("course", list);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}
	}

}