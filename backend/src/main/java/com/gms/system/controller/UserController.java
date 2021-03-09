package com.gms.system.controller;

import com.gms.common.annotation.Log;
import com.gms.common.controller.BaseController;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.QueryRequest;
import com.gms.common.exception.GmsException;
import com.gms.common.utils.AesEncryptUtil;
import com.gms.common.utils.MD5Util;
import com.gms.system.domain.User;
import com.gms.system.service.UserService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

@Slf4j
@Validated
@RestController
@RequestMapping("user")
public class UserController extends BaseController {

    private String message;

    @Autowired
    private UserService userService;
//    @Autowired
//    private RoleService roleService;

    @GetMapping("check/{username}")
    public boolean checkUserName(@NotBlank(message = "{required}") @PathVariable String username) {
        return this.userService.findByName(username) == null;
    }

    @GetMapping("/{username}")
    public User detail(@NotBlank(message = "{required}") @PathVariable String username) {
        //UserServiceImpl中findByName方法改为调用baseMapper.findDetail(username)
        return this.userService.findByName(username);
    }

    @GetMapping
    @RequiresPermissions("user:view")
    public Map<String, Object> userList(QueryRequest queryRequest, User user) {
        return getDataTable(userService.findUserDetail(user, queryRequest));
    }

//    @Log("新增用户")
//    @PostMapping
//    @RequiresPermissions("user:add")
//    public GmsResponse addUser(@RequestBody @Valid User user) throws GmsException {
//        try {
//            this.userService.createUser(user);
//            return new GmsResponse().code("200").message("新增用户成功").status("success");
//        } catch (Exception e) {
//            message = "新增用户失败";
//            log.error(message, e);
//            throw new GmsException(message);
//        }
//    }

//    @Log("修改用户")
//    @PutMapping
//    @RequiresPermissions("user:update")
//    public GmsResponse updateUser(@RequestBody @Valid User user) throws GmsException {
//        try {
//            this.userService.updateUser(user);
//            return new GmsResponse().code("200").message("修改用户成功").status("success");
//        } catch (Exception e) {
//            message = "修改用户失败";
//            log.error(message, e);
//            throw new GmsException(message);
//        }
//    }

    @Log("删除用户")
    @DeleteMapping("/{userIds}")
    @RequiresPermissions("user:delete")
    public GmsResponse deleteUsers(@NotBlank(message = "{required}") @PathVariable String userIds) throws GmsException {
        try {
            String[] ids = userIds.split(StringPool.COMMA);
            this.userService.deleteUsers(ids);
            return new GmsResponse().code("200").message("删除用户成功").status("success");
        } catch (Exception e) {
            message = "删除用户失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    @GetMapping("password/check")
    public boolean checkPassword(
            @NotBlank(message = "{required}") String username,
            @NotBlank(message = "{required}") String password) {
        String encryptPassword = MD5Util.encrypt(username, AesEncryptUtil.desEncrypt(password));
        User user = userService.findByName(username);
        if (user != null)
            return StringUtils.equals(user.getPassword(), encryptPassword);
        else
            return false;
    }

    @PutMapping("password")
    public GmsResponse updatePassword(
            @NotBlank(message = "{required}") String username,
            @NotBlank(message = "{required}") String password) throws GmsException {
        try {
            userService.updatePassword(username, AesEncryptUtil.desEncrypt(password));
            return new GmsResponse().code("200").message("修改密码成功").status("success");
        } catch (Exception e) {
            message = "修改密码失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PutMapping("password/reset")
    @RequiresPermissions("user:reset")
    public GmsResponse resetPassword(@NotBlank(message = "{required}") String usernames) throws GmsException {
        try {
            String[] usernameArr = usernames.split(StringPool.COMMA);
            this.userService.resetPassword(usernameArr);
            return new GmsResponse().code("200").message("重置用户密码成功").status("success");
        } catch (Exception e) {
            message = "重置用户密码失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PostMapping("excel")
    @RequiresPermissions("user:export")
    public void export(QueryRequest queryRequest,@RequestBody User user, HttpServletResponse response) throws GmsException {
        try {
            List<User> users = this.userService.findUserDetail(user, queryRequest).getRecords();
            ExcelKit.$Export(User.class, response).downXlsx(users, false);
        } catch (Exception e) {
            message = "导出Excel失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}
