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
    
    public int getCountItem() {
        if(this.cartItems == null) {
            this.cartItems = new ArrayList<>();
        }
        return this.cartItems.size();
    }

    public boolean removeServiceFromCart(int patientId) {
        boolean status = false;
        //1, Check exist cart
        if (this.cartItems == null) {
            this.cartItems = new ArrayList<>();
        }

        CartItem deleteItem = null;
        for (CartItem item : this.cartItems) {
            if (item.getPatientId() == patientId) {
                deleteItem = item;
            }
        }      
        if(deleteItem != null) {
            status = this.cartItems.remove(deleteItem);
        }
        // If the cart is empty, delete it
        if (this.cartItems.isEmpty()) {
            this.cartItems = null;
        }
        return status;
    }
    
    public CartItem getCartItem(int patientId) {
        //1 Check exist cart
        if (this.cartItems == null) {
            this.cartItems = new ArrayList<>();
        }
        
        for(CartItem item : this.cartItems) {
            if(item.getPatientId() == patientId) {
                return item;
            }
        }
        return null;
    }
    
    public boolean UpdateCartItem(CartItem updateItem) {
        //1 Check exist cart
        if (this.cartItems == null) {
            this.cartItems = new ArrayList<>();
        }
        
        CartItem targetItem = getCartItem(updateItem.getPatientId());
        if(targetItem != null) {
            targetItem.setServiceId(updateItem.getServiceId());
            targetItem.setTimeIntervalId(updateItem.getTimeIntervalId());
            targetItem.setCheckInTime(updateItem.getCheckInTime());
            return true;
        } else return false; // not found
    }
}
