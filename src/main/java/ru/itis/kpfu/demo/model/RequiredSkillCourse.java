package ru.itis.kpfu.demo.model;

import lombok.Builder;

import javax.persistence.*;

@Entity
@Builder
public class RequiredSkillCourse {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "guide_id")
    private Guide guide;

    @ManyToOne
    @JoinColumn(name = "skill_id")
    private Skill skill;

    private Double addiction = 0.0;

    public RequiredSkillCourse() {
    }

    public RequiredSkillCourse(Long id, Guide guide, Skill skill, Double addiction) {
        this.id = id;
        this.guide = guide;
        this.skill = skill;
        this.addiction = addiction;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Guide getGuide() {
        return guide;
    }

    public void setGuide(Guide guide) {
        this.guide = guide;
    }

    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public Double getAddiction() {
        return addiction;
    }

    public void setAddiction(Double addiction) {
        this.addiction = addiction;
    }
}
