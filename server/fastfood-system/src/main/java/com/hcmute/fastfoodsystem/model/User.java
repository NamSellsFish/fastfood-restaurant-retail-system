package com.hcmute.fastfoodsystem.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @NotBlank(message = "firstName is mandatory")
    @Column(name = "first_name",  nullable = false, length = 20)
    private String firstName;

    @NotBlank(message = "lastName is mandatory")
    @Column(name = "last_name",  nullable = false, length = 20)
    private String lastName;

    @Email
    @Column(name = "email", unique = true, length = 45)
    private String email;

    @NotBlank(message = "password is mandatory")
    @Column(name = "password", nullable = false, length = 64)
    private String password;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @JsonIgnore
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(  name = "user_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @NotNull
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private List<Order> orders = new ArrayList<>();

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private Cart cart;


}
