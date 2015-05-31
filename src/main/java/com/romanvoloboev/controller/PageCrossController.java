package com.romanvoloboev.controller;

import com.romanvoloboev.service.CustomerService;
import com.romanvoloboev.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Roman Voloboev
 * controller for page navigation
 */

@Controller
public class PageCrossController {

    @Autowired private OrderService orderService;
    @Autowired private CustomerService customerService;

    @RequestMapping("/")
    public ModelAndView index(){
        return new ModelAndView("store/index");
    }

    @RequestMapping("/product")
    public ModelAndView product() {
        return new ModelAndView("store/product");
    }

    @RequestMapping("/category")
    public ModelAndView category() {
        return new ModelAndView("store/category");
    }

    @RequestMapping("/subcategory")
    public ModelAndView subcategory() {
        return new ModelAndView("store/subcategory");
    }


    @RequestMapping("/wishlist")
    public ModelAndView wishlist() {
        return new ModelAndView("store/wishlist");
    }

    @RequestMapping("/orders")
    public ModelAndView orders() {
        return new ModelAndView("store/orders");
    }

    @RequestMapping("/order_details")
    public ModelAndView orderDetails() {
        return new ModelAndView("store/order_details");
    }

    @RequestMapping("/cart")
    public ModelAndView cart() {
        return new ModelAndView("store/cart");
    }

    @RequestMapping("/checkout")
    public ModelAndView checkout() {
        return new ModelAndView("store/checkout");
    }

    @RequestMapping("/search_results")
    public ModelAndView search_results() {
        return new ModelAndView("store/search_results");
    }


    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping("/cp")
    public ModelAndView admin_panel() {
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
