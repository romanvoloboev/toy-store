package com.romanvoloboev.controller;

import com.romanvoloboev.dto.SubcategoryDTO;
import com.romanvoloboev.service.CategoryServiceImpl;
import com.romanvoloboev.service.SubcategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.ValidationException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Controller
@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
public class SubcategoryController {
    private static final Logger LOGGER = Logger.getLogger(SubcategoryController.class.getName());

    @Autowired private SubcategoryServiceImpl subcategoryService;
    @Autowired private CategoryServiceImpl categoryService;

    @RequestMapping(value = "/cp/subcategory/add")
    public ModelAndView addSubcategory() {
        return new ModelAndView("cp/subcategory_add");
    }

    @RequestMapping(value = "/cp/subcategory/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> saveSubcategory(@RequestParam(value = "subcategory")int subcategoryId,
                                               @RequestParam(value = "name")String name,
                                               @RequestParam(value = "category")int categoryId,
                                               @RequestParam(value = "image")long imageId) {
        Map<String, String> response = new HashMap<>();
        try {
            subcategoryService.save(new SubcategoryDTO(subcategoryId, name, categoryId, imageId));
            response.put("status", "ok");
        } catch (ValidationException e) {
            response.put("status", "wrongParams");
            LOGGER.log(Level.SEVERE, e.getMessage());
        } catch (Exception e) {
            response.put("status", "error");
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return response;
    }

    @RequestMapping(value = "/cp/subcategory/edit", method = RequestMethod.GET)
    public ModelAndView editSubcategory(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("/cp/subcategory_edit");
        try {
                SubcategoryDTO subcategoryDTO = subcategoryService.selectDTO(id);
                modelAndView.addObject("subcategory", subcategoryDTO);
                modelAndView.addObject("category", categoryService.selectSimpleDTO(subcategoryDTO.getCategory()));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            //todo: return error_page..
        }
        return modelAndView;
    }

    @RequestMapping(value = "/cp/subcategory/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> removeSubcategory(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            subcategoryService.delete(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @RequestMapping(value = "/cp/subcategory/change_status", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> changeSubCategoryStatus(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            subcategoryService.changeSubcategoryStatus(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }
}
