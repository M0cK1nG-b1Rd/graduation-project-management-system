package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.Announcement;
import com.gms.gms.domain.ValidateDao;
import com.gms.system.domain.User;

import javax.mail.internet.MimeMessage;
import java.util.List;

/**
 * @author MrBird
 */
public interface ValidateService{
     void sendPasswordResetEmail(MimeMessage email);
     int insertNewResetRecord(ValidateDao validateDao, User user, String token);
     ValidateDao findUserByResetToken(String token);
     boolean sendValidateLimitation(String email, long requestPerDay, long interval);
     boolean validateLimitation(String email, long requestPerDay, long interval, String token);
}
