package com.hcmute.fastfoodsystem.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "Cart")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @OneToMany(mappedBy = "cart", orphanRemoval = true, fetch = FetchType.EAGER)
    private List<OrderDetail> orderDetailList = new ArrayList<>();

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
}
