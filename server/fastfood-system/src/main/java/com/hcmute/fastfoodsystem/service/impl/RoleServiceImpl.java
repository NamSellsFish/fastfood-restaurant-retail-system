package com.hcmute.fastfoodsystem.service.impl;

import com.hcmute.fastfoodsystem.model.Role;
import com.hcmute.fastfoodsystem.repository.RoleRepository;
import com.hcmute.fastfoodsystem.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.web.client.ResourceAccessException;

import java.util.List;
import java.util.Optional;
@Service
public class RoleServiceImpl implements RoleService {
    private final RoleRepository roleRepository;
    public RoleServiceImpl(RoleRepository roleRepository){this.roleRepository = roleRepository;}
    @Override
    public List<Role> getAllRoles() {
        return roleRepository.findAll();
    }

    @Override
    public Role getRoleByIdOrElseThrow(long id, String message) {
        return roleRepository.findById(id).orElseThrow(() -> new ResourceAccessException(message));
    }

    @Override
    public Optional<Role> getRoleById(long id) {
        return roleRepository.findById(id);
    }

    @Override
    public Role saveRole(Role role) {
        return roleRepository.save(role);
    }

    @Override
    public void deleteRole(Role role) {
        roleRepository.delete(role);
    }

    @Override
    public void deleteRoleById(long id) {
        String message = "Role not found with id: " + id;
        getRoleByIdOrElseThrow(id, message);
        roleRepository.deleteById(id);
    }

    @Override
    public List<Role> addAllRoles(List<Role> roles) {
        roles.forEach(ele -> {
            if (ele.getId() != 0) {
                ele.setId(0);
            }
        });
        return roleRepository.saveAll(roles);
    }

}
