package com.hcmute.fastfoodsystem.controller;

import com.hcmute.fastfoodsystem.dto.ProductDto;
import com.hcmute.fastfoodsystem.model.Category;
import com.hcmute.fastfoodsystem.model.Product;
import com.hcmute.fastfoodsystem.service.CategoryService;
import com.hcmute.fastfoodsystem.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;
    @GetMapping()
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<ProductDto>> getAllProducts() {
        return ResponseEntity.ok(ProductDto.of(productService.getAllProduct()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductDto> getProductById(@PathVariable("id") long id){
        String message = "Product not found";
        return ResponseEntity.ok(ProductDto.of(productService.getProductByIdOrElseThrow(id, message)));
    }
    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> createProduct(@RequestBody ProductDto productDTO) {
        try {
            Category category = categoryService.getCategoryByCategory(productDTO.getCategory());
            if (category == null) {
                return new ResponseEntity<>("Category not found", HttpStatus.NOT_FOUND);
            }
            Product product = new Product();
            product.setProductName(productDTO.getProductName());
            product.setImage(productDTO.getImage());
            product.setPrice(productDTO.getPrice());
            product.setQuantity(productDTO.getQuantity());
            category.addProduct(product);
            productService.saveProduct(product);
            return new ResponseEntity<>(product, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>("Failed to create product: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> updateProductById(@PathVariable("id") long id, @RequestBody ProductDto product){
        try {
            Optional<Product> existedProduct = productService.getProductById(id);
            if (existedProduct.isPresent()){
                Product updatedProduct = existedProduct.get();
                updatedProduct.setProductName(product.getProductName());
                updatedProduct.setImage(product.getImage());
                updatedProduct.setQuantity(product.getQuantity());
                updatedProduct.setPrice(product.getPrice());
                Category category = categoryService.getCategoryByCategory(product.getCategory());
                if (category == null) {
                    return new ResponseEntity<>("Category not found", HttpStatus.NOT_FOUND);
                }
                updatedProduct.setCategory(category);
                return new ResponseEntity<>(productService.saveProduct(updatedProduct), HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Failed to update product: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<HttpStatus> deleteProduct(@PathVariable("id") long id){
        try {
            productService.deleteProductById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e){
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
