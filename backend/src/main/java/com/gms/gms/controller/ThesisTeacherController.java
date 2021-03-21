package com.gms.gms.controller;


import com.alibaba.fastjson.JSONObject;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.service.ThesisTeacherService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

@Slf4j
@Validated
@RestController
@RequestMapping("/thesisGroup")
public class ThesisTeacherController {

    @Autowired
    ThesisTeacherService thesisTeacherService;

    /**
     * 一键自动分组，无需传参，生成后需要删除后方能重新分组
     */
    @PostMapping()
    public GmsResponse groupTeacherAuto() throws GmsException {
        try {
            if(thesisTeacherService.count()>0){
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "已经有生成的分配"));
            }
            thesisTeacherService.groupTeacherAuto();
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "生成分配成功"));
        } catch (Exception e) {
            String message = "交叉评审生成失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

}
