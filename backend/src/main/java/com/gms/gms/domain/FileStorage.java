package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.util.Date;

import io.swagger.models.auth.In;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class FileStorage implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableField("DOC_ID")
    private String docId;

    @TableField("HANDIN_ID")
    private Integer handinId;


    @TableId(value = "FILE_ID", type = IdType.AUTO)
    private Integer fileId;

    @TableField("FILE_NAME")
    private String fileName;

    @TableField("TYPE")
    private String type;

    @TableField("SIZE")
    private Integer size;

    @TableField("LOCATION")
    private String location;

    @TableField("DEL_FLAG")
    private Boolean delFlag;

    @TableField("UPLOAD_BY")
    private Integer uploadBy;

    @TableField("UPLOAD_TIME")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date uploadTime;

    public FileStorage(String fileName, String location, Integer uploadBy) {
        this.fileName = fileName;
        this.location = location;
        this.uploadBy = uploadBy;
        this.uploadTime = new Date();
    }

    public FileStorage(String fileName, String location, Integer uploadBy, String docId) {
        this(fileName, location, uploadBy);
        this.docId = docId;
    }

    public FileStorage(String fileName, String location, Integer uploadBy, String docId, Integer handinId) {
        this(fileName, location, uploadBy, docId);
        this.handinId = handinId;
    }
}
