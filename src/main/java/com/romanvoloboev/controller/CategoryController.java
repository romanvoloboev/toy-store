package com.romanvoloboev.controller;

import com.romanvoloboev.dto.CategoryDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.service.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Controller
@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
public class CategoryController {
    private static final Logger LOGGER = Logger.getLogger(CategoryController.class.getName());

    @Autowired private CategoryServiceImpl categoryService;

    @RequestMapping("/cp/category")
    public ModelAndView showCategories() {
        ModelAndView modelAndView = new ModelAndView("cp/category");
        try {
            modelAndView.addObject("category", categoryService.selectDTOsWithSubcategories());
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @RequestMapping("/cp/category/add")
    public ModelAndView addCategory() {
        return new ModelAndView("cp/category_add");
    }

    @RequestMapping(value = "/cp/category/load_by", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, List<SimpleDTO>> loadByNameAndActive(@RequestParam(value = "name", defaultValue = "")String name,
                                                            @RequestParam("active")boolean active) {
        Map<String, List<SimpleDTO>> response = new HashMap<>();
        List<SimpleDTO> categories = null;
        try {
            categories = categoryService.selectSimpleDTOs(name, active);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        response.put("suggestions", categories);
        return response;
    }

    @RequestMapping("/cp/category/edit")
    public ModelAndView editCategory(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/category_edit");
        try {
            modelAndView.addObject("category", categoryService.selectSimpleDTO(id));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            //todo: return error_page..
        }
        return modelAndView;
    }

    @RequestMapping(value = "/cp/category/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> saveCategory(@RequestParam("id")int id, @RequestParam("name")String name) {
        Map<String, String> response = new HashMap<>();
        try {
            categoryService.save(new CategoryDTO(id, name));
            response.put("status", "ok");
        } catch (Exception e) {
            response.put("status", "error");
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return response;
    }

    @RequestMapping(value = "/cp/category/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> deleteCategory(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            categoryService.delete(id);
            response.put("status", "ok");
        } catch (Exception e) {
            response.put("status", "error");
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return response;
    }

    @RequestMapping(value = "/cp/category/change_status", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> hideCategory(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            categoryService.changeCategoryStatus(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

}
