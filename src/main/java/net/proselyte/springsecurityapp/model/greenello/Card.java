package net.proselyte.springsecurityapp.model.greenello;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "greenello_card")
public class Card {

    @Id
    private Long id;

    @Column(name = "creator_id")
    private Long creatorId;

    @Column(name = "create_date")
    private Date create_date;

    @Column(name = "status")
    private String status;

    @Column(name = "queue_position")
    private Long queue_position;

    @Column(name = "summary")
    private String summary;

    @Column(name = "description")
    private String description;

    @Column(name = "assignee_id")
    private Long assignee_id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Long creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getQueue_position() {
        return queue_position;
    }

    public void setQueue_position(Long queue_position) {
        this.queue_position = queue_position;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getAssignee_id() {
        return assignee_id;
    }

    public void setAssignee_id(Long assignee_id) {
        this.assignee_id = assignee_id;
    }
}
