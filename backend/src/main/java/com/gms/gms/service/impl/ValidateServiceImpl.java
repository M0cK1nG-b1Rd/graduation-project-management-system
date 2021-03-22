package com.gms.gms.service.impl;

import com.gms.gms.dao.ValidateDaoMapper;
import com.gms.gms.domain.Validate;
import com.gms.gms.service.ValidateService;
import com.gms.system.domain.User;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class ValidateServiceImpl implements ValidateService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private ValidateDaoMapper validateDaoMapper;

    /**
     * 发送邮件：@Async进行异步调用发送邮件接口
     * @param email
     */
//    @Async
//    public void sendPasswordResetEmail(SimpleMailMessage email){
//
//        javaMailSender.send(email);
//    }

    @Async
    public void sendPasswordResetEmail(MimeMessage email){
        javaMailSender.send(email);
    }

    /**
     * 在validate表中插入一条validate记录，userid，email属性来自pm_user表，token由UUID生成
     * @param validate
     * @param user
     * @param token
     * @return
     */
    public int insertNewResetRecord(Validate validate, User user, String token){
        validate.setUserId(user.getUserId());
        validate.setEmail(user.getMail());
        validate.setResetToken(token);
        validate.setType("passwordReset");
        validate.setGmtCreate(new Date());
        validate.setGmtModified(new Date());
        return validateDaoMapper.insert(validate);
    }

    /**
     * validate表中，通过token查找重置申请记录
     * @param token
     * @return
     */
    public Validate findUserByResetToken(String token){
        return validateDaoMapper.selectByToken(token);
    }

    /**
     * 验证是否发送重置邮件：每个email的重置密码每日请求上限为requestPerDay次，与上一次的请求时间间隔为interval分钟。
     * @param email
     * @param requestPerDay
     * @param interval
     * @return
     */
    public boolean sendValidateLimitation(String email, long requestPerDay, long interval){
        List<Validate> validateList = validateDaoMapper.selectByEmail(email);
        // 若查无记录，意味着第一次申请，直接放行
        if (validateList.isEmpty()) {
            return true;
        }
        // 有记录，则判定是否频繁申请以及是否达到日均请求上线
        long countTodayValidation = validateList.stream().filter(x-> DateUtils.isSameDay(x.getGmtModified(), new Date())).count();
        Optional validate = validateList.stream().map(Validate::getGmtModified).max(Date::compareTo);
        Date dateOfLastRequest = new Date();
        if (validate.isPresent()) dateOfLastRequest = (Date) validate.get();
        long intervalForLastRequest = new Date().getTime() - dateOfLastRequest.getTime();

        return countTodayValidation <= requestPerDay && intervalForLastRequest >= interval * 60 * 1000;
    }

    /**
     * 验证连接是否失效：链接有两种情况失效 1.超时 2.最近请求的一次链接自动覆盖之前的链接（待看代码）
     * @param email
     * @param requestPerDay
     * @param interval
     * @return
     */
    public boolean validateLimitation(String email, long requestPerDay, long interval, String token){
        List<Validate> validateList = validateDaoMapper.selectByEmail(email);
        // 有记录才会调用该函数，只需判断是否超时
        Optional validate = validateList.stream().map(Validate::getGmtModified).max(Date::compareTo);
        Date dateOfLastRequest = new Date();
        if (validate.isPresent()) dateOfLastRequest = (Date) validate.get();
        long intervalForLastRequest = new Date().getTime() - dateOfLastRequest.getTime();

        Optional lastRequestToken = validateList.stream().filter(x-> x.getResetToken().equals(token)).map(Validate::getGmtModified).findAny();
        Date dateOfLastRequestToken = new Date();
        if (lastRequestToken.isPresent()) {
            dateOfLastRequestToken = (Date) lastRequestToken.get();
        }
        return intervalForLastRequest <= interval * 60 * 1000 && dateOfLastRequest == dateOfLastRequestToken;
    }
}


