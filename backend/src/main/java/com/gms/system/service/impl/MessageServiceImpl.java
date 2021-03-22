package com.gms.system.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.system.dao.MessageMapper;
import com.gms.system.domain.Message;
import com.gms.system.service.MessageService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements MessageService {

    @Override
    public Page<Message> getMessage(int page, int size, int userId) {
        Page<Message> messagePage = new Page<>(page, size);
        return this.baseMapper.getMessage(messagePage, userId);
    }

    @Override
    public List<Integer> getStudentUserId(String stage) {
        return this.baseMapper.getStudentUserId(stage);
    }

    @Override
    public List<Integer> getTeacherUserId(String stage) {
        return this.baseMapper.getTeacherUserId(stage);
    }

    @Override
    public Integer getSecretaryUserId(String stage) {
        return this.baseMapper.getSecretaryUserId(stage);
    }

    @Override
    public Integer getUserIdByStuId(Integer studentId) {
        return this.baseMapper.getUserIdByStuId(studentId);
    }

    @Override
    public List<Integer> getAllTeacherUserId() {
        return this.baseMapper.getAllTeacherUserId();
    }

    @Override
    public Integer countThesisGroupIsRelease() {
        return this.baseMapper.countThesisGroupIsRelease();
    }

    @Override
    public List<Integer> getTeacherUserIdThesis() {
        return this.baseMapper.getTeacherUserIdThesis();
    }
}
