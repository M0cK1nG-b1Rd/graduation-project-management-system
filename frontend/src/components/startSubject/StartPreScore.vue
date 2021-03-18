<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>开题管理</el-breadcrumb-item>
      <el-breadcrumb-item>开题报告</el-breadcrumb-item>
    </el-breadcrumb>
    <!--      题目信息展示区-->
    <el-row>
      <el-col>
          <div class="card_header">开题答辩安排信息</div>
          <!--    答辩相情卡片-->
          <el-row type="flex" justify="center">
            <el-card class="subject_detail">
              <!--        课题名称-->
              <el-row>
                <el-col :span="8">
                答辩时间：<a-tag color="blue" style="font-size: 15px">{{currentSubjectInfo.subName}}</a-tag>
                </el-col>
                <el-col :span="8">
                  答辩地点：<a-tag color="orange">{{currentSubjectInfo.zone}}</a-tag>
                </el-col>
                <el-col :span="8">
                  负责人：<a-tag color="orange">{{currentSubjectInfo.zone}}</a-tag>
                </el-col>
              </el-row>
              <el-divider></el-divider>
              <!--        参与学生名单、指导老师名单-->
              <el-row>
                <!--          答辩学生参与名单-->
                <el-col :span="10">
                  <el-card class="box-student" >
                    <div slot="header" class="clearfix">
                      <span>学生名单</span>
                    </div>
                    <div v-for="o in 4" :key="o" class="text item">
                      {{'学生 ' + o }}
                    </div>
                  </el-card>
                </el-col>
<!--                 &lt;!&ndash;         占位符       &ndash;&gt;-->
<!--                <el-col :span="4">-->
<!--                  <el-divider direction="vertical"></el-divider>-->
<!--                </el-col>-->
                <!--          答辩老师参与名单-->
                <el-col :span="14">
                  <el-card class="box-teacher" style="margin-left: 20%">
                    <div slot="header" class="clearfix">
                      <span>教师名单</span>
                    </div>
                    <div v-for="o in 4" :key="o" class="text item">
                      {{'教师 ' + o }}
                    </div>
                  </el-card>
                </el-col>
              </el-row>
              <el-divider></el-divider>
              <!--        答辩信息附件下载区-->
              <el-row type="flex" align="center">
                <el-col :span="4" class="item_label">附件下载：</el-col>
              </el-row>
              <el-divider class="divider2">
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
              </el-divider>
              <div class="card_header">开题答辩成绩登记</div>
              <el-row type="flex" justify="center">
                <!--  表格卡片-->
                <!--      表格区-->
                <el-row>
                  <el-table
                    :data="subjectlist"
                    style="width: 100%; font-size: 15px">
                    <!--          课题名称-->
                    <el-table-column
                      :show-overflow-tooltip="true"
                      prop="subName"
                      label="课题名称"
                      width="300">
                    </el-table-column>
                    <!--          申请日期-->
                    <el-table-column
                      sortable
                      :show-overflow-tooltip="true"
                      prop="poseTime"
                      label="提交日期"
                      width="110">
                    </el-table-column>
                    <!--         报告状态-->
                    <el-table-column
                      :show-overflow-tooltip="true"
                      prop="status"
                      width="120"
                      :filters="[{ text: '待审核', value: 1 }, { text: '已通过', value: 2 }, { text: '未通过', value: 3 }]"
                      :filter-method="filterStatus"
                      filter-placement="bottom-end"
                      label="报告状态">
                      <template slot-scope="scope">
                        <el-tag type="success" v-if=" scope.row.status == '2'">已通过</el-tag>
                        <el-tag type="warning" v-if=" scope.row.status == '1'">待审核</el-tag>
                        <el-tag type="danger" v-if=" scope.row.status == '3'">未通过</el-tag>
                      </template>
                    </el-table-column>
                    <!--          操作-->
                    <el-table-column
                      :show-overflow-tooltip="true"
                      width="200"
                      label="操作">
                      <template slot-scope="scope">
                        <!--              查看课题详细内容-->
                        <el-tooltip class="item" effect="dark" content="查看课题详细内容" placement="top" :enterable="false">
                          <el-button type="success" icon="el-icon-view" circle size="mini" @click="viewSubject(scope.row)"></el-button>
                        </el-tooltip>
                        <!--              查看开题阶段内容-->
                        <el-tooltip class="item" effect="dark" content="查看开题阶段内容" placement="top" :enterable="false">
                          <el-button type="warning" icon="el-icon-s-flag" circle size="mini" @click="viewReport(scope.row)"></el-button>
                        </el-tooltip>
                        <!--              查看反馈结果-->
                        <el-tooltip class="item" effect="dark" content="查看反馈结果" placement="top" :enterable="false">
                          <el-button type="primary" icon="el-icon-message" circle size="mini" @click="viewFeedback(scope.row)"></el-button>
                        </el-tooltip>
                      </template>
                    </el-table-column>
                  </el-table>
                </el-row>
              </el-row>
            </el-card>
          </el-row>
      </el-col>
      <el-col>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'StartReport',
  data() {
    return {
      // 查看学生的课题信息
      // 当前选中的课题信息
      currentSubjectInfo: {
        subId: '',
        subName: '',
        zone: '', // 课题领域
        description: '',
        majorName: '',
        requirement: '',
        teacherTitle: '',
        teacherName: '',
        teacherHomePage: ''
      },
      report: {
        meaning: '',
        result: '',
        plan: '',
        stage: 'KT'
      }
      // 富文本编辑器可见性
    }
  },
  methods: {}
}
</script>

<style Lang="less" scoped>
.el-card{
  margin-bottom: 20px;
  margin-right: 5px;
}
.bg-top{
  background-color: #faf9f9;
}
.card_header{
  margin-bottom: 10px;
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
.box-student{
  border-radius: 34px;
  background: #ffffff;
  box-shadow:  7px 7px 14px #c2c2c2,
    -7px -7px 14px #ffffff;
}
.box-teacher{
  border-radius: 34px;
  background: #ffffff;
  box-shadow:  7px 7px 14px #c2c2c2,
    -7px -7px 14px #ffffff;
}
/*分割线*/
.el-divider{
  margin: 7px;
}
.divider2{
  margin: 10px;
}
.box-teacher{
}
/*答辩详情卡片*/
.subject_detail{
  width: 80%;
  padding-left: 50px;
  font-size: 16px;
  /*边框阴影*/
  border-radius: 4px;
  background: #ffffff;
  box-shadow:  28px 28px 56px #bababa,
    -28px -28px 56px #ffffff;
}
/*表单标签*/
.item_label{
  display: flex;
  align-items: center;
}
</style>
