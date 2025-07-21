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
    <style>
        body {
            background: #f4f7fa;
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }
        .navbar-brand {
            font-weight: 700;
            color: #2575fc !important;
            letter-spacing: 1px;
        }
        .nav-link {
            color: #444 !important;
            font-weight: 500;
            margin-left: 1rem;
        }
        .nav-link.active, .nav-link:hover {
            color: #2575fc !important;
        }
        .hero-section {
            background: linear-gradient(120deg, #e0e7ff 0%, #f4f7fa 100%);
            padding: 3rem 0 2rem 0;
            text-align: center;
        }
        .hero-title {
            font-size: 2.2rem;
            font-weight: 800;
            color: #222;
            margin-bottom: 0.5rem;
        }
        .hero-subtitle {
            font-size: 1.1rem;
            color: #5a5a5a;
            margin-bottom: 2rem;
        }
        .task-panel {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            padding: 2.5rem 2rem 2rem 2rem;
            margin-top: -2rem;
            margin-bottom: 2rem;
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 0;
        }
        .table thead {
            background: #2575fc;
            color: white;
        }
        .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: #f2f6fc;
        }
        .table-striped > tbody > tr:nth-of-type(even) {
            background-color: #e9f0fb;
        }
        .table-bordered th, .table-bordered td {
            border: 1px solid #dee2e6;
        }
        .footer {
            background: #fff;
            color: #888;
            padding: 2rem 0 1rem 0;
            border-top: 1px solid #eaeaea;
            margin-top: 3rem;
        }
    </style>
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
    <footer class="footer text-center">
        <div class="container">
            <p class="mb-0">&copy; 2023 TaskManager. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 