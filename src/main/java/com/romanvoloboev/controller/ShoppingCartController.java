package com.romanvoloboev.controller;

import com.romanvoloboev.service.ShoppingCartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Controller
@SessionAttributes(value = "shoppingCart")
public class ShoppingCartController {
    private static final Logger LOGGER = Logger.getLogger(ShoppingCartController.class.getName());

    @Autowired private ShoppingCartServiceImpl shoppingCartService;

    @RequestMapping(value = "/cart/add", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, Object> addToCart(@RequestParam("id")int id, HttpSession session) {
        Map<String, Object> response;
        response = shoppingCartService.addProductToCart(id, session);
        return response;
    }

    @RequestMapping(value = "/cart/load", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, Object> loadShoppingCart(HttpSession session) {
        Map<String, Object> response;
        response = shoppingCartService.getCartItems(session);
        return response;
    }

    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    @RequestMapping(value = "/cart/remove", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, Object> removeItem(@RequestParam("id")int id, HttpSession session) {
        Map<String, Object> response;
        response = shoppingCartService.removeCartItem(id, session);
        return response;
    }

    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    @RequestMapping(value = "/cart/clear_all", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, String> clearCart(HttpSession session) {
        return shoppingCartService.removeAllItems(session);
    }
}
