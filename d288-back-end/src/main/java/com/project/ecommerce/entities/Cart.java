package com.project.ecommerce.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "carts")
@Getter
@Setter
public class Cart {

    // Enum
    public enum statusType { pending, ordered, canceled }

    // PK
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cart_id")
    private Long id;

    // FK
    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    // A Cart has a Set of Cart Items
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cart")
    private Set<CartItem> cartItem = new HashSet<>();

    // Add Method
    public void add(CartItem item) {

        if (item == null) {
            if (cartItem == null) {
                cartItem = new HashSet<>();
            }
        }

        cartItem.add(item);
        item.setCart(this);

    }

    @Column(name = "package_price")
    private BigDecimal package_price;

    @Column(name = "party_size")
    private Integer party_size;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private statusType status;

    @Column(name = "order_tracking_number")
    private String orderTrackingNumber;

    @Column(name = "create_date")
    @CreationTimestamp
    private Date create_date;

    @Column(name = "last_update")
    @UpdateTimestamp
    private Date last_update;



}
