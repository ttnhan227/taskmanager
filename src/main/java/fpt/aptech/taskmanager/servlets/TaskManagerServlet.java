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

@WebServlet(name = "TaskManagerServlet", urlPatterns = {"", "/home", "/tasks"})
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
            List<Tasks> tasks = em.createNamedQuery("Tasks.findAll", Tasks.class).getResultList();
            em.close();
            emf.close();
            request.setAttribute("tasks", tasks);
            request.getRequestDispatcher("/list.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests here when needed
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method not supported yet");
    }
}
