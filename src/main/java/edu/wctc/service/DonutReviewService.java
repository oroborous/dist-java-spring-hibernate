package edu.wctc.service;

import edu.wctc.entity.DonutReview;

public interface DonutReviewService {
    void saveReview(DonutReview theReview);

    void deleteReview(int theId);
}
