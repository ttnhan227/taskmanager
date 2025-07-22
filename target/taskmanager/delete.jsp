<%@ page import="fpt.aptech.taskmanager.entities.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Tasks task = (Tasks) request.getAttribute("task");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Confirm Delete Task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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
</body>
</html>
