<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fpt.aptech.taskmanager.entities.Tasks" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="home">TaskManager</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="tasks">Tasks</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="main-content">
        <section class="hero-section">
            <div class="container">
                <div class="hero-title">Your Tasks</div>
                <div class="hero-subtitle">All your tasks, organized and accessible in one place.</div>
            </div>
        </section>
        <div class="container task-panel">
            <h3 class="mb-4 fw-bold">Task List</h3>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Due Date</th>
                        <th>Completed</th>
                        <th>Created At</th>
                        <th>Updated At</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Tasks> tasks = (List<Tasks>) request.getAttribute("tasks");
                        if (tasks != null && !tasks.isEmpty()) {
                            for (Tasks task : tasks) {
                    %>
                    <tr>
                        <td><%= task.getId() %></td>
                        <td><%= task.getTitle() %></td>
                        <td><%= task.getDescription() %></td>
                        <td><%= task.getDueDate() %></td>
                        <td><%= task.getIsCompleted() != null && task.getIsCompleted() ? "Yes" : "No" %></td>
                        <td><%= task.getCreatedAt() %></td>
                        <td><%= task.getUpdatedAt() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No tasks found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
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