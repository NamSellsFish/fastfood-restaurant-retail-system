package com.hcmute.fastfoodsystem.service.impl;

import com.hcmute.fastfoodsystem.model.Product;
import com.hcmute.fastfoodsystem.repository.ProductRepository;
import com.hcmute.fastfoodsystem.service.ProductService;
import org.springframework.stereotype.Service;
import org.springframework.web.client.ResourceAccessException;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository;

    public ProductServiceImpl(ProductRepository productRepository){this.productRepository = productRepository;}
    @Override
    public List<Product> getAllProduct() {
        return productRepository.findAll();
    }

    @Override
    public Product getProductByIdOrElseThrow(long id, String message) {
        return productRepository.findById(id).orElseThrow(() -> new ResourceAccessException(message));
    }

    @Override
    public Optional<Product> getProductById(long id) {
        return productRepository.findById(id);
    }

    @Override
    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public void deleteProduct(Product product) {
        productRepository.delete(product);
    }

    @Override
    public void deleteProductById(long id) {
        String message = "Product not found with id: " + id;
        getProductByIdOrElseThrow(id, message);
        productRepository.deleteById(id);
    }

    @Override
    public List<Product> addAllProducts(List<Product> products) {
        products.forEach(ele -> {
            if (ele.getId() != 0) {
                ele.setId(0);
            }
        });
        return productRepository.saveAll(products);
    }

}
