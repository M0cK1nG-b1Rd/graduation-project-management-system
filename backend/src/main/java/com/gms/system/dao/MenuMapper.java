package com.gms.system.dao;

import com.gms.system.domain.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface MenuMapper extends BaseMapper<Menu> {

    List<Menu> findUserPermissionsWithStage(String realName);

    List<Menu> findUserMenus(String realName);

    List<Menu> findUserPermissions(String username);

    /**
     * 查找当前菜单/按钮关联的用户 ID
     *
     * @param menuId menuId
     * @return 用户 ID集合
     */
//    List<String> findUserIdsByMenuId(String menuId);
}