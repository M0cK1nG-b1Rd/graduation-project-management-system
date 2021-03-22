package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Thesis;
import com.gms.gms.domain.ThesisTeacher;
import com.gms.gms.service.ThesisService;
import com.gms.gms.service.ThesisTeacherService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Validated
@RestController
@RequestMapping("/thesisGroup")
public class ThesisTeacherController {

    @Autowired
    ThesisTeacherService thesisTeacherService;
    @Autowired
    ThesisService thesisService;

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

    /**
     * 一键自动发布分组，无需传参，发布后相关人员即可查看相应通知
     */
    @PutMapping()
    public GmsResponse updateThesisGroupStage() throws GmsException {
        try {
            thesisTeacherService.update(null,new LambdaUpdateWrapper<ThesisTeacher>().set(ThesisTeacher::getIsRelease,true));
            thesisService.update(null,new LambdaUpdateWrapper<Thesis>().set(Thesis::getStatus,"YFZ"));
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "论文交叉互评安排发布成功！"));
        } catch (Exception e) {
            String message = "论文交叉互评安排发布失败！";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

}
