package com.gms.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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
                    "查询成功"), noRead);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    //用户获取自己的相应通知
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
                    "查询成功"), messagePage);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //用户将未读公告变为已读或者删除公告
    @PutMapping
    public GmsResponse updateMessage(@RequestBody Message message) throws GmsException {
        try {
            //调用mybatisPlus提供的方法
            messageService.updateById(message);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "修改成功"));
        } catch (Exception e) {
            String message1 = "查询失败";
            log.error(message1, e);
            throw new GmsException(message1);
        }
    }

}
