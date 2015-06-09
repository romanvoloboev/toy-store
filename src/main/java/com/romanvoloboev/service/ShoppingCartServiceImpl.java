package com.romanvoloboev.service;

import com.romanvoloboev.dto.BookingItemDTO;
import com.romanvoloboev.dto.ShoppingCartDTO;
import com.romanvoloboev.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Roman Voloboev
 */

@Service
public class ShoppingCartServiceImpl {

    @Autowired private ProductService productService;

    /**
     * Add product id and count to session object.
     */
    @Transactional
    public Map<String, Object> addProductToCart(int id, HttpSession session) {
        Map<String, Object> cartItems = new HashMap<>();

        if (id == 0 || !productService.exists(id)) {
            cartItems.put("error", "No such product");
            return cartItems;
        }

        short quantity = 1;
        ShoppingCartDTO cartItem = new ShoppingCartDTO(quantity, id);

        if (session.getAttribute("shoppingCart") == null) {
            session.setAttribute("shoppingCart", new ArrayList<ShoppingCartDTO>());
        }

        ArrayList<ShoppingCartDTO> cart = (ArrayList<ShoppingCartDTO>) session.getAttribute("shoppingCart");
        if (!cart.isEmpty()) {
            boolean wasFind = false;
            for (ShoppingCartDTO dto:cart) {
                if (dto.getId() == cartItem.getId()) {
                    quantity = dto.getQuantity();
                    dto.setQuantity(++quantity);
                    wasFind = true;
                    break;
                }
            }
            if (!wasFind) cart.add(cartItem);
        } else {
            cart.add(cartItem);
        }
        session.setAttribute("shoppingCart", cart);
        cartItems = getCartItems(session);
        return cartItems;
    }

    /**
     * Returns content of session object as JSON response with List of BookingItemDTO, total items count and amount.
     */
    @Transactional
    public Map<String, Object> getCartItems(HttpSession session) {
        Map<String, Object> cartItems = new HashMap<>();
        ArrayList<BookingItemDTO> items = new ArrayList<>();
        double totalAmount = 0;
        double itemsCount = 0;
        ArrayList<ShoppingCartDTO> cart = (ArrayList<ShoppingCartDTO>) session.getAttribute("shoppingCart");
        if (cart != null && !cart.isEmpty()) {
            for (ShoppingCartDTO dto:cart) {
                Product product = productService.selectModel(dto.getId());
                double price;
                if (product.isPromotion()) {
                    price = Math.round(product.getPromotionPrice() * 100);
                } else {
                    price = Math.round(product.getPrice() * 100);
                }
                short quantity = dto.getQuantity();
                double amount = quantity * price;
                totalAmount += amount;
                itemsCount += quantity;
                long[] images = productService.selectImages(product.getImages());
                items.add(new BookingItemDTO(quantity, price/100, amount/100, product.getName(), product.getId(), images[0]));
            }
        }
        cartItems.put("itemsCount", itemsCount);
        cartItems.put("totalAmount", totalAmount/100);
        cartItems.put("cartItems", items);
        return cartItems;
    }

    /**
     * Remove selected cart item from session object.
     */
    @Transactional
    public Map<String, Object> removeCartItem(int id, HttpSession session) {
        Map<String, Object> cartItems = new HashMap<>();

        if (session.getAttribute("shoppingCart") == null) {
            cartItems.put("error", "Your shopping cart is empty");
            return cartItems;
        }

        ArrayList<ShoppingCartDTO> cart = (ArrayList<ShoppingCartDTO>) session.getAttribute("shoppingCart");

        if (!cart.isEmpty()) {
            boolean wasRemoved = false;
            for (ShoppingCartDTO item:cart) {
                if (item.getId() == id) {
                    short quantity = item.getQuantity();
                    if (quantity > 1) {
                        item.setQuantity(--quantity);
                    } else {
                        cart.remove(item);
                    }
                    wasRemoved = true;
                    break;
                }
            }
            if (!wasRemoved) {
                cartItems.put("error", "No item was found");
                return cartItems;
            }
            session.setAttribute("shoppingCart", cart);
        }
        cartItems = getCartItems(session);
        return cartItems;
    }

    public Map<String, String> removeAllItems(HttpSession session) {
        Map<String, String> response = new HashMap<>();
        ArrayList<ShoppingCartDTO> cart = (ArrayList<ShoppingCartDTO>) session.getAttribute("shoppingCart");
        if (!cart.isEmpty()) {
            cart.clear();
            session.setAttribute("shoppingCart", cart);
            response.put("status", "ok");
        } else {
            response.put("status", "Cart is empty");
        }
        return response;
    }
}
