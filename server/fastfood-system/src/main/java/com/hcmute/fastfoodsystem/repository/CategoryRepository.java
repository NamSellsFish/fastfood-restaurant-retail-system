package com.hcmute.fastfoodsystem.repository;

import com.hcmute.fastfoodsystem.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.expression.spel.ast.OpAnd;

import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    Category findByCategory(String category);
}
