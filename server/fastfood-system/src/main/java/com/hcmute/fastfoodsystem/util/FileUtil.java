package com.hcmute.fastfoodsystem.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.List;

@Slf4j
public class FileUtil {
    public static String readFile(String path) {
        String content = "";
        try {
            File file = new ClassPathResource(path).getFile();
            ;
            content = new String(Files.readAllBytes(file.toPath()));
        } catch (IOException exc) {
            log.error("Error reading file: {}", exc);
        }

        return content;
    }

    public static <T> List<T> getObjectsFromFile(String path, Class<T[]> objectClass) {
        List<T> objects = null;
        try {
            File file = new ClassPathResource(path).getFile();
            ObjectMapper objectMapper = new ObjectMapper();
            objects = Arrays.asList(objectMapper.readValue(file, objectClass));
        } catch (IOException exc) {
            log.error("Error reading file: {}", exc);
        }
        return objects;
    }
}
