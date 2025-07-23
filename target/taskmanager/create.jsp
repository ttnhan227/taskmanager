<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fpt.aptech.taskmanager.entities.Tasks" %>
<%
    Tasks task = (Tasks) request.getAttribute("task");
    String error = (String) request.getAttribute("error");
    String contextPath = request.getContextPath();
    if (task == null) {
        task = new Tasks();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= contextPath %>/styles.css" type="text/css">
</head>
<body>
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="<%= contextPath %>/home">TaskManager</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= contextPath %>/tasks">Tasks</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="main-content">
        <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h2 class="mb-4">Create New Task</h2>
                <% if (error != null) { %>
                    <div class="alert alert-danger"><%= error %></div>
                <% } %>
                <form action="<%= contextPath %>/tasks/create" method="post">
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="<%= task.getTitle() != null ? task.getTitle() : "" %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3"><%= task.getDescription() != null ? task.getDescription() : "" %></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="dueDate" class="form-label">Due Date</label>
                        <input type="date" class="form-control" id="dueDate" name="dueDate" value="<%= task.getDueDate() != null ? task.getDueDate().toString() : "" %>">
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="isCompleted" name="isCompleted" <%= task.getIsCompleted() != null && task.getIsCompleted() ? "checked" : "" %>>
                        <label class="form-check-label" for="isCompleted">Completed</label>
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <input type="text" class="form-control" id="category" name="category" value="<%= task.getCategory() != null ? task.getCategory() : "" %>">
                    </div>
                    <div class="mb-3">
                        <label for="tags" class="form-label">Tags (comma separated)</label>
                        <input type="text" class="form-control" id="tags" name="tags" value="<%= task.getTags() != null ? task.getTags() : "" %>">
                    </div>
                    <div class="mb-3">
                        <label for="priority" class="form-label">Priority</label>
                        <select class="form-select" id="priority" name="priority">
                            <option value="" <%= task.getPriority() == null || task.getPriority().isEmpty() ? "selected" : "" %>>Select priority</option>
                            <option value="Low" <%= "Low".equalsIgnoreCase(task.getPriority()) ? "selected" : "" %>>Low</option>
                            <option value="Medium" <%= "Medium".equalsIgnoreCase(task.getPriority()) ? "selected" : "" %>>Medium</option>
                            <option value="High" <%= "High".equalsIgnoreCase(task.getPriority()) ? "selected" : "" %>>High</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Create Task</button>
                    <a href="<%= contextPath %>/tasks" class="btn btn-secondary ms-2">Cancel</a>
                </form>
            </div>
        </div>
    </div>
        </div>
    <footer class="footer text-center">
        <div class="container">
            <p class="mb-0">&copy; 2023 TaskManager. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
