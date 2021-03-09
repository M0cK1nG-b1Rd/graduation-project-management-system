package com.gms.system.service.impl;

import com.gms.system.dao.RoleStagePermsMapper;
import com.gms.system.domain.RoleStagePerms;
import com.gms.system.service.RoleStagePermsService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("roleStagePermsService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class RoleMenuServiceImpl extends ServiceImpl<RoleStagePermsMapper, RoleStagePerms> implements RoleStagePermsService {

	@Override
	public List<RoleStagePerms> getRoleMenusByRoleId(String roleId) {
		return baseMapper.selectList(new LambdaQueryWrapper<RoleStagePerms>().eq(RoleStagePerms::getRoleId, roleId));
	}

}
