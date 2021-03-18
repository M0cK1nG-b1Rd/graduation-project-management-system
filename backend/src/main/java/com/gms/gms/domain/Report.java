package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.File;
import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.sun.org.apache.xpath.internal.operations.Bool;
import io.swagger.models.auth.In;
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

    @TableField("REPORT_ID")
    private Integer reportId;

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

    @TableField("FILE_SCORE")
    private Integer fileScore;

    @TableField("FILE_SCORE_WEIGHT")
    private Float fileScoreWeight;

    @TableField("DEFENSE_SCORE")
    private Integer defenseScore;

    @TableField("DEFENSE_SCORE_WEIGHT")
    private Float defenseScoreWeight;

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
