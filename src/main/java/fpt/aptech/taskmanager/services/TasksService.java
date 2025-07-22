package fpt.aptech.taskmanager.services;

import fpt.aptech.taskmanager.entities.Tasks;
import fpt.aptech.taskmanager.repositories.TasksRepository;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class TasksService {
    private final TasksRepository repository = new TasksRepository();

    public List<Tasks> getAllTasks() {
        return repository.findAll();
    }

    public Tasks getTaskById(Integer id) {
        return repository.findById(id);
    }

    public void createTask(Tasks task) throws IllegalArgumentException {
        validateTask(task);
        task.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        task.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
        repository.save(task);
    }

    public void updateTask(Tasks task) throws IllegalArgumentException {
        validateTask(task);
        task.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
        repository.update(task);
    }

    public void deleteTask(Integer id) {
        repository.delete(id);
    }
    
    //Phat
    public void deleteCompletedTasks() {
        List<Tasks> completedTasks = repository.findAll().stream()
                .filter(t -> Boolean.TRUE.equals(t.getIsCompleted()))
                .collect(Collectors.toList());
        for (Tasks task : completedTasks) {
            repository.delete(task.getId());
        }
    }
    
    //Phat
    public void toggleTaskStatus(int id, boolean isCompleted) {
        Tasks task = repository.findById(id);
        if (task != null) {
            task.setIsCompleted(isCompleted);
            task.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            repository.update(task);
        }
    }

    public List<Tasks> getTasksByCompletion(boolean isCompleted) {
        return repository.findAll().stream()
                .filter(t -> Objects.equals(t.getIsCompleted(), isCompleted))
                .collect(Collectors.toList());
    }

    public List<Tasks> getTasksByDueDate(Date dueDate) {
        return repository.findAll().stream()
                .filter(t -> dueDate.equals(t.getDueDate()))
                .collect(Collectors.toList());
    }

    private void validateTask(Tasks task) {
        if (task.getTitle() == null || task.getTitle().trim().isEmpty()) {
            throw new IllegalArgumentException("Task title must not be empty");
        }
        if (task.getDueDate() != null && task.getDueDate().before(new Date(System.currentTimeMillis()))) {
            throw new IllegalArgumentException("Due date cannot be in the past");
        }
        if (task.getPriority() != null && !task.getPriority().isEmpty()) {
            String p = task.getPriority().toLowerCase();
            if (!(p.equals("low") || p.equals("medium") || p.equals("high"))) {
                throw new IllegalArgumentException("Priority must be Low, Medium, or High");
            }
        }
        // Optionally validate tags (comma-separated words)
        if (task.getTags() != null && !task.getTags().matches("^([\\w\\s]+,)*[\\w\\s]+$")) {
            throw new IllegalArgumentException("Tags must be comma-separated words");
        }
        // Category can be optional
    }
} 