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

    @RequestMapping("/profile")
    public ModelAndView profile() {
        return new ModelAndView("store/profile");
    }

    @RequestMapping("/edit_password")
    public ModelAndView passwordChange() {
        return new ModelAndView("store/edit_password");
    }

    @RequestMapping("/edit_profile")
    public ModelAndView editProfile() {
        return new ModelAndView("store/edit_profile");
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



    @RequestMapping("/cp")
    public ModelAndView admin_panel() {
        return new ModelAndView("cp/index");
    }

    @RequestMapping("/cp/category")
    public ModelAndView showCategory() {
        return new ModelAndView("cp/category");
    }

    @RequestMapping("/cp/new_category")
    public ModelAndView addCategory() {
        return new ModelAndView("cp/category_add");
    }

    @RequestMapping("/cp/edit_category")
    public ModelAndView editCategory() {
        return new ModelAndView("cp/category_edit");
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



    @RequestMapping("/cp/product")
    public ModelAndView showProduct() {
        return new ModelAndView("cp/product");
    }

    @RequestMapping("/cp/new_product")
    public ModelAndView addProduct() {
        return new ModelAndView("cp/product_add");
    }

    @RequestMapping("/cp/edit_product")
    public ModelAndView editProduct() {
        return new ModelAndView("cp/product_edit");
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



    @RequestMapping("/cp/brand")
    public ModelAndView showBrands() {
        return new ModelAndView("cp/brand");
    }

    @RequestMapping("/cp/new_brand")
    public ModelAndView addBrands() {
        return new ModelAndView("cp/brand_add");
    }

    @RequestMapping("/cp/edit_brand")
    public ModelAndView editBrands() {
        return new ModelAndView("cp/brand_edit");
    }
}
