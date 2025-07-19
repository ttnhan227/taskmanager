# Task Manager Web Application

A simple yet powerful task management web application built with Jakarta EE, JPA/Hibernate, and PostgreSQL.

## 🌟 Features

- ✏️ Create and edit tasks with title, description, and due date
- 📅 View tasks filtered by date
- ✅ Mark tasks as complete
- 🗑️ Delete individual or completed tasks
- 🎨 Clean and responsive user interface

## 🛠️ Prerequisites

- Java SE 21 or later
- Apache Maven 3.9.0 or later
- PostgreSQL 12+
- Jakarta EE 10+ compatible server (e.g., Payara, WildFly, or GlassFish)


## 🏗️ Project Structure

```
src/main/
├── java/
│   └── fpt/aptech/taskmanager/
│       ├── entities/      # JPA entities (e.g., Tasks.java)
│       ├── repositories/  # Data access layer
│       ├── services/      # Business logic layer
│       ├── servlets/      # Web controllers
│       └── utils/         # Utility classes
├── resources/             # Configuration files (persistence.xml, etc.)
└── webapp/                # Web resources (JSP, CSS, JS)
    ├── WEB-INF/           # Web deployment descriptors
    ├── css/               # Stylesheets
    ├── js/                # JavaScript files
    └── *.jsp              # View templates
```

### Architecture Overview

- **Entities**: Contains JPA entity classes that map to database tables
- **Repositories**: Handles data access and database operations
- **Services**: Implements business logic and application rules
- **Servlets**: Handles HTTP requests and responses
- **Utils**: Contains helper and utility classes

## 👥 Team

### Anh: Task Creation
- **Feature**:
  - Implement task creation endpoint
  - Handle form validation
  - Save tasks to database
- **UI/UX**:
  - Design task creation form
  - Implement form validation feedback
  - Create success/error notifications
  - Ensure responsive design for creation form

### Vi: Task List & Filtering
- **Feature**:
  - Implement task retrieval endpoints
  - Add date filtering logic
  - Handle sorting functionality
  - Details page
- **UI/UX**:
  - Design task list view
  - Implement date filter controls
  - Create responsive task cards
  - Add loading states and empty states

### Phat: Task Deletion & Management
- **Feature**:
  - Implement task deletion endpoint
  - Add batch delete for completed tasks
  - Handle task status updates
- **UI/UX**:
  - Add delete buttons with confirmation dialogs
  - Implement "Delete Completed" feature
  - Create status toggle controls
  - Add visual feedback for actions

### Nhan: Task Editing & Advanced Features
- **Feature**:
  - Implement task update endpoint
  - Add input validation
  - Add task categories/tags
  - Implement task priority levels
- **UI/UX**:
  - Design edit task modal
  - Add category/priority selectors
  - Create consistent form styling
  - Add keyboard shortcuts for common actions

