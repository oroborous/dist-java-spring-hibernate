package edu.wctc.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "donut_review")
public class DonutReview {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private int id;

    @Column(name = "review")
    private String review;

    @Column(name = "stars")
    private double stars;

    @Column(name = "review_date")
    private LocalDate reviewDate;

    public DonutReview(String review, double stars, LocalDate reviewDate) {
        this.review = review;
        this.stars = stars;
        this.reviewDate = reviewDate;
    }

}
