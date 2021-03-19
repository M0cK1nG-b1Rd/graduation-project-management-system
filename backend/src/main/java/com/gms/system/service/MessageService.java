package com.gms.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.system.domain.Message;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author MrBird
 */
public interface MessageService extends IService<Message> {

    Page<Message> getMessage(int page, int size, int userId);

    List<Integer> getStudentUserId(String stage);
}
