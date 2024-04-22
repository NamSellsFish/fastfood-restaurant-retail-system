package com.hcmute.fastfoodsystem.util;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CustomResponse {
    @NotNull
    private String message;

    @Size(min = 100, max = 599)
    private int status = 400;

    @Builder.Default
    @Min(value = 0)
    private long timeStamp = System.currentTimeMillis();

    public CustomResponse(String message){
        this.message = message;
    }

    public static CustomResponse ok(String message) {
        return CustomResponse.builder().message(message).status(HttpStatus.OK.value()).build();
    }
    public static CustomResponse badRequest(String message) {
        return CustomResponse.builder().message(message).status(HttpStatus.BAD_REQUEST.value()).build();
    }
    public static CustomResponse notFound(String message) {
        return CustomResponse.builder().message(message).status(HttpStatus.NO_CONTENT.value()).build();
    }

}
