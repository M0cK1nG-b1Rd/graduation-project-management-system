package com.gms.gms.domain;

import lombok.Data;

//为了显示数据方便额外新建的类，在数据库中并没有这张表
@Data
public class AppliedSubjectRecord {

    String studentName;

    String status;

    String subName;

    String description;

    String zone;

    String teacherName;
}
