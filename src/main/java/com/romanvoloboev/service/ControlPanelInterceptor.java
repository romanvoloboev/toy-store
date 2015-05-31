package com.romanvoloboev.service;

import com.romanvoloboev.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Roman Voloboev
 * Interceptor for /cp/** requests which gets actual data about employee, new orders and reviews count.
 * This data puts into employee session and displays in control panel as notifications about new events.
 */
public class ControlPanelInterceptor extends HandlerInterceptorAdapter {
    @Autowired private CustomerService customerService;
    @Autowired private OrderService orderService;
    @Autowired private ReviewService reviewService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (request.getSession().getAttribute("customerName") == null && request.getSession().getAttribute("customerRole") == null) {
            Customer customer = customerService.selectAuth();
            request.getSession().setAttribute("customerName", customer.getName());
            request.getSession().setAttribute("customerRole", customerService.getTypeByRole(customer.getRole()));
        }
        request.getSession().setAttribute("newOrders", orderService.selectNewOrdersCount());
        request.getSession().setAttribute("newReviews", reviewService.selectNewReviewsCount());
    }
}
