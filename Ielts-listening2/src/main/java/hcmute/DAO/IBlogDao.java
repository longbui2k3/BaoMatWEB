package hcmute.DAO;

import java.util.List;

import hcmute.entity.Blog;

public interface IBlogDao {
	List<Blog> findAll(String searchStr);
	List<Blog> findAll(int page, int pagesize, String searchStr);
	List<Blog> findAllBlogDesTime();
}
