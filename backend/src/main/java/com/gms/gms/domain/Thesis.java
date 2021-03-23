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
 * 论文
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Thesis implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "THESIS_ID", type = IdType.AUTO)
    private Integer thesisId;

    @TableField("DOC_ID")
    private String docId;

    @TableField("STU_ID")
    private Integer stuId;

    @TableField("POSE_TIME")
    private Date poseTime;

    @TableField("STATUS")
    private String status;

    @TableField("SCORE")
    private Integer score;

    //分页
    private transient Integer page,size;

    //文件信息
    private transient List<FileStorage> fileStorages;
    //学生信息
    private transient Student student;
    //老师id
    private transient Integer teacherId;
    //安排id
    private transient Integer id;
    private transient Integer userId;
    //课题
    private transient Subject subject;
}
