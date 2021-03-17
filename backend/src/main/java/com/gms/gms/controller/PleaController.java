package com.gms.gms.controller;


import com.alibaba.fastjson.JSONObject;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Plea;
import com.gms.gms.service.PleaService;
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
@RequestMapping("/plea")
public class PleaController {
    @Autowired
    PleaService pleaService;

    /**
     * 新建答辩分组，传参为JSON
     * stuGroupId:学生组id
     * acceptanceTeamId:老师组id
     * classroomId:教师id
     * time:答辩时间
     * stage:时期
     */
    @PostMapping
    public GmsResponse groupStudentAuto(@RequestBody Plea plea) throws GmsException {
        try {
            //使用MybatisPlus封装的方法
            pleaService.save(plea);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "新建答辩安排成功"));
        } catch (Exception e) {
            String message = "新建失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

}

