package com.romanvoloboev.controller;

import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.dto.SubcategoryDTO;
import com.romanvoloboev.service.CategoryServiceImpl;
import com.romanvoloboev.service.ProductService;
import com.romanvoloboev.service.SubcategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.ValidationException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Controller
public class SubcategoryController {
    private static final Logger LOGGER = Logger.getLogger(SubcategoryController.class.getName());

    @Autowired private SubcategoryServiceImpl subcategoryService;
    @Autowired private CategoryServiceImpl categoryService;
    @Autowired private ProductService productService;

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/subcategory/add")
    public ModelAndView addSubcategory() {
        return new ModelAndView("cp/subcategory_add");
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
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

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/subcategory/edit", method = RequestMethod.GET)
    public ModelAndView editSubcategory(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("/cp/subcategory_edit");
        SubcategoryDTO subcategoryDTO = subcategoryService.selectDTO(id);
        if (subcategoryDTO != null) {
            modelAndView.addObject("subcategory", subcategoryDTO);
            modelAndView.addObject("category", categoryService.selectSimpleDTO(subcategoryDTO.getCategory()));
        } else {
            LOGGER.log(Level.SEVERE, "No subcategory was found");
            //todo: return error_page..
        }
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
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

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
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

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/subcategory/load_by", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, List<SimpleDTO>> loadByNameAndStatus(@RequestParam(value = "name", defaultValue = "")String name,
                                                            @RequestParam("active")boolean active) {
        Map<String, List<SimpleDTO>> response = new HashMap<>();
        List<SimpleDTO> subcategories = null;
        try {
            subcategories = subcategoryService.selectSimpleDTOs(name, active);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        response.put("suggestions", subcategories);
        return response;
    }

    @RequestMapping(value = "/subcategory", method = RequestMethod.GET)
    public ModelAndView loadSubcategoryProducts(@RequestParam("id")int id,
                                                @RequestParam(value = "sort_by", required = false, defaultValue = "rating")String sortType) {
        ModelAndView modelAndView = new ModelAndView("store/subcategory");
        List<ProductDTO> productDTOs = productService.selectDTOsBySubcategorySortBy(id, sortType);
        if (!productDTOs.isEmpty()) {
            modelAndView.addObject("subcategory", subcategoryService.selectSubcategoryDTO(id));
            modelAndView.addObject("products", productDTOs);
        } else {
            LOGGER.log(Level.SEVERE, "No subcategory was found or it's not active");
            //todo subcategory no found page
        }
        return modelAndView;
    }
}
