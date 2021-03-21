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
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        for (Integer i : userList) {
            Message message = new Message().setTitle("答辩安排通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
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
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        for (Integer i : userList) {
            Message message = new Message().setTitle("答辩安排通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
                    .setDetail("<p><strong>尊敬的用户：</strong></p><p>\t\t您之前的答辩安排已经取消，请等待之后的最新通知。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                    .setMessageId(FileStorageUtil.getDocId());
            messages.add(message);
        }
        creatNewMessage2(messages);
    }

    public void creatNewStudentAppliedSubject(Integer studentId) {
        Integer userId = messageService.getUserIdByStuId(studentId);
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("选题结果通知").setFromId(fromId).setCreatTime(new Date()).setToId(userId).setType("WCK")
                .setDetail("<p><strong>尊敬的用户：</strong></p><p>\t\t您的选题申请状态已经更新，请前往相关页面进行查看。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    /*public void creatNewAuditReport(Integer id) {
        Integer userId = messageService.getUserIdByRepId(id);
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("成绩通知").setFromId(fromId).setCreatTime(new Date()).setToId(userId).setType("WCK")
                .setDetail("<p><strong>尊敬的用户：</strong></p><p>\t\t您有新的成绩，请前往相关页面进行查看。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }*/
}
