package com.gms.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.system.domain.Message;
import com.gms.system.service.MessageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Validated
@RestController
@RequestMapping("/message")
public class MessageController {

    @Autowired
    MessageService messageService;

    //获取未读通知个数
    @GetMapping
    public GmsResponse getMessageNum() throws GmsException {
        try {
            int userId = GmsUtil.getCurrentUser().getUserId();
            //使用mybatisPlus提供的方法
            int noRead = messageService.count(new QueryWrapper<Message>().lambda().eq(Message::getToId,userId)
                                                    .eq(Message::getType,"WCK"));
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询未读通知个数成功"), noRead);
        } catch (Exception e) {
            String message = "查询未读通知个数失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    //用户获取自己的所有通知,问号传参
    @GetMapping("/all")
    public GmsResponse getMessage(Integer page, Integer size) throws GmsException {
        try {
            Page<Message> messagePage;
            int userId = GmsUtil.getCurrentUser().getUserId();
            if (page == null || size == null) {
                messagePage = messageService.getMessage(1, 10, userId);
            } else {
                messagePage = messageService.getMessage(page, size, userId);
            }
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询通知成功"), messagePage);
        } catch (Exception e) {
            String message = "查询通知失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //用户将未读通知变为已读,JSON
    @PutMapping("/read")
    public GmsResponse updateMessageRead(@RequestBody List<String> list) throws GmsException {
        try {
            //调用mybatisPlus提供的方法
            messageService.update(new UpdateWrapper<Message>().lambda().set(Message::getType,"YCK").in(Message::getMessageId,list));
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "修改通知状态成功"));
        } catch (Exception e) {
            String message1 = "修改通知状态失败";
            log.error(message1, e);
            throw new GmsException(message1);
        }
    }

    //删除通知，真删除，JSON
    @DeleteMapping("/delete")
    public GmsResponse deleteMessage(List<String> list) throws GmsException {
        try {
            //调用mybatisPlus提供的方法
            messageService.removeByIds(list);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "删除通知成功"));
        } catch (Exception e) {
            String message1 = "删除通知失败";
            log.error(message1, e);
            throw new GmsException(message1);
        }
    }
}
