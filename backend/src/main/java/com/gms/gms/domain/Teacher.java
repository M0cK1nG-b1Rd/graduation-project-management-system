package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
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
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键,用户id
     */
            @TableId("USER_ID")
    private Integer userId;

    /**
     * 用户名
     */
        @TableField("USER_NAME")
    private String userName;

    /**
     * 用户登录账号
     */
        @TableField("USER_ACCOUNT")
    private String userAccount;

    /**
     * 密码
     */
        @TableField("USER_PASSWORD")
    private String userPassword;

    /**
     * 用户电话号
     */
        @TableField("USER_TEL")
    private String userTel;

    /**
     * 性别(0女1男)
     */
        @TableField("USER_GENDER")
    private Integer userGender;

        @TableField("USER_MAIL")
    private String userMail;

        @TableField("TEACHER_ID")
    private Integer teacherId;

        @TableField("COLLEGE_ID")
    private Integer collegeId;

        @TableField("TITLE")
    private String title;

        @TableField("HOME_PAGE")
    private String homePage;


}
