package hcmute.services;

import java.util.List;

import hcmute.DAO.BlogDaoImpl;
import hcmute.entity.Blog;

public class BlogServiceImpl implements IBlogService {

	BlogDaoImpl blogDao = new BlogDaoImpl();
	@Override
	public List<Blog> findAll() {
		// TODO Auto-generated method stub
		System.out.print("HEREEEEEEEEE SERVICE");
		return blogDao.findAll();
	}

	@Override
	public Blog findOneById(String id) {
		// TODO Auto-generated method stub
		return blogDao.findById(id);
	}

	@Override
	public void insert(Blog blog) {
		// TODO Auto-generated method stub
		blogDao.insert(blog);
	}

	@Override
	public void update(Blog blog) {
		// TODO Auto-generated method stub
		blogDao.update(blog);
	}

	@Override
	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		blogDao.delete(id);
	}

	@Override
	public List<Blog> Find3blog(String id) {
		return blogDao.Find3blog(id);
	}

	@Override
	public List<Blog> findAll(String searchStr) {
		// TODO Auto-generated method stub
		return blogDao.findAll(searchStr);
	}

	@Override
	public List<Blog> findAll(int page, int pagesize, String searchStr) {
		// TODO Auto-generated method stub
		return blogDao.findAll(page, pagesize, searchStr);
	}
	@Override
	public List<Blog> findAllBlogDesTime() {
		
		return blogDao.findAllBlogDesTime();
	}

	
}
