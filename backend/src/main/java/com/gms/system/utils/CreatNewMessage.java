package com.gms.system.utils;

import com.gms.system.domain.Message;
import com.gms.system.service.MessageService;
import com.gms.system.service.impl.MessageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;
import java.util.List;

public class CreatNewMessage {
    @Autowired
    MessageService messageService;

    public void creatNewMessage(Message message){
        messageService.save(message);
    }
    public void creatNewMessage2(Collection<Message> message){
        messageService.saveBatch(message);
    }

    //发布新的答辩安排公告
    public static void creatNewPleaOne(String stage){
        MessageService messageService =new MessageServiceImpl();
        List<Integer> userList = messageService.getStudentUserId(stage);

    }

}
