package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class PleaResult implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID",type = IdType.AUTO)
    private Integer id;

    @TableField("STU_ID")
    private Integer stuId;

    @TableField("PLEA_ID")
    private Integer pleaId;

    @TableField("STAGE")
    private String stage;

    @TableField("SCORE")
    private Integer score;

    @TableField("FEEDBACK")
    private String feedback;

    @TableField("IS_PASSED")
    private Boolean isPassed;

    private transient Integer userId;
}
