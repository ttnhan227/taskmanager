package fpt.aptech.taskmanager.repositories;

import fpt.aptech.taskmanager.entities.Tasks;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.Date;
import java.util.List;

public class TasksRepository {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");

    public List<Tasks> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createNamedQuery("Tasks.findAll", Tasks.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<Tasks> findWithFilters(Date fromDate, Date toDate, String sortBy, String order) {
        EntityManager em = emf.createEntityManager();
        try {
            StringBuilder jpql = new StringBuilder("SELECT t FROM Tasks t WHERE 1=1");
            
            if (fromDate != null) {
                jpql.append(" AND t.dueDate >= :fromDate");
            }
            if (toDate != null) {
                jpql.append(" AND t.dueDate <= :toDate");
            }
            if (sortBy != null && !sortBy.isEmpty()) {
                jpql.append(" ORDER BY t.").append(sortBy);
                if (order != null && order.equalsIgnoreCase("desc")) {
                    jpql.append(" DESC");
                } else {
                    jpql.append(" ASC");
                }
            }
            
            var query = em.createQuery(jpql.toString(), Tasks.class);
            
            if (fromDate != null) {
                query.setParameter("fromDate", fromDate);
            }
            if (toDate != null) {
                query.setParameter("toDate", toDate);
            }
            
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public Tasks findById(Integer id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Tasks.class, id);
        } finally {
            em.close();
        }
    }

    public void save(Tasks task) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(task);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void update(Tasks task) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(task);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void delete(Integer id) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Tasks task = em.find(Tasks.class, id);
            if (task != null) {
                em.remove(task);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
} 