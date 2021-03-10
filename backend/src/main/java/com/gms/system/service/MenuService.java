package com.gms.system.service;

import com.gms.system.domain.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

public interface MenuService extends IService<Menu> {

    List<Menu> findUserPermissions(String realName);

    List<Menu> findUserPermissionsWithStage(String realName);

    List<Menu> findUserMenus(String realName);

    Map<String, Object> findMenus(Menu menu);

    List<Menu> findMenuList(Menu menu);

    void createMenu(Menu menu);

    List<Menu> findUserMenusWithStage(String username);

//    void updateMenu(Menu menu) throws Exception;

    /**
     * 递归删除菜单/按钮
     *
     * @param menuIds menuIds
     */
//    void deleteMenus(String[] menuIds) throws Exception;

}
