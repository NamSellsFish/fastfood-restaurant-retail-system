package com.hcmute.fastfoodsystem.dto;

import com.hcmute.fastfoodsystem.model.Product;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PRIVATE, force = true)
public class ProductDto {

    @Min(value=0)
    private long id;

    @NotBlank
    private String productName;

    @NotBlank
    private String image;

    @NotBlank
    private double price;

    @NotBlank
    private int quantity;

    @NotBlank
    private String category;

    public static List<ProductDto> of(List<Product> products){
        return products.stream().map(ProductDto::of).toList();
    }
    public static ProductDto of(@NotNull Product product) {
        return ProductDto.builder()
                .id(product.getId())
                .productName(product.getProductName())
                .image(product.getImage())
                .price(product.getPrice())
                .quantity(product.getQuantity())
                .category(product.getCategory().getCategory()).build();
    }
}
