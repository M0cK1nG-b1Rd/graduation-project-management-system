package com.gms.gms.service;

import com.gms.gms.domain.FileStorage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.swagger.models.auth.In;
import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Path;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

/**
 * @author MrBird
 */
public interface FileStorageService extends IService<FileStorage> {
    void init();

    void saveByDefault(MultipartFile multipartFile,String docId);

    void saveByHandinId(MultipartFile multipartFile, String docId, Integer handinId);

    Resource load(String docId,String handinId);

    Stream<Path> load();

    void clear();

    List<FileStorage> selectByDocId(String docId);
}
