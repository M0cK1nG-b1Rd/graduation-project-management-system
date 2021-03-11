package com.gms.gms.service;

import com.gms.gms.domain.FileStorage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

/**
 * @author MrBird
 */
public interface FileStorageService extends IService<FileStorage> {
    void init();

    void save(MultipartFile multipartFile);

    Resource load(String filename);

    Stream<Path> load();

    void clear();

}
