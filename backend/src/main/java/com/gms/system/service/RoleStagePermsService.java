package com.gms.system.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.system.domain.RoleStagePerms;

import java.util.List;

public interface RoleStagePermsService extends IService<RoleStagePerms> {
    List<RoleStagePerms> getRoleMenusByRoleId(String roleId);
}
