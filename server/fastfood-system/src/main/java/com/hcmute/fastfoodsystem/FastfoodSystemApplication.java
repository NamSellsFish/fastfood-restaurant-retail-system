package com.hcmute.fastfoodsystem;

import com.hcmute.fastfoodsystem.model.*;
import com.hcmute.fastfoodsystem.service.CategoryService;
import com.hcmute.fastfoodsystem.service.ProductService;
import com.hcmute.fastfoodsystem.service.RoleService;
import com.hcmute.fastfoodsystem.service.UserService;
import com.hcmute.fastfoodsystem.util.FileUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;


@Slf4j
@SpringBootApplication
public class FastfoodSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(FastfoodSystemApplication.class, args);
	}

	@Bean
	public CommandLineRunner commandLineRunner(RoleService roleService,  UserService userService, ProductService productService, CategoryService categoryService, PasswordEncoder encoder, @Value("${server.port}") int port) {
		return args -> {
			log.info("Server is running on port: {}", port);
            preloadData(roleService, userService, productService, categoryService , encoder);
		};
	}

	private void preloadData(RoleService roleService, UserService userService, ProductService productService, CategoryService categoryService, PasswordEncoder encoder) {
		List<Role> roles = roleService.getAllRoles();

		List<User> users = FileUtil.getObjectsFromFile("preloadData/user.json", User[].class);
		if(users != null){
			users = users.stream().peek(user -> user.setPassword(encoder.encode(user.getPassword()))).toList();
		}
		for (User user : users) {
			user.setRoles(new HashSet<>(roles));
		}
		List<Product> products = FileUtil.getObjectsFromFile("preloadData/product.json", Product[].class);
		List<Category> categories = FileUtil.getObjectsFromFile("preloadData/category.json", Category[].class);
//		List<Role> roles = FileUtil.getObjectsFromFile("preloadData/role.json", Role[].class);

		for (int i = 0; i < products.size(); i++){
			categories.get(i % categories.size()).addProduct(products.get(i));
		}


//		List<Role> persistedRoles = roleService.addAllRoles(roles);
		List<User> persistedUsers = userService.addAllUsers(users);
		List<Category> persistedCategories = categoryService.addAllUsers(categories);
		List<Product> persistedProducts = productService.addAllProducts(products);


	}

}
