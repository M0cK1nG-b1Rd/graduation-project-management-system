package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.models.auth.In;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class FileStorage implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableField("DOC_ID")
    private String docId;

    @TableId(value = "FILE_ID", type = IdType.AUTO)
    private Integer fileId;

    @TableField("FILE_NAME")
    private String fileName;
    @JsonIgnore
    @TableField("TYPE")
    private String type;
    @JsonIgnore
    @TableField("SIZE")
    private Integer size;
    @JsonIgnore
    @TableField("LOCATION")
    private String location;
    @JsonIgnore
    @TableField("DEL_FLAG")
    private Boolean delFlag;
    @JsonIgnore
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

}
