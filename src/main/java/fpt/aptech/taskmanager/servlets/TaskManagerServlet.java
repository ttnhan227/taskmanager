package fpt.aptech.taskmanager.servlets;

import fpt.aptech.taskmanager.entities.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;

@WebServlet(name = "TaskManagerServlet", urlPatterns = {"", "/home", "/tasks", "/tasks/details"})
public class TaskManagerServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        
        if (path.equals("") || path.equals("/home")) {
            // Forward to the home page
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (path.equals("/tasks")) {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
            EntityManager em = emf.createEntityManager();
            try {
                // Lấy tham số filter và sort
                String fromDateStr = request.getParameter("fromDate");
                String toDateStr = request.getParameter("toDate");
                String sortBy = request.getParameter("sortBy");
                String order = request.getParameter("order");

                StringBuilder jpql = new StringBuilder("SELECT t FROM Tasks t WHERE 1=1");
                if (fromDateStr != null && !fromDateStr.isEmpty()) {
                    jpql.append(" AND t.dueDate >= :fromDate");
                }
                if (toDateStr != null && !toDateStr.isEmpty()) {
                    jpql.append(" AND t.dueDate <= :toDate");
                }
                if (sortBy != null && !sortBy.isEmpty()) {
                    jpql.append(" ORDER BY t." + sortBy);
                    if (order != null && order.equalsIgnoreCase("desc")) {
                        jpql.append(" DESC");
                    } else {
                        jpql.append(" ASC");
                    }
                }
                var query = em.createQuery(jpql.toString(), Tasks.class);
                if (fromDateStr != null && !fromDateStr.isEmpty()) {
                    query.setParameter("fromDate", java.sql.Date.valueOf(fromDateStr));
                }
                if (toDateStr != null && !toDateStr.isEmpty()) {
                    query.setParameter("toDate", java.sql.Date.valueOf(toDateStr));
                }
                List<Tasks> tasks = query.getResultList();
                request.setAttribute("tasks", tasks);
                request.getRequestDispatcher("/list.jsp").forward(request, response);
            } finally {
                em.close();
                emf.close();
            }
        } else if (path.equals("/tasks/details")) {
            // Lấy chi tiết task theo id
            String idStr = request.getParameter("id");
            if (idStr != null && !idStr.isEmpty()) {
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
                EntityManager em = emf.createEntityManager();
                try {
                    int id = Integer.parseInt(idStr);
                    Tasks task = em.find(Tasks.class, id);
                    if (task != null) {
                        request.setAttribute("task", task);
                        request.getRequestDispatcher("/details.jsp").forward(request, response);
                        return;
                    }
                } finally {
                    em.close();
                    emf.close();
                }
            }
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Task not found");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests here when needed
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method not supported yet");
    }
}
