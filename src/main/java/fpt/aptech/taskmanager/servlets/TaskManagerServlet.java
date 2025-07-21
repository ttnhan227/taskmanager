package fpt.aptech.taskmanager.servlets;

import fpt.aptech.taskmanager.entities.Tasks;
import fpt.aptech.taskmanager.services.TasksService;
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
    private final TasksService tasksService = new TasksService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath(); // e.g., /tasks
        String pathInfo = request.getPathInfo();       // e.g., /edit

        if ("/tasks".equals(servletPath) && (pathInfo == null || pathInfo.equals(""))) {
            // List tasks
            List<Tasks> tasks = tasksService.getAllTasks();
            request.setAttribute("tasks", tasks);
            request.getRequestDispatcher("/list.jsp").forward(request, response);
        } else if ("/tasks".equals(servletPath) && "/edit".equals(pathInfo)) {
            // Edit page
            String idStr = request.getParameter("id");
            if (idStr != null) {
                try {
                    int id = Integer.parseInt(idStr);
                    Tasks task = tasksService.getTaskById(id);
                    if (task != null) {
                        request.setAttribute("task", task);
                        request.getRequestDispatcher("/edit.jsp").forward(request, response);
                        return;
                    }
                } catch (NumberFormatException ignored) {}
            }
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Task not found");
        } else if ("/tasks".equals(servletPath) && "/create".equals(pathInfo)) {
            // Create page placeholder
            request.getRequestDispatcher("/create.jsp").forward(request, response);
        } else if ("/tasks".equals(servletPath) && "/delete".equals(pathInfo)) {
            // Delete page placeholder
            request.getRequestDispatcher("/delete.jsp").forward(request, response);
        } else if ("".equals(servletPath) || "/home".equals(servletPath)) {
            // Home page
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath();
        String pathInfo = request.getPathInfo();

        if ("/tasks".equals(servletPath) && "/edit".equals(pathInfo)) {
            // Handle update logic here (same as your previous edit logic)
            String idStr = request.getParameter("id");
            if (idStr != null) {
                try {
                    int id = Integer.parseInt(idStr);
                    Tasks task = tasksService.getTaskById(id);
                    if (task != null) {
                        // Update fields from form
                        task.setTitle(request.getParameter("title"));
                        task.setDescription(request.getParameter("description"));
                        String dueDateStr = request.getParameter("dueDate");
                        if (dueDateStr != null && !dueDateStr.isEmpty()) {
                            task.setDueDate(java.sql.Date.valueOf(dueDateStr));
                        } else {
                            task.setDueDate(null);
                        }
                        task.setIsCompleted("on".equals(request.getParameter("isCompleted")));
                        task.setCategory(request.getParameter("category"));
                        task.setTags(request.getParameter("tags"));
                        task.setPriority(request.getParameter("priority"));
                        try {
                            tasksService.updateTask(task);
                            response.sendRedirect(request.getContextPath() + "/tasks");
                            return;
                        } catch (IllegalArgumentException ex) {
                            request.setAttribute("error", ex.getMessage());
                            request.setAttribute("task", task);
                            request.getRequestDispatcher("/edit.jsp").forward(request, response);
                            return;
                        }
                    }
                } catch (NumberFormatException ignored) {}
            }
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Task not found");
        } else {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method not supported yet");
        }
    }
}
