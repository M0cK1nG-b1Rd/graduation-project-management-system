package com.gms.gms.config;

import com.gms.gms.service.FileStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;

/**
 * @ClassName FileUploadConfiguration
 * @Description TODO
 * @Author 树下魅狐
 * @Date 2020/4/28 0028 19:15
 * @Version since 1.0
 **/
@Service
public class FileStorageConfig implements CommandLineRunner {

    @Autowired
    FileStorageService fileStorageService;

    @Override
    public void run(String... args) throws Exception {
        fileStorageService.clear();
        fileStorageService.init();
    }
}