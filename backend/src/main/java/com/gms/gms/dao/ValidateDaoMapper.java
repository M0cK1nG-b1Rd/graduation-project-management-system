package com.gms.gms.dao;

import com.gms.gms.domain.ValidateDao;

import java.util.List;

public interface ValidateDaoMapper {
    int insert(ValidateDao validateDao);

    ValidateDao selectByToken(String token);

    List<ValidateDao> selectByEmail(String email);
}
