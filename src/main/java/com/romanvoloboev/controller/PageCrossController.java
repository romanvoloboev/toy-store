package com.romanvoloboev.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        return new ModelAndView("user/index");
    }

    @RequestMapping("/product")
    public ModelAndView product() {
        return new ModelAndView("user/product");
    }

    @RequestMapping("/category")
    public ModelAndView category() {
        return new ModelAndView("user/category");
    }

    @RequestMapping("/subcategory")
    public ModelAndView subcategory() {
        return new ModelAndView("user/subcategory");
    }

    @RequestMapping("/profile")
    public ModelAndView profile() {
        return new ModelAndView("user/profile");
    }

    @RequestMapping("/edit_password")
    public ModelAndView passwordChange() {
        return new ModelAndView("user/edit_password");
    }

    @RequestMapping("/edit_profile")
    public ModelAndView editProfile() {
        return new ModelAndView("user/edit_profile");
    }

    @RequestMapping("/wishlist")
    public ModelAndView wishlist() {
        return new ModelAndView("user/wishlist");
    }

    @RequestMapping("/orders")
    public ModelAndView orders() {
        return new ModelAndView("user/orders");
    }

    @RequestMapping("/order_details")
    public ModelAndView orderDetails() {
        return new ModelAndView("user/order_details");
    }

    @RequestMapping("/cart")
    public ModelAndView cart() {
        return new ModelAndView("user/cart");
    }

    @RequestMapping("/checkout")
    public ModelAndView checkout() {
        return new ModelAndView("user/checkout");
    }

    @RequestMapping("/search_results")
    public ModelAndView search_results() {
        return new ModelAndView("user/search_results");
    }



    @RequestMapping("/cp")
    public ModelAndView admin_panel() {
        return new ModelAndView("admin/index");
    }

    @RequestMapping("/cp/category")
    public ModelAndView showCategory() {
        return new ModelAndView("/admin/category");
    }

    @RequestMapping("/cp/category/add")
    public ModelAndView addCategory() {
        return new ModelAndView("/admin/category_add");
    }

    @RequestMapping("/cp/category/edit")
    public ModelAndView editCategory() {
        return new ModelAndView("/admin/category_edit");
    }


    @RequestMapping("/cp/order")
    public ModelAndView showOrders() {
        return new ModelAndView("/admin/order");
    }

    @RequestMapping("/cp/order/edit")
    public ModelAndView editOrder() {
        return new ModelAndView("/admin/order_edit");
    }

    @RequestMapping("/cp/order/info")
    public ModelAndView orderInfo() {
        return new ModelAndView("/admin/order_details");
    }

    @RequestMapping("/cp/order/add")
    public ModelAndView orderAdd() {
        return new ModelAndView("/admin/order_add");
    }


    @RequestMapping("/cp/product")
    public ModelAndView showProduct() {
        return new ModelAndView("/admin/product");
    }

    @RequestMapping("/cp/product/add")
    public ModelAndView addProduct() {
        return new ModelAndView("/admin/product_add");
    }

    @RequestMapping("/cp/product/edit")
    public ModelAndView editProduct() {
        return new ModelAndView("/admin/product_edit");
    }

}
