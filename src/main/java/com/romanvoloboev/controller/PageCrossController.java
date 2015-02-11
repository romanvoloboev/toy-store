package com.romanvoloboev.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Roman Voloboev
 * controller for page navigation
 */

@Controller
public class PageCrossController {
    @RequestMapping("/")
    public ModelAndView index(){
        return new ModelAndView("index");
    }

    @RequestMapping("/product")
    public ModelAndView product() {
        return new ModelAndView("product");
    }

    @RequestMapping("/category")
    public ModelAndView category() {
        return new ModelAndView("category");
    }

    @RequestMapping("/subcategory")
    public ModelAndView subcategory() {
        return new ModelAndView("subcategory");
    }

    @RequestMapping("/profile")
    public ModelAndView profile() {
        return new ModelAndView("profile");
    }

    @RequestMapping("/edit_password")
    public ModelAndView passwordChange() {
        return new ModelAndView("edit_password");
    }

    @RequestMapping("/edit_profile")
    public ModelAndView editProfile() {
        return new ModelAndView("edit_profile");
    }

    @RequestMapping("/wishlist")
    public ModelAndView wishlist() {
        return new ModelAndView("wishlist");
    }

    @RequestMapping("/orders")
    public ModelAndView orders() {
        return new ModelAndView("orders");
    }

    @RequestMapping("/order_details")
    public ModelAndView orderDetails() {
        return new ModelAndView("order_details");
    }

    @RequestMapping("/cart")
    public ModelAndView cart() {
        return new ModelAndView("cart");
    }

    @RequestMapping("/checkout")
    public ModelAndView checkout() {
        return new ModelAndView("checkout");
    }

    @RequestMapping("/search_results")
    public ModelAndView search_results() {
        return new ModelAndView("search_results");
    }
}
