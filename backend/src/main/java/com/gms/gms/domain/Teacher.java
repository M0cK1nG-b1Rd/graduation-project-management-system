package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;

import com.gms.system.domain.User;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 老师
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Teacher extends User implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId
    @TableField("TEACHER_ID")
    private Integer teacherId;

    @TableField(exist = false)
    private String teacherName;

    @TableField("COLLEGE_ID")
    private Integer collegeId;

    @TableField("TITLE")
    private String title;

    @TableField("HOME_PAGE")
    private String homePage;

    @TableField(exist = false)
    private String collegeName;

}
