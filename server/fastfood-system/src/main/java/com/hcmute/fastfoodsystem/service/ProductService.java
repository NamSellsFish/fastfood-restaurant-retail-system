package com.hcmute.fastfoodsystem.service;

import com.hcmute.fastfoodsystem.model.Product;
import com.hcmute.fastfoodsystem.model.User;

import java.util.List;
import java.util.Optional;

public interface ProductService {
    List<Product> getAllProduct();
    Product getProductByIdOrElseThrow(long id, String message);
    Optional<Product> getProductById(long id);
    Product saveProduct(Product product);
    void deleteProduct(Product product);
    void deleteProductById(long id);
    List<Product> addAllProducts(List<Product> products);
}
