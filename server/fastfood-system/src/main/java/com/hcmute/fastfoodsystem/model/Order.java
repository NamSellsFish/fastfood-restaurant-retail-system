package com.hcmute.fastfoodsystem.model;


import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "`Order`")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private long orderId;

    @NotNull
    @Column(name = "order_date")
    private Date orderDate;

    @NotNull
    @Column(name = "total_amount")
    private double totalAmount;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @ManyToOne
    private User user;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
    private List<OrderDetail> orderDetails = new ArrayList<>();
}
