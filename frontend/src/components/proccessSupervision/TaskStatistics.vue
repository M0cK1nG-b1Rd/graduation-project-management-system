<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>过程监督</el-breadcrumb-item>
      <el-breadcrumb-item>我的任务</el-breadcrumb-item>
    </el-breadcrumb>
    <!--    外层卡片区-->
    <el-card class="outer_card">
      <!--      页面标题-->
      <el-row type="flex" justify="center" class="page_title">统计数据</el-row>
      <el-divider></el-divider>
      <el-row>
        <!--      任务总数-->
        <el-col :span="8">
          <el-card style="width: 90%; height: 300px">
            <el-row class="card_title">您的任务总数</el-row>
            <el-divider></el-divider>
            <el-row class="card_body">
              截至当前，您一共收到的阶段任务个数为：
            </el-row>
            <el-row type="flex" justify="center">
              <a-progress :strokeWidth="7"
                          type="circle" :percent="100"
                          :format="() => `${statisticsInfo.totalTask} 个`"
              />
            </el-row>
          </el-card>
        </el-col>
        <!--      通过任务数-->
        <el-col :span="8">
          <el-card style="width: 90%; height: 300px">
            <el-row class="card_title">通过验收任务数</el-row>
            <el-divider></el-divider>
            <el-row class="card_body">
              截至当前，您已通过验收的阶段任务个数为：
            </el-row>
            <el-row type="flex" justify="center">
              <a-progress :strokeWidth="7"
                          type="circle" :percent="statisticsInfo.passRatio"
                          :format="() => `${statisticsInfo.passedTask} 个`"
              />
            </el-row>
          </el-card>
        </el-col>
        <!--      未通过提交次数-->
        <el-col :span="8">
          <el-card style="width: 90%; height: 300px">
            <el-row class="card_title">未通过提交次数</el-row>
            <el-divider></el-divider>
            <el-row class="card_body">
              截至当前，您的阶段任务提交一共被导师驳回次数为：
            </el-row>
            <el-row type="flex" justify="center">
              <a-progress :strokeWidth="7"
                          status="exception"
                          type="circle"
                          :percent="statisticsInfo.rejectRatio"
                          :format="() => `${statisticsInfo.rejectTimes} 次`"
              />
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'TaskStatistics',
  mounted() {
    this.getStatistics()
  },
  data() {
    return {
      statisticsInfo: {
        avgScore: Number, // 所有任务的平均分
        totalTask: Number, // 总共的任务数量
        passedTask: Number, // 通过的任务数
        rejectTimes: Number, // 被驳回的次数
        passRatio: Number, // 通过率
        rejectRatio: Number // 驳回率
      }
    }
  },
  methods: {
    async getStatistics() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/statistics/stageTask')
      if (res.meta.code === 200) {
        this.statisticsInfo = res.data
        this.statisticsInfo.passRatio = this.statisticsInfo.passedTask / (this.statisticsInfo.rejectTimes + this.statisticsInfo.passedTask)
        this.statisticsInfo.passRatio *= 100
        this.statisticsInfo.rejectRatio = 100 - this.statisticsInfo.passRatio
      } else {
        this.$message.error(res.meta.message)
      }
    }
  }
}
</script>

<style Lang="less" scoped>
/*外层卡片*/
.outer_card{
  padding: 50px;
}
/*页面标题*/
.page_title{
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}
/*自定义分割线*/
.divider{
  height: 12px;
}
/*卡片标题*/
.card_title{
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 20px;
  font-weight: bold;
}
/*卡片内容*/
.card_body{
  margin-left: 30px;
  margin-right: 30px;
  font-size: 16px;
}
</style>
