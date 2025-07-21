<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Manager</title>
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
                        <a class="nav-link active" href="home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="tasks">Tasks</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
<%
    String username = request.getRemoteUser();
%>
<% if (username == null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="tasks">Login</a>
                    </li>
<% } else { %>
                    <li class="nav-item">
                        <span class="navbar-text text-primary">Hello, <%= username %>!</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>
<% } %>
                </ul>
            </div>
        </div>
    </nav>
    <div class="main-content">
        <section class="hero-section">
            <div class="container">
                <div class="hero-title">Organize Your Work, Effortlessly</div>
                <div class="hero-subtitle">A modern, intuitive task manager to help you stay productive and on track.</div>
                <a href="tasks" class="cta-btn">View Tasks</a>
            </div>
        </section>
        <section class="features-section container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">📝</div>
                        <h5>Intuitive Task Management</h5>
                        <p>Easily create, update, and organize your tasks with a user-friendly interface.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">⏰</div>
                        <h5>Smart Reminders</h5>
                        <p>Never miss a deadline with built-in reminders and notifications.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">📊</div>
                        <h5>Progress Tracking</h5>
                        <p>Monitor your productivity and track your progress over time.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <footer class="footer text-center">
        <div class="container">
            <p class="mb-0">&copy; 2023 TaskManager. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>