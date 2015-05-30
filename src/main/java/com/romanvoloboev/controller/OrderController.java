package com.romanvoloboev.controller;

import com.romanvoloboev.dto.BookingDTO;
import com.romanvoloboev.service.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
public class OrderController {
    private static final Logger LOGGER = Logger.getLogger(OrderController.class.getName());

    @Autowired private OrderServiceImpl orderService;

    @RequestMapping("/cp/order/add")
    public ModelAndView orderAdd() {
        return new ModelAndView("cp/order_add");
    }

    @RequestMapping(value = "/cp/order")
    public ModelAndView showOrders() {
        ModelAndView modelAndView = new ModelAndView("cp/order");
        modelAndView.addObject("order", orderService.selectDTOs());
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/cp/order/save", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, String> saveOrder(@RequestBody BookingDTO bookingDTO) {
        Map<String, String> response = new HashMap<>();
        try {
            orderService.save(bookingDTO);
            response.put("status", "ok");
        } catch (ValidationException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "validationError");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;

    }

    @RequestMapping(value = "/cp/order/details", method = RequestMethod.GET)
    public ModelAndView orderInfo(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/order_details");
        try {
            modelAndView.addObject("order", orderService.selectDTO(id));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            //todo: error page
        }
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/cp/order/delete", method = RequestMethod.POST)
    public Map<String, String> deleteOrder(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            orderService.deleteOrder(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @ResponseBody
    @RequestMapping(value = "/cp/order/change_status", method = RequestMethod.POST)
    public Map<String, String> changeOrderStatus(@RequestParam("id")int id, @RequestParam("status")short status) {
        Map<String, String> response = new HashMap<>();
        try {
            orderService.changeStatus(id, status);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @RequestMapping(value = "/cp/order/search_by", method = RequestMethod.GET)
    public ModelAndView searchOrder(@RequestParam(value = "order", required = false, defaultValue = "0")int orderId,
                                    @RequestParam(value = "status", required = false, defaultValue = "0")short status,
                                    @RequestParam(value = "customer", required = false, defaultValue = "0")int customerId) {
        ModelAndView modelAndView = new ModelAndView("cp/order");
        try {
            modelAndView.addObject("order", orderService.searchOrder(orderId, status, customerId));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

}
