package com.gms.gms.dao;

import com.gms.gms.domain.Validate;

import java.util.List;

public interface ValidateDaoMapper {
    int insert(Validate validate);

    Validate selectByToken(String token);

    List<Validate> selectByEmail(String email);
}
