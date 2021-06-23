package ru.itis.kpfu.demo.model;

import lombok.Builder;

import javax.persistence.*;

@Entity
@Builder
public class StudentStateInTheCourse {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private Integer state = -1;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "guide_id")
    private Guide lastGuide;

    public StudentStateInTheCourse() {
    }

    public StudentStateInTheCourse(Long id, Course course, User user, Integer state, Guide lastGuide) {
        this.id = id;
        this.course = course;
        this.user = user;
        this.state = state;
        this.lastGuide = lastGuide;
    }

    public StudentStateInTheCourse(Course course, User user, Integer state, Guide lastGuide) {
        this.course = course;
        this.user = user;
        this.state = state;
        this.lastGuide = lastGuide;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Guide getLastGuide() {
        return lastGuide;
    }

    public void setLastGuide(Guide lastGuide) {
        this.lastGuide = lastGuide;
    }

    @Override
    public String toString() {
        return "StudentStateInTheCourse{" +
                "id=" + id +
                ", course=" + course +
                ", user=" + user +
                ", state=" + state +
                ", lastGuide=" + lastGuide +
                '}';
    }
}
