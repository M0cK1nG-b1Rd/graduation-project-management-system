package com.gms.system.utils;

import com.gms.common.utils.GmsUtil;
import com.gms.common.utils.SpringContextUtil;
import com.gms.gms.domain.Report;
import com.gms.gms.domain.SystemStage;
import com.gms.gms.domain.Thesis;
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
        userList.addAll(messageService.getSecretaryUserId(stage));
        List<Message> messages = new ArrayList<>();
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        for (Integer i : userList) {
            Message message = new Message().setTitle("答辩安排通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
                    .setDetail("<p><strong>尊敬的用户：</strong></p><p>\t</p><p>\t\t您有新的答辩安排，请前往答辩安排处查看。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                     .setMessageId(FileStorageUtil.getDocId());
            messages.add(message);
        }
        creatNewMessage2(messages);
    }

    public void creatNewPleaTwo(String stage) {
        if(messageService.countPleaIsRelease(stage)>0) {
            List<Integer> userList = messageService.getStudentUserId(stage);
            userList.addAll(messageService.getTeacherUserId(stage));
            userList.addAll(messageService.getSecretaryUserId(stage));
            List<Message> messages = new ArrayList<>();
            Integer fromId = GmsUtil.getCurrentUser().getUserId();
            for (Integer i : userList) {
                Message message = new Message().setTitle("答辩安排通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
                        .setDetail("<p><strong>尊敬的用户：</strong></p><p>\t</p><p>\t\t您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                        .setMessageId(FileStorageUtil.getDocId());
                messages.add(message);
            }
            creatNewMessage2(messages);
        }
    }

    public void creatNewStudentAppliedSubject(Integer studentId) {
        Integer userId = messageService.getUserIdByStuId(studentId);
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("选题结果通知").setFromId(fromId).setCreatTime(new Date()).setToId(userId).setType("WCK")
                .setDetail("<p><strong>同学您好：</strong></p><p>\t</p><p>\t\t您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    public void afterUpdateThesisGroupStage() {
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        List<Integer> userList = messageService.getAllTeacherUserId();
        List<Message> messages = new ArrayList<>();
        for (Integer i : userList) {
            Message message = new Message().setTitle("论文互评通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
                    .setDetail("<p><strong>尊敬的老师：</strong></p><p>\t</p><p>\t\t您的论文互评安排已经发布，请及时前往相关页面进行互评打分。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                    .setMessageId(FileStorageUtil.getDocId());
            messages.add(message);
        }
        creatNewMessage2(messages);
    }

    public void beforeDeleteThesisGroupStage() {
        if(messageService.countThesisGroupIsRelease()>0){
            Integer fromId = GmsUtil.getCurrentUser().getUserId();
            List<Integer> userList = messageService.getTeacherUserIdThesis();
            List<Message> messages = new ArrayList<>();
            for (Integer i : userList) {
                Message message = new Message().setTitle("论文互评通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
                        .setDetail("<p><strong>尊敬的老师：</strong></p><p>\t</p><p>\t\t之前的论文互拼安排已经撤回取消，给您带来的不便十分抱歉，请以之后的安排为准。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                        .setMessageId(FileStorageUtil.getDocId());
                messages.add(message);
            }
            creatNewMessage2(messages);
        }
    }

    public void afterScoreThesisGroupStage(Integer id) {
        if(messageService.countScore(id)==0){
            Thesis thesis = messageService.selectThesis(id);
            messageService.setScore(thesis.getThesisId());
            Integer fromId = GmsUtil.getCurrentUser().getUserId();
            Message message = new Message().setTitle("论文成绩通知").setFromId(fromId).setCreatTime(new Date()).setToId(thesis.getUserId()).setType("WCK")
                    .setDetail("<p><strong>同学您好：</strong></p><p>\t</p><p>\t\t您的论文成绩已经出分，请前往相关页面进行查看。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                    .setMessageId(FileStorageUtil.getDocId());
            creatNewMessage(message);
        }
    }

    public void afterAddNewPleaResult(Integer userId,String stage) {
        if(stage.equals("KT")){
            stage="开题";
        }else if(stage.equals("ZQ")){
            stage="中期";
        }else {
            stage="结题";
        }
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("答辩成绩通知").setFromId(fromId).setCreatTime(new Date()).setToId(userId).setType("WCK")
                .setDetail("<p><strong>同学您好：</strong></p><p>\t</p><p>\t\t您的"+stage+"答辩成绩已经出分，请前往相关页面进行查看。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    public void afterAddAppliedSubject(String subId) {
        Integer userId=messageService.getUserIdBySubID(subId);
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("选题通知").setFromId(fromId).setCreatTime(new Date()).setToId(userId).setType("WCK")
                .setDetail("<p><strong>尊敬的老师：</strong></p><p>\t</p><p>\t\t您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    public void afterAuditSubject(String subId) {
        Integer userId=messageService.getUserIdBySubID(subId);
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("课题审核通知").setFromId(fromId).setCreatTime(new Date()).setToId(userId).setType("WCK")
                .setDetail("<p><strong>尊敬的老师：</strong></p><p>\t</p><p>\t\t您的课题出题状态已经更新，请及时前往相关页面进行查看。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    public void afterAuditReport(Integer id) {
        Report report = messageService.getMessageReport(id);
        String stage = report.getStage();
        if(stage.equals("KT")){
            stage="开题";
        }else {
            stage="中期";
        }
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle(stage+"成果成绩通知").setFromId(fromId).setCreatTime(new Date()).setToId(report.getUserId()).setType("WCK")
                .setDetail("<p><strong>同学您好：</strong></p><p>\t</p><p>\t\t您的"+stage+"成果老师已经出分，可以前往相关页面进行查看。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    public void afterUpdateSystemStage(List<Integer> currStageIds) {
        List<SystemStage> systemStages=messageService.selectSystemStage(currStageIds);
        String body="<p><strong>尊敬的用户您好：</strong></p><p>\t</p><p>\t\t当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p>";
        for(SystemStage s:systemStages){
            body=body+"<p>\t\t◉"+s.getStageName()+"："+s.getDescription()+"</p>";
        }
        body=body+"<p>\t\t注意相关事务的处理执行，以免错过！</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>";
        List<Integer> userIds = messageService.selectAllUserButAdmin();
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        List<Message> messages = new ArrayList<>();
        for(int i:userIds){
            Message message = new Message().setTitle("阶段变更通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
                    .setDetail(body)
                    .setMessageId(FileStorageUtil.getDocId());
            messages.add(message);
        }
        creatNewMessage2(messages);
    }

    public void afterGiveStageTask(Integer taskId) {
        Integer userId = messageService.getTaskStuUserId(taskId);
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("阶段任务通知").setFromId(fromId).setCreatTime(new Date()).setToId(userId).setType("WCK")
                .setDetail("<p><strong>同学您好：</strong></p><p>\t</p><p>\t\t您有新的阶段任务，请及时前往相关页面进行查看。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    public void afterGiveStageTaskResult(Integer taskId) {
        Integer userId=messageService.getTaskTeaUserId(taskId);
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("阶段任务通知").setFromId(fromId).setCreatTime(new Date()).setToId(userId).setType("WCK")
                .setDetail("<p><strong>尊敬的老师：</strong></p><p>\t</p><p>\t\t您有学生提交了阶段任务成果，请及时前往相关页面进行查看评分。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    public void afterGiveStageTaskScore(Integer taskId) {
        Integer userId = messageService.getTaskStuUserId(taskId);
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("阶段任务通知").setFromId(fromId).setCreatTime(new Date()).setToId(userId).setType("WCK")
                .setDetail("<p><strong>同学您好：</strong></p><p>\t</p><p>\t\t您的阶段任务提交已经被老师批复，请及时前往相关页面进行查看。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    public void afterGiveSubject() {
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        List<Integer> userIds= messageService.getOfficeUserId();
        List<Message> messages = new ArrayList<>();
        for(int i:userIds){
            Message message = new Message().setTitle("出题审核通知").setFromId(fromId).setCreatTime(new Date()).setToId(i).setType("WCK")
                    .setDetail("<p><strong>教务处老师好：</strong></p><p>\t</p><p>\t\t有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                    .setMessageId(FileStorageUtil.getDocId());
            messages.add(message);
        }
        creatNewMessage2(messages);
    }

    public void afterAddReport(Integer id) {
        Report report = messageService.getMessageReport(id);
        String stage = report.getStage();
        if(stage.equals("KT")){
            stage="开题";
        }else {
            stage="中期";
        }
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle(stage+"报告提交通知").setFromId(fromId).setCreatTime(new Date()).setToId(report.getUserId()).setType("WCK")
                .setDetail("<p><strong>尊敬的老师：</strong></p><p>\t</p><p>\t\t您有学生提交了"+stage+"报告，请及时前往相关页面进行打分。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }

    public void afterAddReportJT(Integer id) {
        Report report = messageService.getMessageReport(id);
        Integer fromId = GmsUtil.getCurrentUser().getUserId();
        Message message = new Message().setTitle("结题答辩申请通知").setFromId(fromId).setCreatTime(new Date()).setToId(report.getUserId()).setType("WCK")
                .setDetail("<p><strong>尊敬的老师：</strong></p><p>\t</p><p>\t\t您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>\t</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>")
                .setMessageId(FileStorageUtil.getDocId());
        creatNewMessage(message);
    }
}
