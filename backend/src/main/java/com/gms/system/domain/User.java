package com.gms.system.domain;

import com.gms.common.converter.TimeConverter;
import com.gms.common.domain.RegexpConstant;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.wuwenze.poi.annotation.Excel;
import com.wuwenze.poi.annotation.ExcelField;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Data
@TableName("user")
@Excel("用户信息表")
public class User implements Serializable {

    private static final long serialVersionUID = -4852732617765810959L;

    // 默认密码
    public static final String DEFAULT_PASSWORD = "1234qwer";

    @TableId(value = "USER_ID", type = IdType.AUTO)
    private Integer userId;

    @Size(min = 4, max = 10, message = "{range}")
    @ExcelField(value = "真实姓名")
    private String realName;

    private String username;

    private String password;


    @Size(max = 50, message = "{noMoreThan}")
    @Email(message = "{email}")
    @ExcelField(value = "邮箱")
    private String mail;

    @Pattern(regexp = RegexpConstant.MOBILE_REG, message = "{mobile}")
    @ExcelField(value = "手机号")
    private String tel;

    private String gender;

    @NotBlank(message = "{required}")
    private transient String roleId;
    @ExcelField(value = "角色")
    private transient String roleName;

    // 排序字段
    private transient String sortField;

    // 排序规则 ascend 升序 descend 降序
    private transient String sortOrder;

    private transient String createTimeFrom;
    private transient String createTimeTo;

    private transient String id;

    /**
     * shiro-redis v3.1.0 必须要有 getAuthCacheKey()或者 getId()方法
     * # Principal id field name. The field which you can get unique id to identify this principal.
     * # For example, if you use UserInfo as Principal class, the id field maybe userId, userName, email, etc.
     * # Remember to add getter to this id field. For example, getUserId(), getUserName(), getEmail(), etc.
     * # Default value is authCacheKey or id, that means your principal object has a method called "getAuthCacheKey()" or "getId()"
     *
     * @return userId as Principal id field name
     */
    public Integer getAuthCacheKey() {
        return userId;
    }

    /**
     * 下属
     * 所管理的人的id
     */
//    @TableField(exist = false)
//    private String subordinates;
}
