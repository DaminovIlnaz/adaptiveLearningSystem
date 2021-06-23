package ru.itis.kpfu.demo.model;

import lombok.Builder;

import javax.persistence.*;
import java.util.Set;

@Entity
@Builder
public class Guide {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private String description;
    private Boolean firstGuide;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "skill_id")
    private Skill resultSkill;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "course_id")
    private Course course;

    @OneToMany(mappedBy = "guide", fetch = FetchType.EAGER)
    Set<RequiredSkillCourse> requiredSkillCourses;

    public Guide(Long id, String name, String description, Boolean firstGuide, Skill resultSkill, Course course, Set<RequiredSkillCourse> requiredSkillCourses) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.firstGuide = firstGuide;
        this.resultSkill = resultSkill;
        this.course = course;
        this.requiredSkillCourses = requiredSkillCourses;
    }

    public Guide() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getFirstGuide() {
        return firstGuide;
    }

    public void setFirstGuide(Boolean firstGuide) {
        this.firstGuide = firstGuide;
    }

    public Skill getResultSkill() {
        return resultSkill;
    }

    public void setResultSkill(Skill resultSkill) {
        this.resultSkill = resultSkill;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Set<RequiredSkillCourse> getRequiredSkillCourses() {
        return requiredSkillCourses;
    }

    public void setRequiredSkillCourses(Set<RequiredSkillCourse> requiredSkillCourses) {
        this.requiredSkillCourses = requiredSkillCourses;
    }
}
