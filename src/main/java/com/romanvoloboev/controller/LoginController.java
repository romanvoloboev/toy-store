package com.romanvoloboev.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Roman Voloboev
 * controller for login and registration pages
 */

@Controller
public class LoginController {

    @RequestMapping("/admin/login")
    public ModelAndView adminLogin() {
        return new ModelAndView("admin_login");
    }

    @RequestMapping("/login")
    public ModelAndView customerLogin(){
        return new ModelAndView("customer_login");
    }

    @RequestMapping("/sign_up")
    public ModelAndView customerSignUp() {
        return new ModelAndView("sign_up");
    }
}
