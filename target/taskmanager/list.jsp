<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fpt.aptech.taskmanager.entities.Tasks" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .table-container {
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Task Manager</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="tasks">Tasks</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container table-container">
        <h2 class="mb-4">Task List</h2>
        <!-- Filter & Sort Form -->
        <form class="row g-3 mb-4 p-3 bg-white rounded shadow-sm" method="get" action="tasks">
            <div class="col-md-3 col-12">
                <label for="fromDate" class="form-label">From Due Date</label>
                <input type="date" class="form-control" id="fromDate" name="fromDate" value="<%= request.getParameter("fromDate") != null ? request.getParameter("fromDate") : "" %>">
            </div>
            <div class="col-md-3 col-12">
                <label for="toDate" class="form-label">To Due Date</label>
                <input type="date" class="form-control" id="toDate" name="toDate" value="<%= request.getParameter("toDate") != null ? request.getParameter("toDate") : "" %>">
            </div>
            <div class="col-md-3 col-6">
                <label for="sortBy" class="form-label">Sort By</label>
                <select class="form-select" id="sortBy" name="sortBy">
                    <option value="">-- None --</option>
                    <option value="dueDate" <%= "dueDate".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Due Date</option>
                    <option value="title" <%= "title".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Title</option>
                    <option value="createdAt" <%= "createdAt".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Created At</option>
                </select>
            </div>
            <div class="col-md-2 col-6">
                <label for="order" class="form-label">Order</label>
                <select class="form-select" id="order" name="order">
                    <option value="asc" <%= "asc".equals(request.getParameter("order")) ? "selected" : "" %>>Ascending</option>
                    <option value="desc" <%= "desc".equals(request.getParameter("order")) ? "selected" : "" %>>Descending</option>
                </select>
            </div>
            <div class="col-md-1 col-12 d-flex align-items-end">
                <button type="submit" class="btn btn-primary w-100">Filter</button>
            </div>
        </form>
        <!-- Loading State (CSS only, hidden by default) -->
        <div id="loadingState" class="d-none text-center my-5">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <div class="mt-3">Loading tasks...</div>
        </div>
        <!-- Task Cards -->
        <div class="row" id="taskCards">
            <%
                List<Tasks> tasks = (List<Tasks>) request.getAttribute("tasks");
                if (tasks != null && !tasks.isEmpty()) {
                    for (Tasks task : tasks) {
            %>
            <div class="col-lg-4 col-md-6 col-12 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title">
                            <a href="tasks/details?id=<%= task.getId() %>" class="text-decoration-none text-primary fw-bold">
                                <%= task.getTitle() %>
                            </a>
                        </h5>
                        <p class="card-text text-muted mb-2"><%= task.getDescription() %></p>
                        <ul class="list-unstyled mb-3">
                            <li><strong>Due Date:</strong> <%= task.getDueDate() %></li>
                            <li><strong>Completed:</strong> <span class="badge <%= task.getIsCompleted() != null && task.getIsCompleted() ? "bg-success" : "bg-secondary" %>"><%= task.getIsCompleted() != null && task.getIsCompleted() ? "Yes" : "No" %></span></li>
                            <li><strong>Created At:</strong> <%= task.getCreatedAt() %></li>
                            <li><strong>Updated At:</strong> <%= task.getUpdatedAt() %></li>
                        </ul>
                        <a href="tasks/details?id=<%= task.getId() %>" class="btn btn-outline-primary btn-sm">View Details</a>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <!-- Empty State -->
            <div class="col-12 text-center my-5">
                <img src="https://cdn-icons-png.flaticon.com/512/4076/4076549.png" alt="No tasks" style="width:100px;opacity:0.5;">
                <h4 class="mt-3 text-muted">No tasks found</h4>
                <p class="text-muted">Try adjusting your filters or add a new task!</p>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0">&copy; 2023 Task Manager. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Fake loading state for demo (remove if using real async loading)
        // Show loading spinner for 0.5s on page load
        document.addEventListener('DOMContentLoaded', function() {
            var loading = document.getElementById('loadingState');
            var cards = document.getElementById('taskCards');
            loading.classList.remove('d-none');
            cards.classList.add('d-none');
            setTimeout(function() {
                loading.classList.add('d-none');
                cards.classList.remove('d-none');
            }, 500);
        });
    </script>
</body>
</html> 