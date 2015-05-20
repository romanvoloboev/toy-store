package com.romanvoloboev.controller;

import com.romanvoloboev.dto.BrandDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.service.BrandServiceImpl;
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
@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
public class BrandController {
    private static final Logger LOGGER = Logger.getLogger(BrandController.class.getName());

    @Autowired private BrandServiceImpl brandService;

    @RequestMapping("/cp/brand")
    public ModelAndView showBrands() {
        ModelAndView modelAndView = new ModelAndView("cp/brand");
        try {
            modelAndView.addObject("brand", brandService.selectDTOs());
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @RequestMapping("/cp/brand/add")
    public ModelAndView addBrands() {
        return new ModelAndView("cp/brand_add");
    }

    @RequestMapping(value = "/cp/brand/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> saveBrand(@RequestParam(value = "id", defaultValue = "0")int id,
                                         @RequestParam("name")String name,
                                         @RequestParam("country")String country) {
        Map<String, String> response = new HashMap<>();
        try {
            brandService.save(new BrandDTO(id, name, country));
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

    @RequestMapping(value = "/cp/brand/edit", method = RequestMethod.GET)
    public ModelAndView editBrands(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/brand_edit");
        try {
            modelAndView.addObject("brand", brandService.selectDTO(id));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            //todo: error page
        }
        return modelAndView;
    }

    @RequestMapping(value = "/cp/brand/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> deleteBrand(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            brandService.delete(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @RequestMapping(value = "/cp/brand/change_status", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> changeStatus(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            brandService.changeBrandStatus(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @RequestMapping(value = "/cp/brand/load_by", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, List<SimpleDTO>> loadByNameAndActive(@RequestParam(value = "name", defaultValue = "")String name,
                                                            @RequestParam(value = "active")boolean active) {
        Map<String, List<SimpleDTO>> response = new HashMap<>();
        List<SimpleDTO> brands = null;
        try {
            brands = brandService.selectSimpleDTOs(name, active);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        response.put("suggestions", brands);
        return response;
    }
}
