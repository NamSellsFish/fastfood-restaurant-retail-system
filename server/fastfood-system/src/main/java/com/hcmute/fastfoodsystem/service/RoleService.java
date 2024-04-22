package com.hcmute.fastfoodsystem.service;

import com.hcmute.fastfoodsystem.model.Role;
import com.hcmute.fastfoodsystem.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface RoleService {
    List<Role> getAllRoles();
    Role getRoleByIdOrElseThrow(long id, String message);
    Optional<Role> getRoleById(long id);
    Role saveRole(Role role);
    void deleteRole(Role role);
    void deleteRoleById(long id);

    List<Role> addAllRoles(List<Role> roles);
}
