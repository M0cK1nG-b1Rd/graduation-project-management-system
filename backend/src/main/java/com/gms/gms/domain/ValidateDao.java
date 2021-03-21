package com.gms.gms.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ValidateDao {

    private Integer id;

    private Integer userId;

    private String email;

    private String resetToken;

    private String type;

    private Date gmtCreate;

    private Date gmtModified;
}

