package com.romanvoloboev.controller;

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
        return new ModelAndView("cp/index");
    }





    @RequestMapping("/cp/order")
    public ModelAndView showOrders() {
        return new ModelAndView("cp/order");
    }

    @RequestMapping("/cp/edit_order")
    public ModelAndView editOrder() {
        return new ModelAndView("cp/order_edit");
    }

    @RequestMapping("/cp/order_details")
    public ModelAndView orderInfo() {
        return new ModelAndView("cp/order_details");
    }

    @RequestMapping("/cp/new_order")
    public ModelAndView orderAdd() {
        return new ModelAndView("cp/order_add");
    }




    @RequestMapping("/cp/customer")
    public ModelAndView showCustomers() {
        return new ModelAndView("cp/customer");
    }

    @RequestMapping("/cp/edit_customer")
    public ModelAndView editCustomer() {
        return new ModelAndView("cp/customer_edit");
    }

    @RequestMapping("/cp/new_customer")
    public ModelAndView newCustomer() {
        return new ModelAndView("/cp/customer_add");
    }


    @RequestMapping("/cp/employee")
    public ModelAndView showAdmins(){
        return new ModelAndView("cp/employee");
    }

    @RequestMapping("/cp/edit_employee")
    public ModelAndView editAdmin() {
        return new ModelAndView("cp/employee_edit");
    }

    @RequestMapping("/cp/new_employee")
    public ModelAndView newAdmin() {
        return new ModelAndView("cp/employee_add");
    }



    @RequestMapping("/cp/sale_report")
    public ModelAndView showSalesReport() {
        return new ModelAndView("/cp/sale_report");
    }

    @RequestMapping("/cp/product_report")
    public ModelAndView showProductReport() {
        return new ModelAndView("/cp/product_report");
    }



    @RequestMapping("/cp/reviews")
    public ModelAndView showReviews() {
        return new ModelAndView("/cp/reviews");
    }



}
