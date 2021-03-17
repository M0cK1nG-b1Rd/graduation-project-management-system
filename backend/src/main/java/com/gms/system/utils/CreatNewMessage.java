package com.gms.system.utils;

import com.gms.system.domain.Message;
import com.gms.system.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;

public class CreatNewMessage {
    @Autowired
    MessageService messageService;

    public void creatNewMessage(Message message){
        messageService.save(message);
    }
    public void creatNewMessage2(Collection<Message> message){
        messageService.saveBatch(message);
    }
}
