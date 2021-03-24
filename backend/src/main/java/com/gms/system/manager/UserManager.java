package com.gms.system.manager;

import com.gms.common.domain.router.RouterMeta;
import com.gms.common.domain.router.VueRouter;
import com.gms.common.service.CacheService;
import com.gms.common.utils.GmsUtil;
import com.gms.common.utils.TreeUtil;
import com.gms.system.domain.Menu;
import com.gms.system.domain.Role;
import com.gms.system.domain.User;
import com.gms.system.service.MenuService;
import com.gms.system.service.RoleService;
import com.gms.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 封装一些和 User相关的业务操作
 */
@Service
public class UserManager {

    @Autowired
    private CacheService cacheService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private UserService userService;


    /**
     * 通过用户名获取用户基本信息
     *
     * @param username 用户名
     * @return 用户基本信息
     */
    public User getUser(String username) {
        return GmsUtil.selectCacheByTemplate(
                () -> this.cacheService.getUser(username),
                () -> this.userService.findByName(username));
    }

    /**
     * 通过用户名获取用户角色集合
     *
     * @param username 用户名
     * @return 角色集合
     */
    public Set<String> getUserRoles(String username) {
        List<Role> roleList = GmsUtil.selectCacheByTemplate(
                () -> this.cacheService.getRoles(username),
                () -> this.roleService.findUserRole(username));
        return roleList.stream().map(Role::getRoleName).collect(Collectors.toSet());
    }

    /**
     * 通过用户名获取用户当前阶段权限集合
     *
     * @param username 用户名
     * @return 权限集合
     */
    public Set<String> getUserPermissionsWithStage(String username) {
        List<Menu> permissionList = GmsUtil.selectCacheByTemplate(
                () -> this.cacheService.getPermissionsWithStage(username),
                () -> this.menuService.findUserPermissionsWithStage(username));
        return permissionList.stream().map(Menu::getPerms).collect(Collectors.toSet());
    }


    /**
     * 通过用户名获取用户全部权限集合
     *
     * @param username 用户名
     * @return 权限集合
     */
    public Set<String> getUserPermissions(String username) {
        List<Menu> permissionList = GmsUtil.selectCacheByTemplate(
                () -> this.cacheService.getPermissions(username),
                () -> this.menuService.findUserPermissions(username));
        return permissionList.stream().map(Menu::getPerms).collect(Collectors.toSet());
    }

    /**
     * 通过用户名构建 Vue路由
     *
     * @param username 用户名
     * @return 路由集合
     */
    public ArrayList<VueRouter<Menu>> getUserRouters(String username) {
        List<VueRouter<Menu>> routes = new ArrayList<>();
        List<Menu> all_menus = this.menuService.findUserMenus(username);
        List<Menu> curr_menus = this.menuService.findUserMenusWithStage(username);
        all_menus.forEach(menu -> {
            VueRouter<Menu> route = new VueRouter<>();
            route.setId(menu.getMenuId().toString());
            route.setParentId(menu.getParentId().toString());
            route.setPath(menu.getPath());
            route.setIcon(menu.getIcon());
            route.setComponent(menu.getComponent());
            route.setName(menu.getMenuName());

            if (curr_menus.contains(menu)) {
                route.setDisable("false");
            } else {
                route.setDisable("true");
            }
            routes.add(route);
        });
        return TreeUtil.buildVueRouter(routes);
    }

    /**
     * 通过用户 ID获取前端系统个性化配置
     *
     * @param userId 用户 ID
     * @return 前端系统个性化配置
     */

    /**
     * 将用户相关信息添加到 Redis缓存中
     *
     * @param user user
     */
    public void loadUserRedisCache(User user) throws Exception {
        // 缓存用户
//        cacheService.saveUser(user.getUsername());
        cacheService.saveUser(user);
        // 缓存用户角色
        cacheService.saveRoles(user.getUsername());
        // 缓存用户全部权限
        // TODO: 2021/3/24 检查 
        cacheService.savePermissions(user.getUsername());
        // 缓存用户当前权限
        cacheService.savePermissionsWithStage(user.getUsername());
    }

    /**
     * 将用户角色和权限添加到 Redis缓存中
     *
     * @param userIds userIds
     */
    public void loadUserPermissionRoleRedisCache(List<String> userIds) throws Exception {
        for (String userId : userIds) {
            User user = userService.getById(userId);
            // 缓存用户角色
            cacheService.saveRoles(user.getUsername());
            // 缓存用户权限
            cacheService.savePermissions(user.getUsername());
        }
    }

    /**
     * 通过用户 id集合批量删除用户 Redis缓存
     *
     * @param userIds userIds
     */
    public void deleteUserRedisCache(String... userIds) throws Exception {
        for (String userId : userIds) {
            User user = userService.getById(userId);
            if (user != null) {
                cacheService.deleteUser(user.getUsername());
                cacheService.deleteRoles(user.getUsername());
                cacheService.deletePermissions(user.getUsername());
            }
            cacheService.deleteUserConfigs(userId);
        }
    }

}
