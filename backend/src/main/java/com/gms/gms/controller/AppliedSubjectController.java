package com.gms.gms.controller;


import com.gms.common.domain.GmsResponse;
import com.gms.gms.domain.AppliedSubject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * @author MrBird
 */
@RestController
@RequestMapping("subject/apply")
public class AppliedSubjectController {
    @PostMapping
    public GmsResponse applyForSubject(String subId) {
        AppliedSubject subject = new AppliedSubject();
        subject.setSubId(subId);
        subject.setStuId();
    }

    @PutMapping("audit")
    public GmsResponse auditAppliedSubject(AppliedSubject appliedSubject) {

    }

}
