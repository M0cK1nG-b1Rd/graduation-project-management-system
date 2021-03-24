package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Thesis;
import com.gms.gms.domain.ThesisHelp;
import com.gms.gms.domain.ThesisTeacher;
import com.gms.gms.service.ThesisService;
import com.gms.gms.service.ThesisTeacherService;
import com.gms.gms.utils.AccountUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
            if (thesisTeacherService.count() > 0) {
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
            thesisTeacherService.update(null, new LambdaUpdateWrapper<ThesisTeacher>().set(ThesisTeacher::getIsRelease, true));
            thesisService.update(null, new LambdaUpdateWrapper<Thesis>().set(Thesis::getStatus, "YFZ"));
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

    /**
     * 一键自动删除分组，无需传参，若发布后删除相关人员会接收通知
     */
    @DeleteMapping()
    public GmsResponse deleteThesisGroupStage() throws GmsException {
        try {
            thesisTeacherService.remove(new QueryWrapper<ThesisTeacher>());
            thesisService.update(null, new LambdaUpdateWrapper<Thesis>().set(Thesis::getStatus, "DFZ"));
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "论文交叉互评安排删除成功！"));
        } catch (Exception e) {
            String message = "论文交叉互评安排删除失败！";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 教研办查看答辩交叉互评结果，需要传入分页参数，问号形式
     * page:
     * size:
     */
    @GetMapping()
    public GmsResponse selectThesisGroupStage(Integer page, Integer size) throws GmsException {
        try {
            Page<ThesisHelp> teacherPage = thesisTeacherService.selectThesisGroupStage(page, size);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询论文交叉互评安排成功！"), teacherPage);
        } catch (Exception e) {
            String message = "查询论文交叉互评安排失败！";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 老师查看自己要评的的答辩交叉互评，无需传参，打过分的论文不会显示
     */
    @GetMapping("/teacher")
    public GmsResponse selectThesisGroupStageTeacher() throws GmsException {
        try {
            Integer teacherId = AccountUtil.getCurrentTeacher().getTeacherId();
            List<Thesis> thesis = thesisTeacherService.selectThesisGroupStageTeacher(teacherId);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询论文交叉互评成功！"), thesis);
        } catch (Exception e) {
            String message = "查询论文交叉互评失败！";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 老师答辩交叉互评打分，JSON传参
     * id:答辩安排的id
     * score:得分
     */
    @PutMapping("/teacher")
    public GmsResponse scoreThesisGroupStage(@RequestBody ThesisTeacher thesisTeacher) throws GmsException {
        try {
            if (thesisTeacherService.count(new QueryWrapper<ThesisTeacher>().lambda()
                    .eq(ThesisTeacher::getId, thesisTeacher.getId())
                    .eq(ThesisTeacher::getScore, -1)) == 0) {
                throw new GmsException("该论文已打分！");
            }
            thesisTeacherService.updateById(thesisTeacher);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "打分成功"));
        } catch (GmsException e) {
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    e.getMessage()));
        } catch (Exception e) {
            String message = "打分失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}
