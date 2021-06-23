package ru.itis.kpfu.demo.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Skill {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    @OneToMany(mappedBy = "resultSkill", fetch = FetchType.EAGER)
    Set<Guide> guides;

    @OneToMany(mappedBy = "skill", fetch = FetchType.EAGER)
    Set<RequiredSkillCourse> requiredSkillCourses;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "course_id")
    private Course course;

    public Skill() {
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

    public Set<Guide> getGuides() {
        return guides;
    }

    public void setGuides(Set<Guide> guides) {
        this.guides = guides;
    }

    public Set<RequiredSkillCourse> getRequiredSkillCourses() {
        return requiredSkillCourses;
    }

    public void setRequiredSkillCourses(Set<RequiredSkillCourse> requiredSkillCourses) {
        this.requiredSkillCourses = requiredSkillCourses;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
