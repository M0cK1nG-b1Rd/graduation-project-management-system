package com.gms.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@TableName("role_stage_perms")
@Data
public class RoleStagePerms implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer roleId;

    private Integer stageId;

    private String perms;
}