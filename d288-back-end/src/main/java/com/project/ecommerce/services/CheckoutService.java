package com.project.ecommerce.services;

public interface CheckoutService {

    // Checkout Method
    PurchaseResponse placeOrder(Purchase purchase);
}
