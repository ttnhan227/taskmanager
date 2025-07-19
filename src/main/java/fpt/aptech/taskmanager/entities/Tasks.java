package fpt.aptech.taskmanager.entities;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "tasks")
@NamedQueries({ @NamedQuery(name = "Tasks.findAll", query = "SELECT t FROM Tasks t"),
		@NamedQuery(name = "Tasks.findById", query = "SELECT t FROM Tasks t WHERE t.id = :id"),
		@NamedQuery(name = "Tasks.findByTitle", query = "SELECT t FROM Tasks t WHERE t.title = :title"),
		@NamedQuery(name = "Tasks.findByDueDate", query = "SELECT t FROM Tasks t WHERE t.dueDate = :dueDate"),
		@NamedQuery(name = "Tasks.findByIsCompleted", query = "SELECT t FROM Tasks t WHERE t.isCompleted = :isCompleted") })
public class Tasks implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Integer id;

	@Column(name = "title")
	private String title;

	@Column(name = "description")
	private String description;

	@Column(name = "due_date")
	private Date dueDate;

	@Column(name = "is_completed")
	private Boolean isCompleted;

	@Column(name = "created_at")
	private Timestamp createdAt;

	@Column(name = "updated_at")
	private Timestamp updatedAt;

	public Tasks() {
	}

	public Tasks(String title, String description, Date dueDate, Boolean isCompleted, Timestamp createdAt,
			Timestamp updatedAt) {
		this.title = title;
		this.description = description;
		this.dueDate = dueDate;
		this.isCompleted = isCompleted;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Boolean getIsCompleted() {
		return isCompleted;
	}

	public void setIsCompleted(Boolean isCompleted) {
		this.isCompleted = isCompleted;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

}