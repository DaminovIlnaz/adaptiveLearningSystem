package ru.itis.kpfu.demo.model;

import lombok.Builder;

import javax.persistence.*;
import java.util.Set;

@Entity
@Builder
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String description;

    @OneToMany(mappedBy = "course", fetch = FetchType.EAGER)
    Set<StudentStateInTheCourse> userCourses;

    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Skill> skills;

    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Guide> guides;

    public Course() {
    }

    public Course(Long id, String name, String description, Set<StudentStateInTheCourse> userCourses, Set<Skill> skills, Set<Guide> guides) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.userCourses = userCourses;
        this.skills = skills;
        this.guides = guides;
    }

    public Set<Guide> getGuides() {
        return guides;
    }

    public void setGuides(Set<Guide> guides) {
        this.guides = guides;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Skill> getSkills() {
        return skills;
    }

    public void setSkills(Set<Skill> skills) {
        this.skills = skills;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<StudentStateInTheCourse> getUserCourses() {
        return userCourses;
    }

    public void setUserCourses(Set<StudentStateInTheCourse> userCourses) {
        this.userCourses = userCourses;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", userCourses=" + userCourses +
                '}';
    }
}
