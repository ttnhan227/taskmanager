<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fpt.aptech.taskmanager.entities.Tasks" %>
<%
    Tasks task = (Tasks) request.getAttribute("task");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Task</h2>
        <% if (error != null) { %>
            <div class="alert alert-danger"><%= error %></div>
        <% } %>
        <form method="post" action="edit?id=<%= task != null ? task.getId() : "" %>">
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" class="form-control" id="title" name="title" value="<%= task != null ? task.getTitle() : "" %>" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3"><%= task != null ? task.getDescription() : "" %></textarea>
            </div>
            <div class="mb-3">
                <label for="dueDate" class="form-label">Due Date</label>
                <input type="date" class="form-control" id="dueDate" name="dueDate" value="<%= task != null && task.getDueDate() != null ? task.getDueDate().toString() : "" %>">
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="isCompleted" name="isCompleted" <%= task != null && task.getIsCompleted() != null && task.getIsCompleted() ? "checked" : "" %>>
                <label class="form-check-label" for="isCompleted">Completed</label>
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" class="form-control" id="category" name="category" value="<%= task != null ? task.getCategory() : "" %>">
            </div>
            <div class="mb-3">
                <label for="tags" class="form-label">Tags (comma-separated)</label>
                <input type="text" class="form-control" id="tags" name="tags" value="<%= task != null ? task.getTags() : "" %>">
            </div>
            <div class="mb-3">
                <label for="priority" class="form-label">Priority</label>
                <select class="form-select" id="priority" name="priority">
                    <option value="">Select priority</option>
                    <option value="Low" <%= task != null && "Low".equalsIgnoreCase(task.getPriority()) ? "selected" : "" %>>Low</option>
                    <option value="Medium" <%= task != null && "Medium".equalsIgnoreCase(task.getPriority()) ? "selected" : "" %>>Medium</option>
                    <option value="High" <%= task != null && "High".equalsIgnoreCase(task.getPriority()) ? "selected" : "" %>>High</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Update Task</button>
            <a href="tasks" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
