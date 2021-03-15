package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class AcceptanceTeacher implements Serializable {
    private transient Teacher teacher;
    @TableField("IS_LEADER")
    private Boolean isLeader;
}
