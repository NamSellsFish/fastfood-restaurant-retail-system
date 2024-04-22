package com.hcmute.fastfoodsystem.service;

import com.hcmute.fastfoodsystem.model.Category;
import com.hcmute.fastfoodsystem.model.Product;

import java.util.List;
import java.util.Optional;

public interface CategoryService {
    List<Category> getAllCategory();
    Category getCategoryByIdOrElseThrow(long id, String message);
    Category getCategoryByCategory(String category);
    Optional<Category> getCategoryById(long id);
    Category saveCategory(Category category);
    void deleteCategory(Category category);
    void deleteCategoryById(long id);
    List<Category> addAllUsers(List<Category> categories);
}
