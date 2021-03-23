package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 课题
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Subject implements Serializable {


    private static final long serialVersionUID = 1L;

    @TableId(value = "ID", type = IdType.AUTO)
    private Integer id;

    @TableField("DOC_ID")
    private String docId;

    @TableField("SUB_ID")
    private String subId;

    @TableField("SUB_NAME")
    private String subName;

    @TableField("REQUIREMENT")
    private String requirement;

    @TableField("DESCRIPTION")
    private String description;

    @TableField("ZONE")
    private String zone;

    @TableField("POSE_BY")
    private Integer poseBy;

    @TableField("POSE_TIME")
    private Date poseTime;

    //数据字典中的值
    @TableField("STATUS")
    private String status;

    @TableField("AUDIT_BY")
    private Integer auditBy;

    @TableField("AUDIT_TIME")
    private Date auditTime;

    @TableField("FEEDBACK")
    private String feedback;

    //详情字段
    @TableField("CAPACITY")
    private Integer capacity;
    @TableField("CHOSEN")
    private Integer chosen;
    @TableField(exist = false)
    private String teacherName;

    @TableField(exist = false)
    @JsonProperty("teacherTitle")
    private String title;

    @TableField(exist = false)
    @JsonProperty("teacherHomePage")
    private String homePage;

    @TableField(exist = false)
    private String collegeName;
    @TableField(exist = false)
    private String majorName;
    @TableField(exist = false)
    private List<FileStorage> fileStorage;

    @TableField(exist = false)
    private String tel;
    @TableField(exist = false)
    private String mail;

    //搜索关键字
    @TableField(exist = false)
    private String keyWord;

    //分页
    @TableField(exist = false)
    private Integer page;
    @TableField(exist = false)
    private Integer size;
}
