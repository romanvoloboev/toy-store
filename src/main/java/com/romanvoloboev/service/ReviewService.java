package com.romanvoloboev.service;

import com.romanvoloboev.dto.ReviewDTO;

/**
 * @author Roman Voloboev
 */

public interface ReviewService {
    void save(ReviewDTO reviewDTO) throws Exception;
}
