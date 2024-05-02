package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import JPAConfig.JPAConfig;

public abstract class AbstractDao<T> {
	private Class<T> entityClass;

	public AbstractDao(Class<T> cls) {
		this.entityClass = cls;
	}

	public void insert(T entity) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(entity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	public void update(T entity) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(entity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			enma.close();
		}
	}

	public void delete(Object id) throws Exception {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			T entity = enma.find(entityClass, id);
			if (entity != null) {
				enma.remove(entity);
			} else {
				throw new Exception("Không tìm thấy");
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	public T findById(Object id) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			T entity = enma.find(entityClass, id);
			return entity;
		} finally {
			enma.close();
		}
	}

	public Long countAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			// Tạo truy vấn từ entity class
			CriteriaQuery cq = enma.getCriteriaBuilder().createQuery();
			Root<T> rt = cq.from(entityClass);
			cq.select(enma.getCriteriaBuilder().count(rt));
			Query q = enma.createQuery(cq);
			return (Long) q.getSingleResult();
		} finally {
			enma.close();
		}
	}

	public List<T> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			// Tạo truy vấn dữ liệu từ query
			CriteriaQuery cq = enma.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			return enma.createQuery(cq).getResultList();
		} finally {
			enma.close();
		}
	}

	// FindAll nhưng có phân trang

	public List<T> findAll(boolean all, int firstResult, int maxResult) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			CriteriaQuery cq = enma.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			Query q = enma.createQuery(cq);
			if (!all) {
				q.setFirstResult(firstResult);
				q.setMaxResults(maxResult);
			}
			return q.getResultList();
		} finally {
			enma.close();
		}
	}
}
