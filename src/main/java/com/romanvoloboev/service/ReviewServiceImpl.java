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
                        formatDateToString(review.getDate()), review.isActive(), review.getCustomer().getName(),
                        review.getProduct().getName(), review.getProduct().getId()));
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
                        formatDateToString(review.getDate()), review.isActive(), review.getCustomer().getName(),
                        review.getProduct().getName(), review.getProduct().getId()));
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
                        formatDateToString(review.getDate()), review.isActive(), review.getCustomer().getName(),
                        review.getProduct().getName(), review.getProduct().getId()));
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
                        formatDateToString(review.getDate()), review.isActive(), review.getCustomer().getName(),
                        review.getProduct().getName(), review.getProduct().getId()));
            }
        }
        return reviewDTOs;
    }

    @Override
    public long getCustomerReviewCount(Integer id) {
        return reviewRepository.getCustomerReviewCount(id);
    }

    @Override
    public long selectActiveProductReviewsCount(Integer id) {
        return reviewRepository.getProductReviewCount(id);
    }

    /**
     * Method makes review visible or not, and depends on it recounts product rating.
     */
    @Transactional
    public boolean changeReviewStatus(Integer id) {
        Review review = selectModel(id);
        Product product = null;
        boolean result = false;
        if (review != null) {
            if (review.isActive()) {
                review.setActive(false);
                product = review.getProduct();
            } else {
                review.setActive(true);
                product = review.getProduct();
            }
            save(review);
            result = true;
        }
        if (product != null) {
            product.setRating(getProductAvgRating(product.getId()));
            productService.save(product);
        }
        return result;
    }

    /**
     * Method removes review from product and recounts it rating.
     */
    @Transactional
    public boolean deleteProductReview(Integer id) {
        try {
            Review review = selectModel(id);
            Product product = null;
            if (review != null) {
                product = review.getProduct();
                reviewRepository.delete(review);
            }
            if (product != null) {
                product.setRating(getProductAvgRating(product.getId()));
                productService.save(product);
            }
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }


    /**
     * Method adds new review of product
     */
    @Transactional
    @Override
    public void addProductReview(ReviewDTO reviewDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(reviewDTO, validator)) {
            Product product = productService.selectModel(reviewDTO.getProduct());
            if (product == null) throw new Exception("No product found");
            Review review = save(new Review(reviewDTO.getComment(), reviewDTO.getRating(), new Date(), false, product, customerService.selectAuth()));
            List<Review> reviews = new ArrayList<>();
            reviews.add(review);
            product.setReviews(reviews);
            productService.save(product);
        }
    }


    @Transactional
    public Double getProductAvgRating(Integer id) {
        Double rating = reviewRepository.getProductAvgRating(id);
        if (rating == null) return (double)0;
        return rating;
    }

    @Override
    public List<Review> selectActiveProductReviews(Integer id) {
        return reviewRepository.getByActiveTrueAndProductId(id);
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
    public Review save(Review review) {
        return reviewRepository.save(review);
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
