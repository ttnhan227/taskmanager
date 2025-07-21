<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .hero-section {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 5rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 20px 20px;
        }
        .feature-card {
            border: none;
            border-radius: 10px;
            transition: transform 0.3s ease;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #2575fc;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Task Manager</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.jsp">Home</a>
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
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-4">Welcome to Task Manager</h1>
            <p class="lead mb-4">Organize your tasks efficiently and boost your productivity</p>
            <a href="tasks" class="btn btn-light btn-lg px-4 me-2">Get Started</a>
            <a href="#" class="btn btn-outline-light btn-lg px-4">Learn More</a>
        </div>
    </section>

    <!-- Features Section -->
    <section class="container my-5">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="card h-100 p-4 feature-card">
                    <div class="feature-icon">📝</div>
                    <h3>Easy Task Management</h3>
                    <p>Create, update, and organize your tasks with our intuitive interface.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 p-4 feature-card">
                    <div class="feature-icon">⏰</div>
                    <h3>Set Deadlines</h3>
                    <p>Never miss a deadline with our reminder and notification system.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 p-4 feature-card">
                    <div class="feature-icon">📊</div>
                    <h3>Track Progress</h3>
                    <p>Monitor your productivity with our comprehensive task analytics.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0">&copy; 2023 Task Manager. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>