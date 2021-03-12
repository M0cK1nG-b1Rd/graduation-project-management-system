package com.gms.gms.controller;


import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Announcement;
import com.gms.gms.domain.Subject;
import com.gms.gms.service.impl.SubjectServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("/subject")
public class SubjectController {
    @Autowired
    SubjectServiceImpl subjectService;

    @GetMapping
    public GmsResponse getSubject() throws GmsException {
        try {
            List<Subject> subjects = subjectService.getSubject();
            return new GmsResponse().addCodeMessage(new Meta(Code.C200.getCode(), Code.C200.getDesc(), "查询成功"), subjects);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}
