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
}
