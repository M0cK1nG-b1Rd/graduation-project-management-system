package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import io.swagger.models.auth.In;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class StageTaskResult implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("TASK_ID")
    private Integer taskId;

    @TableField("RETRIES")
    private Integer retries;

    @TableField("SUMMARY")
    private String summary;

    @TableField("DOC_ID")
    private String docId;

    @TableField("FEEDBACK")
    private String feedback;

    @TableField("STATUS")
    private String status;

    @TableField("AUDIT_TIME")
    private Date auditTime;

    @TableField("SCORE")
    private String score;

    //分页参数
    @TableField(exist = false)
    private Integer page;
    @TableField(exist = false)
    private Integer size;

    //详细信息
    @TableField(exist = false)
    private String teacherName;
    @TableField(exist = false)
    private String  studentName;

    @TableField(exist = false)
    private List<FileStorage> fileStorage;

}
