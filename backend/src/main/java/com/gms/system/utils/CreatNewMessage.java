package com.gms.system.utils;

import com.gms.common.utils.GmsUtil;
import com.gms.common.utils.SpringContextUtil;
import com.gms.gms.utils.FileStorageUtil;
import com.gms.system.domain.Message;
import com.gms.system.service.MessageService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public class CreatNewMessage {

    MessageService messageService = SpringContextUtil.getBean(MessageService.class);

    public void creatNewMessage(Message message) {
        messageService.save(message);
    }

    public void creatNewMessage2(Collection<Message> message) {
        messageService.saveBatch(message);
    }

    //发布新的答辩安排公告
    public void creatNewPleaOne(String stage) {
        List<Integer> userList = messageService.getStudentUserId(stage);
        userList.addAll(messageService.getTeacherUserId(stage));
        userList.add(messageService.getSecretaryUserId(stage));
        List<Message> messages = new ArrayList<>();
        Message message = new Message();
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        for (Integer i : userList) {
            message.setTitle("答辩安排通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
                    .setDetail("<p><strong>尊敬的用户：</strong></p><p>\t\t您有新的答辩安排，请前往答辩安排处查看。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                     .setMessageId(FileStorageUtil.getDocId());
            messages.add(message);
        }
        creatNewMessage2(messages);
    }

    public void creatNewPleaTwo(String stage) {
        List<Integer> userList = messageService.getStudentUserId(stage);
        userList.addAll(messageService.getTeacherUserId(stage));
        userList.add(messageService.getSecretaryUserId(stage));
        List<Message> messages = new ArrayList<>();
        Message message = new Message();
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        for (Integer i : userList) {
            message.setTitle("答辩安排通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
                    .setDetail("<p><strong>尊敬的用户：</strong></p><p>\t\t您之前的答辩安排已经取消无效，请等待之后的最新通知。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                    .setMessageId(FileStorageUtil.getDocId());
            messages.add(message);
        }
        creatNewMessage2(messages);
    }
}
