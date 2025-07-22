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
    <link rel="stylesheet" href="styles.css" type="text/css">
    <style>
        .truncate {
            max-width: 180px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .nowrap {
            white-space: nowrap;
        }
        .col-id { width: 50px; }
        .col-title { width: 180px; }
        .col-description { width: 180px; }
        .col-date { width: 120px; }
        .col-category { width: 110px; }
        .col-tags { width: 120px; }
        .col-priority { width: 90px; }
        .col-actions { width: 160px; }
.actions-inline { display: flex; gap: 0.5rem; }
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
            <!-- Delete all completed tasks button -->
            <form method="post" action="tasks/deleteCompleted">
                <button class="btn btn-danger btn-sm mb-3" type="submit" onclick="return confirm('Delete all completed tasks?')">
                    Delete Completed Tasks
                </button>
            </form>
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
            <div class="table-responsive">
            <table class="table table-striped table-bordered align-middle">
                <thead>
                    <tr>
                        <th class="col-id">ID</th>
                        <th class="col-title">Title</th>
                        <th class="col-description">Description</th>
                        <th class="col-date nowrap">Due Date</th>
                        <th>Completed</th>
                        <th class="col-date nowrap">Created At</th>
                        <th class="col-date nowrap">Updated At</th>
                        <th class="col-category">Category</th>
                        <th class="col-tags">Tags</th>
                        <th class="col-priority">Priority</th>
                        <th class="col-actions">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Tasks> tasks = (List<Tasks>) request.getAttribute("tasks");
                        if (tasks != null && !tasks.isEmpty()) {
                            for (Tasks task : tasks) {
                    %>
                    <tr>
                        <td class="col-id"><%= task.getId() %></td>
                        <td class="col-title truncate" title="<%= task.getTitle() %>"><%= task.getTitle() %></td>
                        <td class="col-description truncate" title="<%= task.getDescription() %>"><%= task.getDescription() %></td>
                        <td class="col-date nowrap"><%= task.getDueDate() %></td>
                        <td><%= task.getIsCompleted() != null && task.getIsCompleted() ? "Yes" : "No" %></td>
                        <td class="col-date nowrap"><%= task.getCreatedAt() %></td>
                        <td class="col-date nowrap"><%= task.getUpdatedAt() %></td>
                        <td class="col-category"><%= task.getCategory() %></td>
                        <td class="col-tags"><%= task.getTags() %></td>
                        <td class="col-priority"><%= task.getPriority() %></td>
                        <td class="col-actions">
                            <div class="actions-inline">
                                <%
                                    String contextPath = request.getContextPath();
                                %>
                                <a href="<%= contextPath %>/tasks/details?id=<%= task.getId() %>" class="btn btn-sm btn-info">Details</a>
                                <a href="<%= contextPath %>/tasks/edit?id=<%= task.getId() %>" class="btn btn-sm btn-warning">Edit</a>
                                <!-- Toggle status button -->
                                <form method="post" action="tasks/toggleStatus" style="display:inline">
                                    <input type="hidden" name="id" value="<%= task.getId() %>" />
                                    <input type="hidden" name="isCompleted" value="<%= !Boolean.TRUE.equals(task.getIsCompleted()) %>" />
                                    <button type="submit" class="btn btn-sm <%= Boolean.TRUE.equals(task.getIsCompleted()) ? "btn-secondary" : "btn-success" %>">
                                        <%= Boolean.TRUE.equals(task.getIsCompleted()) ? "Completed" : "Mark Complete" %>
                                    </button>
                                </form>
                                <!-- Delete button -->
                                <form method="get" action="<%= request.getContextPath() %>/tasks/delete" style="display:inline" onsubmit="return confirm('Go to delete confirmation?');">
                                    <input type="hidden" name="id" value="<%= task.getId() %>" />
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="10" class="text-center">No tasks found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
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