package com.gms.system.controller;

import com.gms.common.controller.BaseController;
import com.gms.common.domain.QueryRequest;
import com.gms.common.exception.GmsException;
import com.gms.system.domain.Role;
import com.gms.system.service.RoleStagePermsService;
import com.gms.system.service.RoleService;
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
import java.util.stream.Collectors;

@Slf4j
@Validated
@RestController
@RequestMapping("role")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private RoleStagePermsService roleStagePermsServie;

    private String message;

    @GetMapping
    @RequiresPermissions("role:view")
    public Map<String, Object> roleList(QueryRequest queryRequest, Role role) {
        return getDataTable(roleService.findRoles(role, queryRequest));
    }

    @GetMapping("check/{roleName}")
    public boolean checkRoleName(@NotBlank(message = "{required}") @PathVariable String roleName) {
        Role result = this.roleService.findByName(roleName);
        return result == null;
    }


    @PostMapping("excel")
    @RequiresPermissions("role:export")
    public void export(QueryRequest queryRequest,@RequestBody Role role, HttpServletResponse response) throws GmsException {
        try {
            List<Role> roles = this.roleService.findRoles(role, queryRequest).getRecords();
            ExcelKit.$Export(Role.class, response).downXlsx(roles, false);
        } catch (Exception e) {
            message = "导出Excel失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}
