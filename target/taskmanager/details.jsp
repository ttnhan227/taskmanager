<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fpt.aptech.taskmanager.entities.Tasks" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css" type="text/css">
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
                        <a class="nav-link" href="tasks">Tasks</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h2 class="mb-4">Task Details</h2>
                <%
                    Tasks task = (Tasks) request.getAttribute("task");
                    if (task != null) {
                %>
                <table class="table table-bordered">
                    <tr><th>ID</th><td><%= task.getId() %></td></tr>
                    <tr><th>Title</th><td><%= task.getTitle() %></td></tr>
                    <tr><th>Description</th><td><%= task.getDescription() %></td></tr>
                    <tr><th>Due Date</th><td><%= task.getDueDate() %></td></tr>
                    <tr><th>Completed</th><td><%= task.getIsCompleted() != null && task.getIsCompleted() ? "Yes" : "No" %></td></tr>
                    <tr><th>Created At</th><td><%= task.getCreatedAt() %></td></tr>
                    <tr><th>Updated At</th><td><%= task.getUpdatedAt() %></td></tr>
                </table>
                <a href="../tasks" class="btn btn-secondary">Back to List</a>
                <%
                    } else {
                %>
                <div class="alert alert-danger">Task not found.</div>
                <a href="../tasks" class="btn btn-secondary">Back to List</a>
                <%
                    }
                %>
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