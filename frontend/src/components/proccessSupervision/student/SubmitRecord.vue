<template>
  <div>
<!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>过程监督</el-breadcrumb-item>
      <el-breadcrumb-item>我的任务</el-breadcrumb-item>
    </el-breadcrumb>
<!--      页面标题-->
    <el-row type="flex" justify="center" class="page_title">我的提交记录</el-row>
    <dv-decoration-1 style="width:80%;height:50px;" />
<!--    外层卡片区-->
    <el-row class="outer">
<!--      页面内容-->
      <el-card class="task_card"
               v-for="(item, index) in taskSubmitRecords"
               :key="index">
<!--        卡片头部--课题名称-->
        <div slot="header" class="clearfix subject_title">
            <el-tooltip class="item" effect="dark" :content="item.taskName" placement="top">
              <span>{{ item.taskName }}</span>
            </el-tooltip>
          </div>
<!--        卡片主体-->
        <div class="card_body">
<!--          所属阶段-->
          <el-row>
            所属阶段：
            <a-tag v-if="item.stage === 'KT'" color="cyan" style="font-size: 15px">开题阶段</a-tag>
            <a-tag v-if="item.stage === 'ZQ'" color="cyan" style="font-size: 15px">中期阶段</a-tag>
            <a-tag v-if="item.stage === 'JT'" color="cyan" style="font-size: 15px">结题阶段</a-tag>
          </el-row>
          <div class="divider"></div>
<!--          任务状态-->
          <el-row>
            任务状态：
            <a-tag v-if="item.status === 'WTJ'" style="font-size: 15px" color="cyan">未提交</a-tag>
            <a-tag v-if="item.status === 'DSH'" style="font-size: 15px" color="cyan">待审核</a-tag>
            <a-tag v-if="item.status === 'YTG'" style="font-size: 15px" color="cyan">已通过</a-tag>
            <a-tag v-if="item.status === 'WTG'" style="font-size: 15px" color="cyan">未通过</a-tag>
          </el-row>
          <div class="divider"></div>
<!--          开始时间-->
          <el-row>
            开始时间：
            <a-tag color="blue" style="font-size: 15px; color: #393e46">{{item.startTime}}</a-tag>
          </el-row>
          <div class="divider"></div>
<!--          截止时间-->
          <el-row>
            截止时间：
            <a-tag color="blue" style="font-size: 15px; color: #393e46">{{item.endTime}}</a-tag>
          </el-row>
          <div class="divider"></div>
<!--          提交次数-->
          <el-row>
            提交次数：
            <a-tag color="blue" style="font-size: 15px; color: #393e46">{{item.resultList.length}} 次</a-tag>
          </el-row>
          <div class="divider"></div>
          <div class="divider"></div>
<!--          查看详情-->
          <el-row type="flex" justify="center">
            <el-button style="float: right; padding: 3px 0"
                       @click="viewSubmitDetail(item.resultList)"
                       type="primary">
              查看提交详情
            </el-button>
          </el-row>
        </div>
      </el-card>
    </el-row>
<!--    选中任务所有提交详情信息对话框-->
    <el-dialog
      :visible.sync="submitDetailVisible"
      width="60%">
      <el-timeline>
        <el-row type="flex" justify="center" style="font-size: 25px; font-weight: bold">提交历史</el-row>
        <div class="divider"></div>
        <div class="divider"></div>
        <div class="divider"></div>
        <el-timeline-item v-for="(item, index) in currentTaskSubmitInfo" :key="index">
          <el-card>
            <el-row>该任务的第{{currentTaskSubmitInfo.retries}}次提交</el-row>
            <p>王小虎 提交于 2018/4/12 20:46</p>
          </el-card>
        </el-timeline-item>
      </el-timeline>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'SubmitRecord',
  mounted() {
    this.getTaskSubmitRecords()
  },
  data() {
    return {
      taskSubmitRecords: [],
      queryInfo: {
        page: 1, // 当前页数
        size: 5 // 页面大小
      },
      submitDetailVisible: false,
      currentTaskSubmitInfo: []
    }
  },
  methods: {
    // 获取所有提交记录（按任务分组）
    async getTaskSubmitRecords() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/stage/task/result', { params: this.queryInfo })
      if (res.meta.code === 200) {
        this.taskSubmitRecords = res.data.records
      } else {
        this.$message.error(res.meta.message)
      }
    },
    // 查看某一课题的提交详情
    viewSubmitDetail(submitInfo) {
      this.currentTaskSubmitInfo = submitInfo
      console.log(this.currentTaskSubmitInfo)
      this.submitDetailVisible = true
    }
  }
}
</script>

<style Lang="less" scoped>
/*外层卡片*/
.outer{
  padding: 50px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.task_card{
  margin: 20px;
  width: 300px;
  height: 280px;
}
/*页面标题*/
.page_title{
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}
/*抽屉标题*/
.drawer_title{
  font-size: 20px;
  font-weight: bold;
  text-align: center;
}
/*自定义表单的标题*/
.form_label{
  padding-left: 20px;
  font-size: 16px;
  text-align: start;
}
/*自定义分割线*/
.divider{
  height: 5px;
}
/*课题名称*/
.subject_title{
  font-size: 18px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 10px;
  text-align: center;
  font-weight: bold;
  /*过长自动隐藏*/
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
/*卡片体*/
.card_body{
  font-size: 15px;
}
</style>
