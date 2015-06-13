package com.romanvoloboev.controller;

import com.romanvoloboev.service.CustomerService;
import com.romanvoloboev.service.OrderService;
import com.romanvoloboev.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 * controller for page navigation
 */

@Controller
public class PageCrossController {
    private static final Logger LOGGER = Logger.getLogger(PageCrossController.class.getName());

    @Autowired private CustomerService customerService;
    @Autowired private ProductService productService;
    @Autowired private OrderService orderService;

    @RequestMapping("/")
    public ModelAndView loadIndex(){
        ModelAndView modelAndView = new ModelAndView("store/index");
        modelAndView.addObject("popularProducts", productService.selectDTOsForMainPage((byte) 1));
        modelAndView.addObject("promotionProducts", productService.selectDTOsForMainPage((byte) 2));
        modelAndView.addObject("newProducts", productService.selectDTOsForMainPage((byte) 3));
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    @RequestMapping("/wishlist")
    public ModelAndView wishlist() {
        ModelAndView modelAndView = new ModelAndView("store/wishlist");
        modelAndView.addObject("wishes", productService.selectCustomerWishlist());
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    @RequestMapping("/orders")
    public ModelAndView orders() {
        ModelAndView modelAndView = new ModelAndView("store/orders");
        modelAndView.addObject("orders", orderService.selectCustomerOrders());
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    @RequestMapping("/order_details")
    public ModelAndView orderDetails(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("store/order_details");
        try {
            modelAndView.addObject("order", orderService.selectDTO(id));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            //todo: error page
        }
        modelAndView.addObject("orderItems", orderService.selectOrderDetails(id));
        return modelAndView;
    }

    @RequestMapping("/search_results")
    public ModelAndView search_results() {
        return new ModelAndView("store/search_results");
    }


    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping("/cp")
    public ModelAndView showAdminPanel() {
        ModelAndView modelAndView = new ModelAndView("cp/index");
        modelAndView.addObject("order", orderService.selectLastDTOs());
        modelAndView.addObject("customersCount", customerService.selectCustomersCount());
        modelAndView.addObject("soldProductsCount", orderService.selectSoldProductsCount());
        modelAndView.addObject("totalMoney", orderService.selectTotalOrdersAmount());
        return modelAndView;
    }

    @RequestMapping("/cp/sale_report")
    public ModelAndView showSalesReport() {
        return new ModelAndView("/cp/sale_report");
    }

    @RequestMapping("/cp/product_report")
    public ModelAndView showProductReport() {
        return new ModelAndView("/cp/product_report");
    }

}
