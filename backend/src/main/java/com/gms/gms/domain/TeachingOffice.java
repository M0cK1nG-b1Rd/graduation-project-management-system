package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 教研室
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TeachingOffice implements Serializable {

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

        @TableField("USER_MAIL")
    private String userMail;

    /**
     * 性别(0女1男)
     */
        @TableField("USER_GENDER")
    private Integer userGender;

        @TableField("OFFICE_ID")
    private Integer officeId;


}
