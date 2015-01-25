<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header-right pull-right wrap-cart hidden-xs ">
    <div class="cart-top pull-right">
        <div id="cart" class=""><span class="icon fa fa-shopping-cart"></span>

            <div class="heading">
                <h4>Корзина</h4>
                <a><span id="cart-total">1 товар(ов) - 2000.00&#8372;</span></a>
            </div>
            <div class="content">
                <div class="mini-cart-info">
                    <table>
                        <tbody>
                        <tr>
                            <td class="image"><a
                                    href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">
                                <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-200x150.jpg"
                                     alt="Pursue pleasure rationally"
                                     title="Pursue pleasure rationally"></a>
                            </td>
                            <td class="name">
                                <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">Pursue
                                    pleasure rationally</a>
                            </td>
                            <td class="quantity">x&nbsp;1</td>
                            <td class="total">$2000.00&#8372;</td>
                            <td class="remove">
                                <img src="../webres/image/remove-small.png" alt="Remove" title="Remove"
                                     onclick="(getURLVar('route') == 'checkout/cart' ||
                                                         getURLVar('route') == 'checkout/checkout') ?
                                                         location = 'index.php?route=checkout/cart&amp;remove=45::' :
                                                         $('#cart').load('index.php?route=module/cart&amp;remove=45::' + ' #cart > *');">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mini-cart-total">
                    <table>
                        <tbody>
                        <tr>
                            <td class="right"><b>Sub-Total:</b></td>
                            <td class="right">$2,000.00</td>
                        </tr>
                        <tr>
                            <td class="right"><b>Total:</b></td>
                            <td class="right">$2,000.00</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="checkout">
                    <a href="http://demopavothemes.com/pav_floral/index.php?route=checkout/cart">Посмотреть все</a>
                </div>
            </div>
        </div>
    </div>
</div>