package com.gms.gms.service;

import com.gms.gms.domain.Validate;
import com.gms.system.domain.User;

import javax.mail.internet.MimeMessage;

/**
 * @author MrBird
 */
public interface ValidateService{
     void sendPasswordResetEmail(MimeMessage email);
     int insertNewResetRecord(Validate validate, User user, String token);
     Validate findUserByResetToken(String token);
     boolean sendValidateLimitation(String email, long requestPerDay, long interval);
     boolean validateLimitation(String email, long requestPerDay, long interval, String token);
}
