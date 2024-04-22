package com.hcmute.fastfoodsystem.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "Order_Detail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "quantity")
    private int quantity;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @ManyToOne
    private Product product;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @ManyToOne
    private Order order;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @ManyToOne
    private Cart cart;

}