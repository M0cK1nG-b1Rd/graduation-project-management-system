package com.gms.common.service.impl;

import com.gms.common.domain.GmsConstant;
import com.gms.common.service.CacheService;
import com.gms.common.service.RedisService;
import com.gms.system.dao.UserMapper;
import com.gms.system.domain.Menu;
import com.gms.system.domain.Role;
import com.gms.system.domain.User;
import com.gms.system.service.MenuService;
import com.gms.system.service.RoleService;
import com.gms.system.service.UserService;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("cacheService")
public class CacheServiceImpl implements CacheService {

    @Autowired
    private RedisService redisService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ObjectMapper mapper;

    @Override
    public void testConnect() throws Exception {
        this.redisService.exists("test");
    }

    @Override
    public User getUser(String username) throws Exception {
        String userString = this.redisService.get(GmsConstant.USER_CACHE_PREFIX + username);
        if (StringUtils.isBlank(userString))
            throw new Exception();
        else
            return this.mapper.readValue(userString, User.class);
    }

    @Override
    public List<Role> getRoles(String username) throws Exception {
        String roleListString = this.redisService.get(GmsConstant.USER_ROLE_CACHE_PREFIX + username);
        if (StringUtils.isBlank(roleListString)) {
            throw new Exception();
        } else {
            JavaType type = mapper.getTypeFactory().constructParametricType(List.class, Role.class);
            return this.mapper.readValue(roleListString, type);
        }
    }
    //todo 更正redis
    @Override
    public List<Menu> getPermissions(String username) throws Exception {
        String permissionListString = this.redisService.get(GmsConstant.USER_PERMISSION_CACHE_PREFIX + username);
        if (StringUtils.isBlank(permissionListString)) {
            throw new Exception();
        } else {
            JavaType type = mapper.getTypeFactory().constructParametricType(List.class, Menu.class);
            return this.mapper.readValue(permissionListString, type);
        }
    }

    @Override
    public List<Menu> getPermissionsWithStage(String username) throws Exception {
        String permissionListString = this.redisService.get(GmsConstant.USER_PERMISSION_CACHE_PREFIX + username);
        if (StringUtils.isBlank(permissionListString)) {
            throw new Exception();
        } else {
            JavaType type = mapper.getTypeFactory().constructParametricType(List.class, Menu.class);
            return this.mapper.readValue(permissionListString, type);
        }
    }


    @Override
    public void saveUser(User user) throws Exception {
        String username = user.getUsername();
        this.deleteUser(username);
        redisService.set(GmsConstant.USER_CACHE_PREFIX + username, mapper.writeValueAsString(user));
    }

    @Override
    public void saveUser(String username) throws Exception {
        User user = userMapper.findDetail(username);
        this.deleteUser(username);
        redisService.set(GmsConstant.USER_CACHE_PREFIX + username, mapper.writeValueAsString(user));
    }

    @Override
    public void saveRoles(String username) throws Exception {
        List<Role> roleList = this.roleService.findUserRole(username);
        if (!roleList.isEmpty()) {
            this.deleteRoles(username);
            redisService.set(GmsConstant.USER_ROLE_CACHE_PREFIX + username, mapper.writeValueAsString(roleList));
        }

    }

    @Override
    public void savePermissions(String username) throws Exception {
        List<Menu> permissionList = this.menuService.findUserPermissionsWithStage(username);
        if (!permissionList.isEmpty()) {
            this.deletePermissions(username);
            redisService.set(GmsConstant.USER_PERMISSION_CACHE_PREFIX + username, mapper.writeValueAsString(permissionList));
        }
    }

    @Override
    public void deleteUser(String username) throws Exception {
        username = username.toLowerCase();
        redisService.del(GmsConstant.USER_CACHE_PREFIX + username);
    }

    @Override
    public void deleteRoles(String username) throws Exception {
        username = username.toLowerCase();
        redisService.del(GmsConstant.USER_ROLE_CACHE_PREFIX + username);
    }

    @Override
    public void deletePermissions(String username) throws Exception {
        username = username.toLowerCase();
        redisService.del(GmsConstant.USER_PERMISSION_CACHE_PREFIX + username);
    }

    @Override
    public void deleteUserConfigs(String userId) throws Exception {
        redisService.del(GmsConstant.USER_CONFIG_CACHE_PREFIX + userId);
    }
}
