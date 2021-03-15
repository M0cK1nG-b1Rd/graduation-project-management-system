package com.gms.gms.domain;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

//答辩老师分组
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TeacherTeam implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value = "TEAM_ID", type = IdType.AUTO)
    private int teamId;

    @TableField("STAGE")
    private String stage;

    @TableField("SEC_ID")
    private int secId;

    private transient Secretary secretary;
    private transient List<AcceptanceTeacher> teachers;
}
