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

    //在数据字典中
    @TableField("STATUS")
    private String status;

    @TableField("FEEDBACK")
    private String feedback;

    //分页参数
    @TableField(exist = false)
    private Integer page;

    @TableField(exist = false)
    private Integer size;

    //联合查询使用的参数
    @TableField(exist = false)
    private Subject subject;
}
