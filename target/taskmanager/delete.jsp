<%@ page import="fpt.aptech.taskmanager.entities.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Tasks task = (Tasks) request.getAttribute("task");
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Delete Task</title>
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
            <h3 class="text-danger">Confirm Delete Task</h3>
            <p>Are you sure you want to delete the following task?</p>

            <ul class="list-group mb-3">
                <li class="list-group-item"><strong>Title:</strong> <%= task.getTitle() %></li>
                <li class="list-group-item"><strong>Description:</strong> <%= task.getDescription() %></li>
                <li class="list-group-item"><strong>Due Date:</strong> <%= task.getDueDate() %></li>
            </ul>

            <form method="post" action="delete">
                <input type="hidden" name="id" value="<%= task.getId() %>" />
                <button class="btn btn-danger" type="submit">Yes, Delete</button>
                <a href="tasks" class="btn btn-secondary">Cancel</a>
            </form>
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