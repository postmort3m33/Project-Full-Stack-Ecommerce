package com.project.ecommerce.services;

import com.project.ecommerce.entities.Cart;
import com.project.ecommerce.entities.CartItem;
import com.project.ecommerce.entities.Customer;
import lombok.*;

import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Purchase {

    // Fields
    private Customer customer;
    private Cart cart;
    private Set<CartItem> cartItems;

}
