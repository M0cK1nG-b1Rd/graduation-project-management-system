package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 阶段任务
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class StageTask implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "TASK_ID", type = IdType.AUTO)
    private Integer taskId;

    @TableField("SUB_ID")
    private String subId;

    @TableField("TASK_NAME")
    private String taskName;

    @TableField("DESCRIPTION")
    private String description;

    @TableField("DOC_ID")
    private String docId;

    @TableField("TEACHER_ID")
    private Integer teacherId;

    @TableField("STU_ID")
    private Integer stuId;

    @TableField("STAGE")
    private String stage;

    @TableField("STATUS")
    private Integer status;

    @TableField("START_TIME")
    private Date startTime;

    @TableField("END_TIME")
    private Date endTime;

    //分页参数
    @TableField(exist = false)
    private Integer page;
    @TableField(exist = false)
    private Integer size;


    //添加辅助说明的字段
    @TableField(exist = false)
    private String teacherName;

    @TableField(exist = false)
    private String studentName;

    @TableField(exist = false)
    private List<FileStorage> fileStorage;
}
