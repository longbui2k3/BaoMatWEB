package hcmute.controllers;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hcmute.entity.Blog;
import hcmute.entity.Course;
import hcmute.entity.User;
import hcmute.services.AdminAnalysServiceImpl;
import hcmute.services.BlogServiceImpl;
import hcmute.services.IAdminAnalysService;
import hcmute.services.IBlogService;
import hcmute.services.IUserService;
import hcmute.services.UserServiceImpl;

@WebServlet(urlPatterns = { "/admin/analytics" })
public class AdminAnalyticsController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	IAdminAnalysService adminAnaService = new AdminAnalysServiceImpl();
	IUserService userService = new UserServiceImpl();
	IBlogService blogService = new BlogServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String url = req.getRequestURI().toString();
		if (url.contains("analytics")) {

			Long countUser = adminAnaService.countUser(); 
			Long countCourse = adminAnaService.countCourse();
			Long sumRevenue =adminAnaService.sumRevenue();
			Long[] data = new Long[12];
			
			for(int i = 0; i < 12; i++) {
				data[i] = adminAnaService.costWithMonth(i+ 1);
			}
	
			Long[] data1 = new Long[12];
			for (int i = 0 ; i < 12; i++) {
				data1[i] =  Math.round((double) (data[i]) / (sumRevenue) *100) ;
			}

	
			Gson gson = new Gson();
			String jsonData = gson.toJson(data);
			req.setAttribute("jsonData", jsonData);
			
			Gson gson1 = new Gson();
			String jsonData1 = gson1.toJson(data1);
			req.setAttribute("jsonData1", jsonData1);
			

			req.setAttribute("sumRevenue", sumRevenue);
			req.setAttribute("countUser", countUser);
			req.setAttribute("countCourse", countCourse);

			List<String> userId = adminAnaService.userIdDescreaseCost();
			List<String> userIdJsp = new ArrayList<>();
			
			
			List<User> user = new ArrayList<User>();
			List<Long> countCourse1 = new ArrayList<>();
			List<Long> countRating1 = new ArrayList<>();
			List<Long> sumCost = new ArrayList<>();
			List<Course> listCourse = adminAnaService.listCourseOrderByTime();
			List<Course> listCourseJsp = new ArrayList<>();
			
			if(listCourse.size() > 4) {
				for(int i = 0; i < 4; i++) {
					listCourseJsp.add(listCourse.get(i));
				}
			}else {
				for(int i = 0; i < listCourse.size(); i++) {
					listCourseJsp.add(listCourse.get(i));
				}
			}
			
			if(userId.size() < 5) {
				for(int i = 0; i < userId.size(); i++) {
					userIdJsp.add(userId.get(i));
					user.add(adminAnaService.findUserByUserId(userId.get(i)));
					countCourse1.add(adminAnaService.countCourseByUserId(userId.get(i)));
					countRating1.add(adminAnaService.countRatingByUserId(userId.get(i)));
					sumCost.add(adminAnaService.sumCostByUserId(userId.get(i)));
				}
			}
			else {
				for(int i = 0; i < 5; i++) {
					userIdJsp.add(userId.get(i));
					user.add(adminAnaService.findUserByUserId(userId.get(i)));
					countCourse1.add(adminAnaService.countCourseByUserId(userId.get(i)));
					countRating1.add(adminAnaService.countRatingByUserId(userId.get(i)));
					sumCost.add(adminAnaService.sumCostByUserId(userId.get(i)));
				}
			}
			
			
			List<Blog> blog = blogService.findAllBlogDesTime();
			List<Blog> blogJsp = new ArrayList<Blog>();
			if(blog.size() > 4) {
				for(int i = 0; i < 4; i++) {
					blogJsp.add(blog.get(i));
				}
			}else {
				for(int i = 0; i < blog.size(); i++) {
					blogJsp.add(blog.get(i));
				}
			}
			
			System.out.print("BlogJSP" + blogJsp.size());
			
			LocalDateTime[] localDateTime = new LocalDateTime[blogJsp.size()];
			Instant[] instant = new Instant[blogJsp.size()];
			List<Long> differentHour = new ArrayList<>();
			List<Long> differentMinute = new ArrayList<>();
			List<Long> differentSecond = new ArrayList<>(); 

			int numberOfElements = 4; 
			for (int i = 0; i < numberOfElements; i++) {
			    differentSecond.add(0L); 
			}
	        LocalDateTime now = LocalDateTime.now(); 

			
			for(int i = 0; i < blogJsp.size(); i++) {
				instant[i] = blogJsp.get(i).getCreatedDate().toInstant();
		        localDateTime[i] = instant[i].atZone(ZoneId.systemDefault()).toLocalDateTime();
		        differentHour.add(ChronoUnit.HOURS.between(localDateTime[i], now));				
			}
			for(int i = 0 ; i < differentHour.size(); i++) {
				if(differentHour.get(i) == 0) {
		        	differentMinute.add(ChronoUnit.MINUTES.between(localDateTime[i], now));

					  if(differentMinute.get(i) ==0) {
					  differentSecond.add(ChronoUnit.SECONDS.between(localDateTime[i], now)); }
					 	 
		        }			
			}
			
			req.setAttribute("differentHour", differentHour);
			req.setAttribute("differentMinute", differentMinute);
			req.setAttribute("differentSecond", differentSecond);
			System.out.print("Hour: " + differentHour);
			System.out.print("Minute: " + differentMinute);
			System.out.print("Second: " + differentSecond);
			
			
			List<String> image = new ArrayList<String>();
			List<String> imageCourse = new ArrayList<String>();
			for(int i = 0; i < user.size(); i++) {
				image.add(user.get(i).getImage());
			}
			for (int i = 0; i < listCourseJsp.size(); i++) {
				imageCourse.add(listCourseJsp.get(i).getImage());
			}
			
			System.out.print("user la: " + userId);
			System.out.print("course la: " + countCourse1);
			for(int i = 0; i < imageCourse.size(); i++) {
				System.out.print("ImageCOurse la: " + imageCourse.get(i));
			}
			
			
			req.setAttribute("userId", userIdJsp);
			req.setAttribute("imageCourse", imageCourse);
			req.setAttribute("image", image);
			req.setAttribute("countCourse1", countCourse1);
			req.setAttribute("countRating1", countRating1);
			req.setAttribute("sumCost", sumCost);
			req.setAttribute("listCourseJsp", listCourseJsp);
			req.setAttribute("blogJsp", blogJsp);
			
			
			
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Analytics.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}