package com.hcmute.fastfoodsystem.payload.response;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Getter
@Setter
public class JwtResponse {
    private String token;
    private String type = "Bearer";
    private long id;
    private String firstName;
    private String lastName;
    private String username;
    private List<String> roles;

    public JwtResponse(String accessToken, long id,String firstName, String lastName, String username, List<String> roles) {
        this.token = accessToken;
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.roles = roles;
    }


}

