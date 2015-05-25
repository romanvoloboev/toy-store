package com.romanvoloboev.controller;

import com.romanvoloboev.service.ReviewServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Controller
@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
public class ReviewController {
    private static final Logger LOGGER = Logger.getLogger(ReviewController.class.getName());

    @Autowired private ReviewServiceImpl reviewService;

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

    @ResponseBody
    @RequestMapping(value = "/cp/review/delete")
    public Map<String, String> deleteReview(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        if (reviewService.deleteReview(id)) {
            response.put("status", "ok");
        } else {
            LOGGER.log(Level.SEVERE, "No review found");
            response.put("status", "error");
        }
        return response;
    }

    @RequestMapping(value = "/cp/review/search_by_customer")
    public ModelAndView searchReviewsByCustomer(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/reviews");
        modelAndView.addObject("review", reviewService.selectDTOsByCustomerId(id));
        return modelAndView;
    }

    @RequestMapping(value = "/cp/review/search_by_product")
    public ModelAndView searchReviewsByProduct(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/reviews");
        modelAndView.addObject("review", reviewService.selectDTOsByProductId(id));
        return modelAndView;
    }
}
