package com.hcmute.fastfoodsystem.controller;

import com.hcmute.fastfoodsystem.dto.UserDto;
import com.hcmute.fastfoodsystem.model.User;
import com.hcmute.fastfoodsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.password.PasswordEncoder;
import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    PasswordEncoder encoder;
    @GetMapping()
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<UserDto>> getAllUsers() {
        return ResponseEntity.ok(UserDto.of(userService.getAllUsers()));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<UserDto> getUserById(@PathVariable long id){
        String message = "User not found";
        return ResponseEntity.ok(UserDto.of(userService.getUserByIdOrElseThrow(id, message)));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> updateUserById(@PathVariable("id") long id, @RequestBody UserDto user){
        Optional<User> existedUser = userService.getUserById(id);
        if (existedUser.isPresent()){
            User updatedUser = existedUser.get();
            updatedUser.setFirstName(user.getFirstName());
            updatedUser.setLastName(user.getLastName());
            updatedUser.setEmail(user.getEmail());
            updatedUser.setPassword(encoder.encode(user.getPassword()));
            return new ResponseEntity<>(userService.saveUser(updatedUser), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<HttpStatus> deleteUser(@PathVariable("id") long id){
        try {
            userService.deleteUserById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e){
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
