package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Plea;
import com.gms.gms.domain.PleaResult;
import com.gms.gms.service.PleaResultService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

@Slf4j
@Validated
@RestController
@RequestMapping("/pleaResult")
public class PleaResultController {

    @Autowired
    PleaResultService pleaResultService;

    /**
     * 答辩秘书添加答辩结果时使用的接口，传参为JSON
     * stuId:要评分的学生id
     * pleaId:该场答辩id
     * stage:时期
     * score:得分，可以为null或者空值
     * feedback:反馈，可以为null或者空值
     * isPassed:是否通过
     */
    @PostMapping
    public GmsResponse addNewPleaResult(@RequestBody PleaResult pleaResult) throws GmsException {
        try {
            if (pleaResultService.count(new QueryWrapper<PleaResult>().lambda()
                    .eq(PleaResult::getStuId, pleaResult.getStuId())
                    .eq(PleaResult::getStage, pleaResult.getStage())) > 0) {
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "该学生已打分，无法重复打分"));
            }
            //使用MybatisPlus封装的方法
            pleaResultService.save(pleaResult);
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
