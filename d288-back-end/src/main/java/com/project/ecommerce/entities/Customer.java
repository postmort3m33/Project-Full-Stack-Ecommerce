package com.project.ecommerce.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="customers")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Customer {

    // PK
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_id")
    private Long id;

    // FK
    @ManyToOne
    @JoinColumn(name = "division_id", nullable = false)
    private Division division;

    // A Customer can have a Set of Carts
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customer")
    private Set<Cart> carts = new HashSet<>();

    // Add Method
    public void add(Cart cart) {

        if (cart == null) {
            if (carts == null) {
                carts = new HashSet<>();
            }
        }

        carts.add(cart);
        cart.setCustomer(this);

    }

    @Column(name = "address")
    @NotBlank(message = "Address must not be blank!")
    private String address;

    @Column(name = "create_date")
    @CreationTimestamp
    private Date create_date;

    @Column(name = "customer_first_name")
    @NotBlank(message = "First Name must not be blank!")
    private String firstName;

    @Column(name = "customer_last_name")
    @NotBlank(message = "Last Name must not be blank!")
    private String lastName;

    @Column(name = "last_update")
    @UpdateTimestamp
    private Date last_update;

    @Column(name = "phone")
    @NotBlank(message = "Phone must not be blank!")
    private String phone;

    @Column(name = "postal_code")
    @NotBlank(message = "Postal Code must not be blank!")
    private String postal_code;
}
