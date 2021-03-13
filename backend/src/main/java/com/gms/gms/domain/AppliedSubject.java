package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 选题
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class AppliedSubject implements Serializable {

    private static final long serialVersionUID = 1L;

            @TableId("ID")
    private Integer id;

        @TableField("SUB_ID")
    private String subId;

        @TableField("STU_ID")
    private Integer stuId;

        @TableField("STATUS")
    private Integer status;

        @TableField("IS_PASSED")
    private Boolean isPassed;

        @TableField("FEEDBACK")
    private String feedback;


}
