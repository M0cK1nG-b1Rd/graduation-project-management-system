package com.gms.gms.domain;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 答辩
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Plea implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID",type = IdType.AUTO)
    private Integer id;

    @TableField("STAGE")
    private String stage;

    @TableField("STU_GROUP_ID")
    private Integer stuGroupId;

    @TableField("ACCEPTANCE_TEAM_ID")
    private Integer acceptanceTeamId;

    @TableField("CLASSROOM_ID")
    private Integer classroomId;

    private transient Integer secId;

    @TableField("TIME")
    private LocalDateTime time;

}