package JPAConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAConfig {
	private static EntityManagerFactory factory;
	static {
		factory = Persistence.createEntityManagerFactory("IeltsListeningWeb");
	}

	public static EntityManager getEntityManager() {
		return factory.createEntityManager();
	}
}
