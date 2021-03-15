package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

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

    @TableField("DESCRIPTION")
    private String description;

    @TableField("POSE_BY")
    private Integer poseBy;

    @TableField("POSE_TIME")
    private Date poseTime;

    //数据字典中的值
    @TableField("STATUS")
    private String status;

    @TableField("MAJOR_ID")
    private Integer majorId;


    @TableField("AUDIT_BY")
    private String auditBy;

    @TableField("AUDIT_TIME")
    private Date auditTime;

    @TableField("FEEDBACK")
    private String feedback;

}
