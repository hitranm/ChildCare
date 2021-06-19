/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.Cart;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HOANGKHOI
 */
public class CartObject implements Serializable {

    private List<CartItem> cartItems;

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public boolean addServiceToCart(CartItem reservation) {
        //1. Check exist cart
        if (this.cartItems == null) {
            this.cartItems = new ArrayList<>();
        }

        //2. Check exist service
        for (CartItem item : cartItems) {
            //Duplicated when there are duplicated patientId
            if (item.getPatientId() == reservation.getPatientId()) {
                return false;
            }
        }

        //3. Add service to cart
        this.cartItems.add(reservation);
        return true;
    }

    public boolean removeServiceFromCart(int patientId) {
        boolean status = false;
        //1, Check exist cart
        if (this.cartItems == null) {
            this.cartItems = new ArrayList<>();
        }

        for (CartItem item : this.cartItems) {
            if (item.getPatientId() == patientId) {
                cartItems.remove(item);
                status = true;
            }
        }
        // If the cart is empty, delete it
        if (this.cartItems.isEmpty()) {
            this.cartItems = null;
        }
        return status;
    }
}
