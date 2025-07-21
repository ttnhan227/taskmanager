<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Manager</title>
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
            padding: 5rem 0 3rem 0;
            text-align: center;
        }
        .hero-title {
            font-size: 3rem;
            font-weight: 800;
            color: #222;
            margin-bottom: 1rem;
        }
        .hero-subtitle {
            font-size: 1.3rem;
            color: #5a5a5a;
            margin-bottom: 2.5rem;
        }
        .cta-btn {
            font-size: 1.1rem;
            padding: 0.75rem 2.5rem;
            border-radius: 30px;
            background: #2575fc;
            color: #fff;
            border: none;
            box-shadow: 0 2px 8px rgba(37,117,252,0.08);
            transition: background 0.2s;
        }
        .cta-btn:hover {
            background: #174ea6;
        }
        .features-section {
            margin-top: -2rem;
            padding-bottom: 3rem;
        }
        .feature-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            padding: 2rem 1.5rem;
            margin-bottom: 2rem;
            text-align: center;
            transition: transform 0.2s;
        }
        .feature-card:hover {
            transform: translateY(-6px) scale(1.03);
        }
        .feature-icon {
            font-size: 2.5rem;
            color: #2575fc;
            margin-bottom: 1rem;
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
    <footer class="footer text-center">
        <div class="container">
            <p class="mb-0">&copy; 2023 TaskManager. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>