package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.FileStorage;
import com.gms.gms.dao.FileStorageMapper;
import com.gms.gms.service.FileStorageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.system.manager.UserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.stream.Stream;

/**
 * @author MrBird
 */
@Service
public class FileStorageServiceImpl extends ServiceImpl<FileStorageMapper, FileStorage> implements FileStorageService {


    @Value("${file.dir_path}")
    private Path dirPath;


    @Override
    public void init() {
        try {
            Files.createDirectory(dirPath);
        } catch (IOException e) {
            throw new RuntimeException("无法创建用于上传的文件夹！");
        }
    }

    @Override
    public void save(MultipartFile multipartFile,String docId) {
        try {
            //todo 存储到本地时docId使用uuid
            //todo 在数据库中插入记录
            //todo 下载时url通过uuid进行映射，下载时通过uuid进行文件名的还原
            FileStorage record= new FileStorage(
                    multipartFile.getOriginalFilename(),
                    dirPath.toString(),
                    GmsUtil.getCurrentUser().getUserId(),
                    docId);
            this.save(record);
            Files.copy(multipartFile.getInputStream(), this.dirPath.resolve(multipartFile.getOriginalFilename()));

        } catch (IOException e) {
            throw new RuntimeException("无法存储文件：" + e.getMessage());
        }
    }

    @Override
    public Resource load(String filename,String handinId) {
        //todo 使用handin
        Path file = dirPath.resolve(filename);
        try {
            Resource resource = new UrlResource(file.toUri());
            if (resource.exists() || resource.isReadable()) {
                return resource;
            } else {
                throw new RuntimeException("无法读取文件");
            }
        } catch (MalformedURLException e) {
            throw new RuntimeException("错误：" + e.getMessage());
        }
    }

    @Override
    public Stream<Path> load() {
        try {
            return Files.walk(this.dirPath, 1)
                    .filter(path -> !path.equals(this.dirPath))
                    .map(this.dirPath::relativize);
        } catch (IOException e) {
            throw new RuntimeException("无法加载文件");
        }
    }

    @Override
    public void clear() {
        FileSystemUtils.deleteRecursively(dirPath.toFile());
    }

    @Override
    public List<FileStorage> selectAllFiles() {
        return this.baseMapper.selectAllFiles();
    }

}
