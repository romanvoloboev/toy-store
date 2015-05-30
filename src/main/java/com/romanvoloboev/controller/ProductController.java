package com.romanvoloboev.controller;

import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
public class ProductController {
    private static final Logger LOGGER = Logger.getLogger(ProductController.class.getName());

    @Autowired private ProductServiceImpl productService;

    @RequestMapping("/cp/product")
    public ModelAndView showProduct() {
        ModelAndView modelAndView = new ModelAndView("cp/product");
        try {
            modelAndView.addObject("products", productService.selectDTOs());
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @RequestMapping("/cp/product/add")
    public ModelAndView addProduct() {
        return new ModelAndView("cp/product_add");
    }

    @ResponseBody
    @RequestMapping(value = "/cp/product/save", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    Map<String, String> saveProduct(@RequestBody ProductDTO productDTO) {
        Map<String, String> response = new HashMap<>();
        try {
            productService.save(productDTO);
            response.put("status", "ok");
        } catch (ValidationException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "wrongParams");
        }
        catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @RequestMapping(value = "/cp/product/search_by", method = RequestMethod.GET)
    public ModelAndView searchProduct(@RequestParam(value = "name", required = false, defaultValue = "")String name,
                                      @RequestParam(value = "price_start", required = false, defaultValue = "0")double priceStart,
                                      @RequestParam(value = "price_end", required = false, defaultValue = "0")double priceEnd,
                                      @RequestParam(value = "status", required = false, defaultValue = "1")int status) {
        ModelAndView modelAndView = new ModelAndView("cp/product");
        try {
            modelAndView.addObject("products", productService.searchBy(name, priceStart, priceEnd, status));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/cp/product/edit", method = RequestMethod.GET)
    public ModelAndView editProduct(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/product_edit");
        try {
            modelAndView.addObject("product", productService.selectDTO(id));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            //todo error page
        }
        return modelAndView;
    }

    @RequestMapping(value = "/cp/product/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> deleteProduct(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            productService.delete(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @RequestMapping(value = "/cp/product/change_status", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> changeProductStatus(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            productService.changeProductStatus(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/product/load_by_name", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, List<SimpleDTO>> loadProductsNames(@RequestParam("name")String name) {
        Map<String, List<SimpleDTO>> response = new HashMap<>();
        List<SimpleDTO> names = productService.selectSimpleDTOsByName(name);
        response.put("suggestions", names);
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/product/load_by_id", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public SimpleDTO loadProductDetailsById(@RequestParam("id")int id) {
        return productService.selectDTODetailById(id);
    }
}
