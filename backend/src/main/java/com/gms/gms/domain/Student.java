package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;

import com.gms.system.domain.User;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 学生
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Student extends User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键,用户id
     */
    @TableField("STU_ID")
    private Integer stuId;

    @TableField("COLLEGE_ID")
    private Integer collegeId;

    @TableField("MAJOR_ID")
    private Integer majorId;

    @TableField("CLASS_ID")
    private Integer classId;

    @TableField("PLEA_TYPE")
    private Integer pleaType;

    @TableField(exist = false)
    private String collegeName, majorName, className;

}
