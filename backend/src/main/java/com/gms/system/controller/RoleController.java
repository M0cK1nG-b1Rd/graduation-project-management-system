package com.gms.system.controller;

import com.gms.common.annotation.Log;
import com.gms.common.controller.BaseController;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.QueryRequest;
import com.gms.common.exception.GmsException;
import com.gms.system.domain.Role;
import com.gms.system.domain.RoleMenu;
import com.gms.system.service.RoleMenuServie;
import com.gms.system.service.RoleService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
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
    private RoleMenuServie roleMenuServie;

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

    @GetMapping("menu/{roleId}")
    public List<String> getRoleMenus(@NotBlank(message = "{required}") @PathVariable String roleId) {
        List<RoleMenu> list = this.roleMenuServie.getRoleMenusByRoleId(roleId);
        return list.stream().map(roleMenu -> String.valueOf(roleMenu.getMenuId())).collect(Collectors.toList());
    }

    @Log("新增角色")
    @PostMapping
    @RequiresPermissions("role:add")
    public GmsResponse addRole(@RequestBody @Valid Role role) throws GmsException {
        try {
            this.roleService.createRole(role);
            return new GmsResponse().code("200").message("新增角色成功").status("success");
        } catch (Exception e) {
            message = "新增角色失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @Log("删除角色")
    @DeleteMapping("/{roleIds}")
    @RequiresPermissions("role:delete")
    public GmsResponse deleteRoles(@NotBlank(message = "{required}") @PathVariable String roleIds) throws GmsException {
        try {
            String[] ids = roleIds.split(StringPool.COMMA);
            this.roleService.deleteRoles(ids);
            return new GmsResponse().code("200").message("删除角色成功").status("success");
        } catch (Exception e) {
            message = "删除角色失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @Log("修改角色")
    @PutMapping
    @RequiresPermissions("role:update")
    public GmsResponse updateRole(@RequestBody @Valid Role role) throws GmsException {
        try {
            this.roleService.updateRole(role);
            return new GmsResponse().code("200").message("修改角色成功").status("success");
        } catch (Exception e) {
            message = "修改角色失败";
            log.error(message, e);
            throw new GmsException(message);
        }
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
