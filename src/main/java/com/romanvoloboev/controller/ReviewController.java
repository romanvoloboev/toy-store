package com.romanvoloboev.controller;

import com.romanvoloboev.dto.ReviewDTO;
import com.romanvoloboev.service.ProductService;
import com.romanvoloboev.service.ReviewServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.ValidationException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Controller
public class ReviewController {
    private static final Logger LOGGER = Logger.getLogger(ReviewController.class.getName());

    @Autowired private ReviewServiceImpl reviewService;

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/review")
    public ModelAndView showReviews() {
        ModelAndView modelAndView = new ModelAndView("cp/reviews");
        try {
            modelAndView.addObject("review", reviewService.selectDTOs());
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @ResponseBody
    @RequestMapping(value = "/cp/review/change_status")
    public Map<String, String> changeReviewStatus(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        if (reviewService.changeReviewStatus(id)) {
            response.put("status", "ok");
        } else {
            LOGGER.log(Level.SEVERE, "No review found");
            response.put("status", "error");
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @ResponseBody
    @RequestMapping(value = "/cp/review/delete")
    public Map<String, String> deleteReview(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        if (reviewService.deleteProductReview(id)) {
            response.put("status", "ok");
        } else {
            LOGGER.log(Level.SEVERE, "No review found");
            response.put("status", "error");
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/review/search_by_customer")
    public ModelAndView searchReviewsByCustomer(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/reviews");
        modelAndView.addObject("review", reviewService.selectDTOsByCustomerId(id));
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/review/search_by")
    public ModelAndView searchReviewsByCustomer(@RequestParam("active")boolean status) {
        ModelAndView modelAndView = new ModelAndView("cp/reviews");
        modelAndView.addObject("review", reviewService.selectDTOsByStatus(status));
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/review/search_by_product")
    public ModelAndView searchReviewsByProduct(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/reviews");
        modelAndView.addObject("review", reviewService.selectDTOsByProductId(id));
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    @RequestMapping(value = "/add_review", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, String> addReview(@RequestBody ReviewDTO reviewDTO) {
        Map<String, String> response = new HashMap<>();
        try {
            reviewService.addProductReview(reviewDTO);
            response.put("status", "ok");
        } catch (ValidationException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "validationError");
        }
        catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }
}
