package com.project.ecommerce.services;

import com.project.ecommerce.dao.CartRepository;
import com.project.ecommerce.entities.Cart;
import com.project.ecommerce.entities.CartItem;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.Set;
import java.util.UUID;

@Service
public class CheckoutServiceImpl implements CheckoutService {

    private CartRepository cartRepository;

    // Constructor
    public CheckoutServiceImpl(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    @Override
    @Transactional
    public PurchaseResponse placeOrder(Purchase purchase) {

        // Retrieve Cart info from Angular dto
        Cart cart = purchase.getCart();

        // Set cart to ordered status
        cart.setStatus(Cart.statusType.ordered);

        // Generate Tracking number
        String orderTrackingNumber = generateOrderTrackingNumber();
        cart.setOrderTrackingNumber(orderTrackingNumber);

        // Populate order with OrderItems
        Set<CartItem> cartItems = purchase.getCartItems();
        cartItems.forEach(item -> cart.add(item));

        // save to the database
        cartRepository.save(cart);

        // return a response
        return new PurchaseResponse(orderTrackingNumber);
    }

    private String generateOrderTrackingNumber() {

        // generate random UUID number
        return UUID.randomUUID().toString();
    }
}
