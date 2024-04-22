package com.hcmute.fastfoodsystem.dto;

import com.hcmute.fastfoodsystem.model.User;
import jakarta.validation.constraints.*;
import lombok.*;
import java.util.List;
import java.util.stream.Collectors;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {

    @Min(value=0)
    private long id;

    @NotBlank(message = "first name is required")
    private String firstName;

    @NotBlank(message = "last name is required")
    private String lastName;


    @Email(message = "email must follow the standard conventions")
    private String email;


    @NotBlank(message = "Password is mandatory")
    private String password;

    @NotBlank(message = "role is required")
    private String role;

    public static UserDto of(@NotNull User user) {
        String roles = user.getRoles().stream()
                .map(role -> role.getName().toString())
                .collect(Collectors.joining(", "));
        return UserDto.builder()
                .id(user.getId())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .email(user.getEmail())
                .password(user.getPassword())
                .role(roles).build();
    }

    public static List<UserDto> of(List<User> users){
        return users.stream().map(UserDto::of).toList();
    }
}

