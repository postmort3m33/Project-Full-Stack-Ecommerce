package com.project.ecommerce.controllers;

import com.project.ecommerce.services.CheckoutService;
import com.project.ecommerce.services.Purchase;
import com.project.ecommerce.services.PurchaseResponse;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("http://localhost:4200")
@RestController
@RequestMapping("/api/checkout")
public class CheckoutController {

    // Class Vars
    private CheckoutService checkoutService;

    // Constructor
    @Autowired
    public CheckoutController(CheckoutService checkoutService) {

        this.checkoutService = checkoutService;

    }

    // PostMapping
    @PostMapping("/purchase")
    public PurchaseResponse placeOrder(@Valid @RequestBody Purchase purchase, BindingResult bindingResult) {

        if(bindingResult.hasErrors()) {

            // If has errors, return null..
            return null;
        }
        else {

            // Send Purchase Response
            PurchaseResponse purchaseResponse = checkoutService.placeOrder(purchase);

            return purchaseResponse;
        }
    }
}
