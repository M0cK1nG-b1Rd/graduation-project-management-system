package com.gms.gms.controller;


import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Validate;
import com.gms.gms.service.ValidateService;
import com.gms.system.domain.User;
import com.gms.system.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Api(tags = "通过邮件修改密码相关api")
@RestController
@RequestMapping("validate")
public class ValidateController {

    @Autowired
    private ValidateService validateService;

    @Autowired
    private UserService userService;

    //发送邮件的类
    @Autowired
    private JavaMailSender mailSender;

    //这里使用的是我们已经在配置问价中固定了的变量值,也就是通过这个邮箱向目标邮箱发送重置密码的邮件
    @Value("${spring.mail.username}")
    private String from;

    /**
     * 发送忘记密码邮件请求，每日申请次数不超过20次，每次申请间隔不低于1分钟
     *
     * @param email
     * @param request
     * @return
     */
    @ApiOperation(value = "发送忘记密码邮件", notes = "发送忘记密码邮件")
    @PostMapping("sendValidationEmail")
    public GmsResponse sendValidationEmail(@ApiParam("邮箱地址") @RequestParam String email,
                                           HttpServletRequest request) throws MessagingException {
        User user = userService.findUserByEmail(email);
        if (user == null) {
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    "该邮箱所属用户不存在")
            );
        }
        if (validateService.sendValidateLimitation(email, 20, 1)) {
            // 若允许重置密码，则在validate表中插入一行数据，带有token
            Validate validate = new Validate();
            validateService.insertNewResetRecord(validate, user, UUID.randomUUID().toString());
            // 设置邮件内容
            // TODO: 2021/3/21 替换为前端工程的入口 
            String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            // multipart模式
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "utf-8");
            mimeMessageHelper.setTo(email);
            mimeMessageHelper.setFrom(from);
            mimeMessageHelper.setSubject("重置密码");
            StringBuilder sb = new StringBuilder();
            sb.append("<html><head></head>");
            sb.append("<body><h1>点击下面的链接重置密码</h1>" +
                    "<a href = " + appUrl + "/validate/resetPassword?token=" + validate.getResetToken() + ">" + appUrl + "/validate/resetPassword?token=" + validate.getResetToken() + "</a></body>");
            sb.append("</html>");
            // 启用html
            mimeMessageHelper.setText(sb.toString(), true);
            validateService.sendPasswordResetEmail(mimeMessage);
            Map<String, Object> map1 = new HashMap<>();
            map1.put("token", validate.getResetToken());
            map1.put("link", appUrl + "/validate/resetPassword?token=" + validate.getResetToken());
            map1.put("message", "邮件已经发送");
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "操作成功！")
            );
        } else {
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    "操作过于频繁，请稍后再试！")
            );
        }

    }

    /**
     * 将url的token和数据库里的token匹配，成功后便可修改密码，token有效期为5分钟
     *
     * @param token
     * @param password
     * @param confirmPassword
     * @return
     */
    @ApiOperation(value = "重置密码,邮箱中的token有效时间为5分钟,每天每个用户最多发10次邮件", notes = "重置密码")
    @PostMapping("resetPassword")
    public GmsResponse resetPassword(@ApiParam("token") @RequestParam("token") String token,
                                     @ApiParam("密码") @RequestParam("password") String password,
                                     @ApiParam("密码确认") @RequestParam("confirmPassword") String confirmPassword) {
        // 通过token找到validate记录
        Validate validate = validateService.findUserByResetToken(token);
        if (validate == null) {
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    "该重置请求不存在")
            );
        }
        if (validateService.validateLimitation(validate.getEmail(), Long.MAX_VALUE, 5, token)) {
            Integer userId = validate.getUserId();
            if (password.equals(confirmPassword)) {
                userService.updatePasswordByUserId(userId, password);

                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C200.getCode(),
                        Code.C200.getDesc(),
                        "成功重置密码")
                );
            } else {
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "确认密码和密码不一致，请重新输入")
                );
            }
        } else {
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    "该链接失效")
            );
        }
    }
}
