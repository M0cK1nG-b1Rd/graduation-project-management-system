package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 学生小组，分批进行答辩
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class StuGroup implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID",type = IdType.AUTO)
    private Integer id;

    @TableField("GROUP_ID")
    private Integer groupId;

    @TableField("STU_ID")
    private Integer stuId;

    @TableField("STAGE")
    private String stage;


}
