package com.romanvoloboev.service;

import com.romanvoloboev.dto.ReviewDTO;
import com.romanvoloboev.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Roman Voloboev
 */

@Service
public class ReviewServiceImpl implements ReviewService {
    public static final String FLOAT_PATTERN = "^(?=.+)(?:[1-9]\\d*|0)?(?:\\.\\d+)?$";

    @Autowired private ReviewRepository reviewRepository;

    @Override
    public void save(ReviewDTO reviewDTO) throws Exception {

    }
}
