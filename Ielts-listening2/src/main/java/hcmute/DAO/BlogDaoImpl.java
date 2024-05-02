package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.Blog;

public class BlogDaoImpl extends AbstractDao<Blog> implements IBlogDao {

	public BlogDaoImpl() {
		super(Blog.class);
		// TODO Auto-generated constructor stub
	}

	public List<Blog> Find3blog(String id) {
		EntityManager en = JPAConfig.getEntityManager();
		TypedQuery<Blog> q = null;

		try {
			String jpql = "SELECT b FROM Blog b WHERE b.blogId <> :excludedBlogId ORDER BY b.createdDate DESC";
			q = en.createQuery(jpql, Blog.class).setParameter("excludedBlogId", id).setMaxResults(3);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (en != null && en.isOpen()) {
				en.close();
			}
		}
	}
	
	public List<Blog> findAll(String searchStr) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT B FROM Blog B WHERE ((LOCATE(:searchStr, B.title) > 0) OR (LOCATE(:searchStr, B.content) > 0))";
			TypedQuery<Blog> query = entityManager.createQuery(jpql, Blog.class);
			query.setParameter("searchStr", searchStr);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}

	public List<Blog> findAll(int page, int pagesize, String searchStr) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT B FROM Blog B WHERE ((LOCATE(:searchStr, B.title) > 0) OR (LOCATE(:searchStr, B.content) > 0))";
			TypedQuery<Blog> query = entityManager.createQuery(jpql, Blog.class);
			query.setParameter("searchStr", searchStr);
			query.setFirstResult(page * pagesize);
			query.setMaxResults(pagesize);
			return query.getResultList();
		} catch (Exception e) {
			// Handle your exception (log, rethrow, etc.)
			e.printStackTrace(); // replace with proper logging
			return null; // or throw a custom exception, return an empty list, etc.
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}
	public List<Blog> findAllBlogDesTime(){
		EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT b FROM Blog b WHERE b.status = 1 ORDER BY b.createdDate DESC";
	        TypedQuery<Blog> query = enma.createQuery(jpql, Blog.class);
	        return query.getResultList();
	    } finally {
	        if (enma != null) {
	            enma.close();
	        }
	    }
	}

}
