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
@Entity(name = "Category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "category")
    private String category;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @OneToMany(mappedBy = "category", orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Product> products = new ArrayList<>();

    public void addProduct(Product product){
        if(!this.getProducts().contains(product)){
            this.getProducts().add(product);
            product.setCategory(this);
        }
    }
}
