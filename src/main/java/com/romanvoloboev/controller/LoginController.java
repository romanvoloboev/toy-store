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

//    todo: make redesign of admin login page

    @RequestMapping("/admin/login")
    public ModelAndView adminLogin() {
        return new ModelAndView("admin/login_admin");
    }

    @RequestMapping("/login")
    public ModelAndView customerLogin(){
        return new ModelAndView("user/login_customer");
    }

}
