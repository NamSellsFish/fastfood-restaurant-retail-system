package com.hcmute.fastfoodsystem.service.impl;

import com.hcmute.fastfoodsystem.model.Category;
import com.hcmute.fastfoodsystem.repository.CategoryRepository;
import com.hcmute.fastfoodsystem.service.CategoryService;
import org.springframework.stereotype.Service;
import org.springframework.web.client.ResourceAccessException;

import java.util.List;
import java.util.Optional;
@Service
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;
    public CategoryServiceImpl(CategoryRepository categoryRepository){this.categoryRepository = categoryRepository;}
    @Override
    public List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }

    @Override
    public Category getCategoryByIdOrElseThrow(long id, String message) {
        return categoryRepository.findById(id).orElseThrow(() -> new ResourceAccessException(message));
    }

    @Override
    public Category getCategoryByCategory(String category) {
        return categoryRepository.findByCategory(category);
    }

    @Override
    public Optional<Category> getCategoryById(long id) {
        return categoryRepository.findById(id);
    }

    @Override
    public Category saveCategory(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public void deleteCategory(Category category) {
        categoryRepository.delete(category);
    }

    @Override
    public void deleteCategoryById(long id) {
        String message = "Category not found with id: " + id;
        getCategoryByIdOrElseThrow(id, message);
        categoryRepository.deleteById(id);
    }

    @Override
    public List<Category> addAllUsers(List<Category> categories) {
        categories.forEach(ele -> {
            if (ele.getId() != 0) {
                ele.setId(0);
            }
        });
        return categoryRepository.saveAll(categories);
    }
}
