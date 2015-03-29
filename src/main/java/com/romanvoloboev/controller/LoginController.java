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

    @RequestMapping("/user_login")
    public ModelAndView userLogin(){
        return new ModelAndView("store/login");
    }

}
