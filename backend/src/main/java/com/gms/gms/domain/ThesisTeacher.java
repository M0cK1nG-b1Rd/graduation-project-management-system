package com.gms.gms.domain;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;


@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ThesisTeacher implements Serializable {

    private static final long serialVersionUID = 1L;
    @TableId(value = "ID",type = IdType.AUTO)
    private Integer id;

    @TableField("TEACHER_ID")
    private Integer teacherId;

    @TableField("THESIS_ID")
    private Integer thesisId;

    @TableField("IS_RELEASE")
    private Boolean isRelease;

    @TableField("SCORE")
    private Integer score;

    @TableField("TIME")
    private Date time;

}
