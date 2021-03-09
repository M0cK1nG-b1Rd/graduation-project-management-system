package com.gms.system.controller;

import com.gms.common.annotation.Log;
import com.gms.common.controller.BaseController;
import com.gms.common.domain.QueryRequest;
import com.gms.common.exception.GmsException;
import com.gms.system.domain.SysLog;
import com.gms.system.service.LogService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

/**
 * @author wx
 */
@Slf4j
@Validated
@RestController
@RequestMapping("log")
public class LogController extends BaseController {

    private String message;

    @Autowired
    private LogService logService;

    @GetMapping
    @RequiresPermissions("log:view")
    public Map<String, Object> logList(QueryRequest request, SysLog sysLog) {
        return getDataTable(logService.findLogs(request, sysLog));
    }

    @Log("删除系统日志")
    @DeleteMapping("/{ids}")
    @RequiresPermissions("log:delete")
    public void deleteLogss(@NotBlank(message = "{required}") @PathVariable String ids) throws GmsException {
        try {
            String[] logIds = ids.split(StringPool.COMMA);
            this.logService.deleteLogs(logIds);
        } catch (Exception e) {
            message = "删除日志失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PostMapping("excel")
    @RequiresPermissions("log:export")
    public void export(QueryRequest request, SysLog sysLog, HttpServletResponse response) throws GmsException {
        try {
            if(request.getPageSize()> exportMaxCount) {
                request.setPageSize(exportMaxCount);
            }
            List<SysLog> sysLogs = this.logService.findLogs(request, sysLog).getRecords();
            ExcelKit.$Export(SysLog.class, response).downXlsx(sysLogs, false);
        } catch (Exception e) {
            message = "导出Excel失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}
