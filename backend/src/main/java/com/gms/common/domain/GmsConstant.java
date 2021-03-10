package com.gms.common.domain;

/**
 * FEBS常量
 */
public class GmsConstant {
    public static final String UNDER_LINE = "_";
    // user缓存前缀
    public static final String USER_CACHE_PREFIX = "gms.cache.user.";
    // user角色缓存前缀
    public static final String USER_ROLE_CACHE_PREFIX = "gms.cache.user.role.";
    // user当前权限缓存前缀
    public static final String USER_CURR_PERMISSION_CACHE_PREFIX = "gms.cache.user.permission.curr.";
    // user全部权限缓存前缀
    public static final String USER_ALL_PERMISSION_CACHE_PREFIX = "gms.cache.user.permission.all.";
    // user部门数据权限缓存前缀
    public static final String USER_PERMISSION_DEPT_DATA_CACHE_PREFIX = "gms.cache.user.dept.data.permission.";
    // user个性化配置前缀
    public static final String USER_CONFIG_CACHE_PREFIX = "gms.cache.user.config.";
    // token缓存前缀
    public static final String TOKEN_CACHE_PREFIX = "gms.cache.token.";

    // 存储在线用户的 zset前缀
    public static final String ACTIVE_USERS_ZSET_PREFIX = "gms.user.active";

    // 排序规则： descend 降序
    public static final String ORDER_DESC = "descend";
    // 排序规则： ascend 升序
    public static final String ORDER_ASC = "ascend";

    // 按钮
    public static final String TYPE_BUTTON = "1";
    // 菜单
    public static final String TYPE_MENU = "0";


}
