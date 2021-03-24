package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.File;
import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 报告
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Report implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID",type = IdType.AUTO)
    private Integer id;

    @TableField("SUB_ID")
    private String subId;

    @TableField("DOC_ID")
    private String docId;

    @TableField("STAGE")
    private String stage;

    /**
     * 属于开题
     */
    @TableField("MEANING")
    private String meaning;

    /**
     * 属于开题
     */
    @TableField("RESULT")
    private String result;

    /**
     * 属于开题
     */
    @TableField("PLAN")
    private String plan;

    /**
     * 属于中期
     */
    @TableField("PROGRESS")
    private String progress;

    /**
     * 属于中期
     */
    @TableField("POST_PLAN")
    private String postPlan;

    /**
     * 属于结题
     */
    @TableField("APPLY_REASON")
    private String applyReason;

    @TableField("POSE_BY")
    private Integer poseBy;

    @TableField("POSE_TIME")
    private Date poseTime;

    @TableField("STATUS")
    private String status;

    @TableField("AUDIT_BY")
    private Integer auditBy;

    @TableField("AUDIT_TIME")
    private Date auditTime;

    @TableField("COMMENT")
    private String comment;

    @TableField("SCORE")
    private Integer score;

    @TableField("IS_RELEASED")
    private Boolean isReleased;



    //分页参数
    @TableField(exist = false)
    private Integer page;
    @TableField(exist = false)
    private Integer size;


    //联合查询，增加详细信息
    @TableField(exist = false)
    private String subName;
    @TableField(exist = false)
    private String  studentName;
    @TableField(exist = false)
    private List<FileStorage> fileStorage;
}
