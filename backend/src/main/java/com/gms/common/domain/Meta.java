package com.gms.common.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.HashMap;
@Data
@AllArgsConstructor
public class Meta {
    private Integer code;
    private String status;
    private String message;
}
