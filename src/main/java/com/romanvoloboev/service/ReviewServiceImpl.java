package com.romanvoloboev.service;

import com.romanvoloboev.dto.ReviewDTO;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.Product;
import com.romanvoloboev.model.Review;
import com.romanvoloboev.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired private ReviewRepository reviewRepository;
    @Autowired private ProductService productService;
    @Autowired private CustomerService customerService;

    /**
     * Save new product review using DTO.
     * @param reviewDTO - review DTO that contains comment, rating, product, customer.
     * @throws ValidationException - throws when DTO fails validation.
     */
    @Transactional
    @Override
    public void save(ReviewDTO reviewDTO) throws ValidationException {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(reviewDTO, validator)) {
            Product product = productService.selectModel(reviewDTO.getProduct());
            Customer customer = customerService.selectModel(reviewDTO.getCustomer());
            Review review = new Review(reviewDTO.getComment(), reviewDTO.getRating(), new Date(), false, product, customer);
            save(review);
        }
    }

    /**
     * Returns all reviews in admin panel
     * @return List of Review DTO
     */
    @Transactional(readOnly = true)
    @Override
    public List<ReviewDTO> selectDTOs() {
        List<ReviewDTO> reviewDTOs = new ArrayList<>();
        List<Review> reviews = selectModels();
        if (reviews != null) {
            for (Review review:reviews) {
                reviewDTOs.add(new ReviewDTO(review.getId(), getShortComment(review.getComment()), review.getRating(),
                        formatDateToString(review.getDate()), review.isActive(), review.getCustomer().getName(), review.getProduct().getName()));
            }
        }
        return reviewDTOs;
    }

    /**
     * Returns all customer reviews in admin panel
     * @param id - customer
     * @return List of Review DTO
     */
    @Transactional(readOnly = true)
    @Override
    public List<ReviewDTO> selectDTOsByCustomerId(Integer id) {
        List<Review> reviews = selectModelsByCustomerId(id);
        List<ReviewDTO> reviewDTOs = new ArrayList<>();
        if (reviews != null) {
            for (Review review:reviews) {
                reviewDTOs.add(new ReviewDTO(review.getId(), getShortComment(review.getComment()), review.getRating(),
                        formatDateToString(review.getDate()), review.isActive(), review.getCustomer().getName(), review.getProduct().getName()));
            }
        }
        return reviewDTOs;
    }

    /**
     * Returns all product reviews in admin panel
     * @param id - product
     * @return List of Review DTO
     */
    @Transactional(readOnly = true)
    @Override
    public List<ReviewDTO> selectDTOsByProductId(Integer id) {
        List<ReviewDTO> reviewDTOs = new ArrayList<>();
        List<Review> reviews = selectModelsByProductId(id);
        if (reviews != null) {
            for (Review review:reviews) {
                reviewDTOs.add(new ReviewDTO(review.getId(), getShortComment(review.getComment()), review.getRating(),
                        formatDateToString(review.getDate()), review.isActive(), review.getCustomer().getName(), review.getProduct().getName()));
            }
        }
        return reviewDTOs;
    }

    @Override
    public Short selectNewReviewsCount() {
        return reviewRepository.getNewReviewsCount();
    }

    @Override
    public List<ReviewDTO> selectDTOsByStatus(boolean status) {
        List<Review> reviews = reviewRepository.getByActive(status);
        List<ReviewDTO> reviewDTOs = new ArrayList<>();
        if (reviews != null) {
            for (Review review:reviews) {
                reviewDTOs.add(new ReviewDTO(review.getId(), getShortComment(review.getComment()), review.getRating(),
                        formatDateToString(review.getDate()), review.isActive(), review.getCustomer().getName(), review.getProduct().getName()));
            }
        }
        return reviewDTOs;
    }

    @Override
    public long getCustomerReviewCount(Integer id) {
        return reviewRepository.getCustomerReviewCount(id);
    }

    @Override
    public long getProductReviewCount(Integer id) {
        return reviewRepository.getProductReviewCount(id);
    }

    @Transactional
    public boolean changeReviewStatus(Integer id) {
        Review review = selectModel(id);
        boolean result = false;
        if (review != null) {
            if (review.isActive()) {
                review.setActive(false);
            } else {
                review.setActive(true);
            }
            save(review);
            result = true;
        }
        return result;
    }

    @Transactional
    public boolean deleteReview(Integer id) {
        try {
            reviewRepository.delete(id);
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    @Transactional(readOnly = true)
    private List<Review> selectModelsByProductId(Integer id) {
        return reviewRepository.getByProductId(id);
    }

    @Transactional(readOnly = true)
    private List<Review> selectModelsByCustomerId(Integer id) {
        return reviewRepository.getByCustomerId(id);
    }

    @Transactional
    private void save(Review review) {
        reviewRepository.save(review);
    }

    @Transactional(readOnly = true)
    private Review selectModel(Integer id) {
        return reviewRepository.getOne(id);
    }

    @Transactional(readOnly = true)
    private List<Review> selectModels() {
        return reviewRepository.findAll();
    }

    private String getShortComment(String comment) {
        if (comment != null && comment.length() > 40) {
            return comment.substring(0, 40) + "...";
        } else {
            return comment;
        }
    }
}
