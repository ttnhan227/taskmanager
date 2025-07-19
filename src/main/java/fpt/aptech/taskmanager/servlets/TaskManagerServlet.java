package fpt.aptech.taskmanager.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

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
            // This can be implemented later for task management
            response.sendRedirect("tasks.jsp");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests here when needed
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method not supported yet");
    }
}
