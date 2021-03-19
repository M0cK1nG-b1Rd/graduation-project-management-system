package com.gms.gms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.common.exception.GmsException;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.domain.Report;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author MrBird
 */
public interface ReportService extends IService<Report> {

    IPage<Report> selectReport(Report report, String roleName) throws GmsException;

    void addReport(Report report);

    void auditReport(Report report);

    List<Report> selectReportByStuId(Integer stuId, String stage);
}
