package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class FileStorage implements Serializable {

    private static final long serialVersionUID = 1L;

        @TableField("DOC_ID")
    private Integer docId;

        @TableField("HANDIN_ID")
    private Integer handinId;

            @TableId("FILE_ID")
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
    private LocalDateTime uploadTime;

    public FileStorage(String fileName, String location) {
        this.fileName=fileName;
        this.location = location;
    }
}
