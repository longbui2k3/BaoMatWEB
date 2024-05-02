package hcmute.controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import hcmute.DAO.ITopicTestDAO;
import hcmute.entity.MockTest;
import hcmute.entity.TopicTest;

import hcmute.services.IMockTestService;
import hcmute.services.ITopicTestService;

import hcmute.services.MockTestServiceImpl;
import hcmute.services.TopicTestServiceImpl;
import hcmute.utils.Constants;
import hcmute.utils.DeleteImage;
import hcmute.utils.UploadUtils;

@MultipartConfig
@WebServlet(urlPatterns = { "/admin/listTopic", "/admin/addTopic", "/admin/deleteTopic", "/admin/updateTopic",
		"/admin/addMockTest", "/admin/deleteTest", "/admin/updateMockTest" })
public class AdminAddCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ITopicTestService topicService = new TopicTestServiceImpl();
	IMockTestService mockService = new MockTestServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		if (url.contains("listTopic")) {
			int page = Integer.parseInt(req.getParameter("page") == null ? "1" : req.getParameter("page"));
			int pagesize = 8;
			
			List<MockTest> listMocktest = mockService.findAll();
			List<TopicTest> allTopicList = topicService.getAllTopicTest();
			List<TopicTest> topicList = topicService.getAllTopicTest(page - 1, pagesize);
			int numPage = (int)(allTopicList.size() / pagesize) + (allTopicList.size() % pagesize != 0 ? 1 : 0);
			req.setAttribute("listMocktest", listMocktest);
			req.setAttribute("topicList", topicList);
			req.setAttribute("folder", Constants.FOLDER_TOPIC);
			req.setAttribute("pageNum", numPage);

			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/admin_taobode.jsp");
			rd.forward(req, resp);
		} else if (url.contains("deleteTopic")) {
			String topicID = req.getParameter("id");
			try {
				topicService.deleteTopic(topicID);
			} catch (Exception e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = req.getRequestDispatcher("listTopic"); // file .jsp viết giao diện
			rd.forward(req, resp);
		} else if (url.contains("deleteTest")) {
			String testID = req.getParameter("idTest");
			try {
				mockService.delete(testID);
				req.setAttribute("messSuccess", "oke");
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("messError", e.getMessage());
			}
			RequestDispatcher rd = req.getRequestDispatcher("listTopic"); // file .jsp viết giao diện
			rd.forward(req, resp);
		} 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String url = req.getRequestURI().toString();

		if (url.contains("addTopic")) {
			TopicTest topic = new TopicTest();
			try {

				// BeanUtils.populate(topic, req.getParameterMap());
				topic.setTopicName(req.getParameter("name"));
				topic.setDescription(req.getParameter("description"));
				topic.setTopicId("ID");
				long millis = System.currentTimeMillis();
				Date date = new Date(millis);
				topic.setCreateTime(date);

				if (req.getPart("image").getSize() != 0) {
					// tạo tên file mới để khỏi bị trùng
					String fileName = "" + System.currentTimeMillis();
					topic.setImage(UploadUtils.processUpload("image", req, Constants.DIR + "\\topicIMG\\", fileName));
				}
				// prod.setCategory(cateService.findOne(prod.getProductID()));
				topicService.addTopic(topic);

				req.setAttribute("topic", topic);
				req.setAttribute("messSuccess", "Thanh cong");
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("messError", e.getMessage());
			}

			resp.sendRedirect(req.getContextPath() + "/admin/listTopic");

		} else if (url.contains("addMockTest")) {
			
			MockTest test = new MockTest();
			try {

				// BeanUtils.populate(topic, req.getParameterMap());
				test.setTestId("");
				test.setTestName(req.getParameter("name"));
				test.setDescription(req.getParameter("description"));
				test.setCost(1);
				TopicTest topic = topicService.getOneTopicTest(req.getParameter("id"));
				test.setTopicTests(topic);

				
				mockService.insert(test);
				

				req.setAttribute("test", test);
				req.setAttribute("messSuccess", "mock test ok");
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("messError", e.getMessage());
			}

			// RequestDispatcher rd = req.getRequestDispatcher("listTopic"); // file .jsp
			// viết giao diện
			// rd.forward(req, resp);
			resp.sendRedirect(req.getContextPath() + "/admin/listTopic");

		} else if (url.contains("updateTopic")) {
			TopicTest topic = new TopicTest();
			try {

				topic.setTopicName(req.getParameter("name"));
				topic.setDescription(req.getParameter("description"));
				topic.setTopicId(req.getParameter("id"));

				long millis = System.currentTimeMillis();
				Date date = new Date(millis);
				topic.setCreateTime(date);

				TopicTest oldModel = topicService.getOneTopicTest(topic.getTopicId());

				if (req.getPart("image").getSize() == 0) {
					topic.setImage(oldModel.getImage());
				} else {
					//xoa anh cu
					if (oldModel.getImage() != null) {
						String fileImg = oldModel.getImage();
						DeleteImage.deleteImage(oldModel.getImage(), Constants.FOLDER_TOPIC);
					}
					//update anh moi
					String fileName = "" + System.currentTimeMillis();
					topic.setImage(UploadUtils.processUpload("image", req, Constants.DIR + "\\"+ Constants.FOLDER_TOPIC +"\\", fileName));
				}

				topicService.updateTopic(topic);
				req.setAttribute("messSuccess", "OKKKK");
			} catch (Exception e) {
				req.setAttribute("messError", e.getMessage());
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/listTopic");

		} else if (url.contains("updateMockTest")) {
			MockTest test = new MockTest();
			try {

				// BeanUtils.populate(topic, req.getParameterMap());
				test.setTestId(req.getParameter("id"));
				test.setTestName(req.getParameter("name"));
				test.setDescription(req.getParameter("description"));
				test.setCost(1);
				MockTest tempTest = mockService.findById(req.getParameter("id"));
				TopicTest topic = topicService.getOneTopicTest(tempTest.getTopicTests().getTopicId());
				test.setTopicTests(topic);

				mockService.update(test);

				req.setAttribute("topic", test);
				req.setAttribute("messSuccess", "Thanh cong");
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("messError", e.getMessage());
			}

			resp.sendRedirect(req.getContextPath() + "/admin/listTopic");
		}

	}
}
