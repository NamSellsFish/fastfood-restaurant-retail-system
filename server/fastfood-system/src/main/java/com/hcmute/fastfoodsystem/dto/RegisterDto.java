package com.hcmute.fastfoodsystem.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PRIVATE, force = true)
public class RegisterDto {

    @NotBlank(message = "first name is required")
    private String firstName;

    @NotBlank(message = "last name is required")
    private String lastName;

    @Email(message = "email must follow the standard conventions")
    private String email;

    @NotBlank(message = "Password is mandatory")
    @Size(min = 6, max = 40)
    private String password;

    private Set<String> role;

}
