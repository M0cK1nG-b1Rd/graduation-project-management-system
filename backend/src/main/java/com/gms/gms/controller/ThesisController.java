package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.dao.ThesisMapper;
import com.gms.gms.domain.Plea;
import com.gms.gms.domain.Thesis;
import com.gms.gms.service.ThesisService;
import com.gms.gms.utils.AccountUtil;
import com.gms.gms.utils.FileStorageUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@Slf4j
@Validated
@RestController
@RequestMapping("/thesis")
public class ThesisController {
    @Autowired
    ThesisService thesisService;

    /**
     * 新增论文信息，一个学生只能提交一次，JSON传参
     * docId:
     */
    @RequiresPermissions("fin:apply")
    @PostMapping
    public GmsResponse addNewThesis(@RequestBody Thesis thesis) throws GmsException {
        try {
            Integer stuId= AccountUtil.getCurrentStudent().getStuId();
            if (thesisService.count(new QueryWrapper<Thesis>().lambda()
                    .eq(Thesis::getStuId,stuId)) > 0) {
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "已经上传了论文，不能重复提交"));
            }
            thesis.setStuId(stuId).setPoseTime(new Date()).setStatus("DFZ");
            //使用MybatisPlus封装的方法
            thesisService.save(thesis);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "上传论文成功"));
        } catch (Exception e) {
            String message = "上传论文失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 学生查看自己的论文状态
     */
    @RequiresPermissions("fin:list")
    @GetMapping("/student")
    public GmsResponse getMyThesis() throws GmsException {
        try {
            Integer stuId= AccountUtil.getCurrentStudent().getStuId();
            Thesis thesis = thesisService.getMyThesis(stuId);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询论文成功"), thesis);
        } catch (Exception e) {
            String message = "查询论文失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 老师查看自己的学生论文状态，JSON传参分页
     * page:
     * size:
     */
    @RequiresPermissions("fin:check")
    @GetMapping("/teacher")
    public GmsResponse getStuThesis(Thesis thesis) throws GmsException {
        try {
            Integer teacherId= AccountUtil.getCurrentTeacher().getTeacherId();
            Page<Thesis> thesisPage = thesisService.getStuThesis(thesis,teacherId);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询论文成功"), thesisPage);
        } catch (Exception e) {
            String message = "查询论文失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 教研处查看所有的论文接口，可传参进行
     */
}
