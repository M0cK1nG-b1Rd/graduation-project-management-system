package com.gms.gms.controller;


import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.FileStorage;
import com.gms.gms.service.FileStorageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("file")
public class FileStorageController {
    @Autowired
    FileStorageService fileStorageService;

    //上传接口
    @PostMapping("upload/{docId}")
    public GmsResponse upload(@RequestParam("file") MultipartFile file,@PathVariable("docId") String docId) {
        try {
            fileStorageService.saveByDefault(file,docId);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "文件上传成功：" + file.getOriginalFilename()));
        } catch (Exception e) {
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C400.getCode(),
                    Code.C400.getDesc(),
                    "无法上传文件：" + file.getOriginalFilename()));
        }
    }


    @GetMapping("files/{docId}")
    // 查询属于该Doc的附件
    public GmsResponse getFilesByDocId(@PathVariable String docId) {
        List<FileStorage> files = fileStorageService.selectByDocId(docId);
        return new GmsResponse().addCodeMessage(new Meta(
                Code.C200.getCode(),
                Code.C200.getDesc(),
                "文件列表查询成功"),files);
    }

    //涉及到下载就不好用封装好的响应对象了，直接使用ResponseEntity就好
    @GetMapping("download/{docId}/{fileId}")
    //通过docId和fileId查找对应的文件
    public ResponseEntity<Resource> getFile(@PathVariable("docId")String docId,@PathVariable("fileId")String fileId){
        Resource file = fileStorageService.load(docId,fileId);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment;filename=\""+file.getFilename()+"\"")
                .body(file);
    }
}

