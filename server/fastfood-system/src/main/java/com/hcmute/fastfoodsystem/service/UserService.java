package com.hcmute.fastfoodsystem.service;

import com.hcmute.fastfoodsystem.model.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    List<User> getAllUsers();
    User getUserByIdOrElseThrow(long id, String message);
    Optional<User> getUserById(long id);
    User saveUser(User user);
    void deleteUser(User user);
    void deleteUserById(long id);
    List<User> addAllUsers(List<User> users);

    Optional<User> getUserByEmail(String email);
    Optional<User> getUserByPassword(String password);
}
