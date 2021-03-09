package com.gms.system.service.impl;

import com.gms.common.domain.GmsConstant;
import com.gms.common.domain.QueryRequest;
import com.gms.common.service.CacheService;
import com.gms.common.utils.AesEncryptUtil;
import com.gms.common.utils.SortUtil;
import com.gms.common.utils.MD5Util;
import com.gms.system.dao.UserMapper;
import com.gms.system.dao.UserRoleMapper;
import com.gms.system.domain.User;
import com.gms.system.domain.UserRole;
import com.gms.system.manager.UserManager;
import com.gms.system.service.UserRoleService;
import com.gms.system.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Slf4j
@Service("userService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private CacheService cacheService;
    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private UserManager userManager;


    @Override
    public User findByName(String username) {
        return baseMapper.findDetail(username);
    }


    @Override
    public IPage<User> findUserDetail(User user, QueryRequest request) {
        try {
            Page<User> page = new Page<>();
            SortUtil.handlePageSort(request, page, "userId", GmsConstant.ORDER_ASC, false);
            return this.baseMapper.findUserDetail(page, user);
        } catch (Exception e) {
            log.error("查询用户异常", e);
            return null;
        }
    }




    @Override
    @Transactional
    public void deleteUsers(String[] userIds) throws Exception {
        // 先删除相应的缓存
        this.userManager.deleteUserRedisCache(userIds);

        List<String> list = Arrays.asList(userIds);

        removeByIds(list);

        // 删除用户角色
        this.userRoleService.deleteUserRolesByUserId(userIds);
    }


    @Override
    @Transactional
    public void updatePassword(String username, String password) throws Exception {
        User user = new User();
        user.setPassword(MD5Util.encrypt(username, password));

        this.baseMapper.update(user, new LambdaQueryWrapper<User>().eq(User::getUsername, username));
        // 重新缓存用户信息
        cacheService.saveUser(username);
    }

    @Override
    @Transactional
    public void register(String username, String password) throws Exception {
        User user = new User();
        user.setPassword(MD5Util.encrypt(username, AesEncryptUtil.desEncrypt(password)));
        user.setUsername(username);
        this.save(user);

        UserRole ur = new UserRole();
        ur.setUserId(user.getUserId());
        ur.setRoleId(2); // 注册用户角色 ID
        this.userRoleMapper.insert(ur);
        //获取用户部门员工
        // 将用户相关信息保存到 Redis中
        userManager.loadUserRedisCache(user);
    }

    @Override
    @Transactional
    public void resetPassword(String[] usernames) throws Exception {
        for (String username : usernames) {

            User user = new User();
            user.setPassword(MD5Util.encrypt(username, User.DEFAULT_PASSWORD));

            this.baseMapper.update(user, new LambdaQueryWrapper<User>().eq(User::getUsername, username));
            // 重新将用户信息加载到 redis中
            cacheService.saveUser(username);
        }

    }

    private void setUserRoles(User user, String[] roles) {
        Arrays.stream(roles).forEach(roleId -> {
            UserRole ur = new UserRole();
            ur.setUserId(user.getUserId());
            ur.setRoleId(Integer.valueOf(roleId));
            this.userRoleMapper.insert(ur);
        });
    }

}
