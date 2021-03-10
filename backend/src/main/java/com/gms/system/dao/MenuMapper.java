package com.gms.system.dao;

import com.gms.system.domain.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface MenuMapper extends BaseMapper<Menu> {

    List<Menu> findUserPermissionsWithStage(String username);

    List<Menu> findUserMenus(String username);

    List<Menu> findUserPermissions(String username);

    List<Menu> findUserMenusWithStage(String username);

    /**
     * 查找当前菜单/按钮关联的用户 ID
     *
     * @param menuId menuId
     * @return 用户 ID集合
     */
//    List<String> findUserIdsByMenuId(String menuId);
}