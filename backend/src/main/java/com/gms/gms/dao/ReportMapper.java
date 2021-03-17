package com.gms.gms.dao;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Report;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @author MrBird
 */
public interface ReportMapper extends BaseMapper<Report> {

    Page<Report> selectReport(Page<Report> page, Report report);

    Page<Report> selectReportAsTeacher(Page<Report> page, Report report, Integer teacherId);

    Page<Report> selectReportAsStudent(Page<Report> page, Report report, Integer studentId);

    void auditReport(Report report);
}
