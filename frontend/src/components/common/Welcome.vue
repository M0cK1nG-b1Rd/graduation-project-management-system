<template>
  <div>
<!--    顶部欢迎词-->
    <el-row>
      <dv-decoration-5 :dur="4" style="width:100%;height:40px;" />"
    </el-row>
<!--    轮播区-->
    <el-row>
      <el-carousel :interval="4000" type="card" height="260px">
        <el-carousel-item>
          <img src="../../assets/imgs/welcome/img1.png" style="width: 100%; height: 100%;">
        </el-carousel-item>
        <el-carousel-item>
          <img src="../../assets/imgs/welcome/img2.png" style="width: 100%; height: 100%;">
        </el-carousel-item>
        <el-carousel-item>
          <img src="../../assets/imgs/welcome/img3.png" style="width: 100%; height: 100%;">
        </el-carousel-item>
        <el-carousel-item>
          <img src="../../assets/imgs/welcome/img4.png" style="width: 100%; height: 100%;">
        </el-carousel-item>
      </el-carousel>
    </el-row>
<!--   分割线-->
    <el-row style="margin-top: 20px; margin-bottom: 20px">
      <dv-decoration-10 style="width:100%;height:5px;" />
    </el-row>
<!--    下半部分-->
    <el-row style="margin-top: 50px">
<!--      通知轮播-->
      <el-col :span="12">
        <el-card style="width: 90%; height: 580px">
          <el-row type="flex" justify="center" align="middle" style="font-size: 20px; font-weight: bold">
            最新通知
            <a-icon type="notification" @click="gotoNoticePage"/>
          </el-row>
          <dv-decoration-1 style="width:80%;height:50px;margin-right: 50px" />
          <dv-scroll-board :config="noticeConfig" style="width:100%;height:560px;color: #333333" />
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-row>
<!--          日历-->
          <el-card style="height: 320px; width: 95%">
            <el-row type="flex" justify="center" align="middle" style="font-size: 20px; font-weight: bold">
              系统日历
              <a-icon type="calendar" />
            </el-row>
            <a-calendar :fullscreen="false" />
          </el-card>
        </el-row>
        <!--      当前阶段信息-->
        <el-row>
          <el-card style="width: 95%; height: 260px" v-for="item in currentStageInfo" :key="item.stageId">
            <el-row type="flex" justify="center" align="middle" style="font-size: 20px; font-weight: bold">
              当前阶段
              <a-icon type="hourglass" />
            </el-row>
            <dv-decoration-1 style="width:80%;height:50px;margin-right: 50px" />
            <!--          阶段名称-->
            <el-row type="flex" align="middle">
              <el-col :span="6" class="form_label">
                当前阶段：
              </el-col>
              <el-col :span="16">
                <a-tag color="cyan" style="font-size: 15px">{{item.stageName}}</a-tag>
              </el-col>
            </el-row>
            <!--          开始时间-->
            <el-row type="flex" align="middle">
              <el-col :span="6" class="form_label">
                开始时间：
              </el-col>
              <el-col :span="16">
                <a-tag color="green" style="font-size: 15px">{{item.startTime}}</a-tag>
              </el-col>
            </el-row>
            <!--          结束时间-->
            <el-row type="flex" align="middle">
              <el-col :span="6" class="form_label">
                结束时间：
              </el-col>
              <el-col :span="16">
                <a-tag color="red" style="font-size: 15px">{{item.endTime}}</a-tag>
              </el-col>
            </el-row>
            <!--          阶段安排-->
            <el-row type="flex" align="middle">
              <el-col :span="6" class="form_label">
                阶段安排：
              </el-col>
              <el-col :span="16">
                <a-textarea :disabled="true" v-model="item.description" :rows="3" />
              </el-col>
            </el-row>
          </el-card>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'Welcome',
  created() {
    this.getNotice()
    this.getAllStageInfo()
  },
  data() {
    return {
      // 轮播表配置
      noticeConfig: {
        header: ['标题', '时间', '来源'],
        data: [
          ['2021年秋季比利时布鲁塞尔管理大学交换生项目选拔通知', '2021-03-22', '教务处'],
          ['关于征集西安交通大学优秀通识课程论文及教学成果展示作品的通知', '2021-03-22', '教务处'],
          ['关于开展2021西安交通大学美国大学生数学建模竞赛（MCM/ICM）相关工作的通知', '2021-03-21', '数学与统计学院'],
          ['关于转发《教育部办公厅关于推荐新文科研究与改革实践项目的通知》', '2021-03-17', '教务处'],
          ['关于转发《教育部办公厅关于推荐新文科研究与改革实践项目的通知》', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['2021年秋季日本爱媛大学交换生项目选拔通知', '2021-03-17', '教务处'],
          ['关于第七届全国大学生工程训练综合能力竞赛校内第一轮评审的通知', '2021-03-17', '实践教学中心']
        ],
        headerBGC: 'rgba(255, 114, 71, 0.15)',
        oddRowBGC: '#fff',
        evenRowBGC: 'rgba(29, 193, 245, 0.05)',
        rowNum: 10,
        columnWidth: [200, 120, 120]
      },
      // 查询公告，参数
      queryInfo: {
        keyWord: '', // 关键词
        page: 1, // 当前页号
        size: 10 // 页面大小
      },
      // 当前阶段Id
      currentStageId: [],
      // 当前阶段信息
      currentStageInfo: []
    }
  },
  methods: {
    // 跳转到通知页面
    gotoNoticePage() {
      this.$router.push('/notice/view')
    },
    // 获取通知信息
    async getNotice() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/announcement', { params: this.queryInfo })
      if (res.meta.code !== 200) return this.$message.error('获取公告信息失败！')
      for (let i = 0; i < res.data.records.length; i++) {
        this.noticeConfig.data[i] = [
          res.data.records[i].annTitle,
          res.data.records[i].createTime,
          res.data.records[i].signature
        ]
      }
    },
    // 获取所有阶段信息
    async getAllStageInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/stage/system')
      if (res.meta.code !== 200) return this.$message.error('请求阶段信息失败！')
      this.allStageInfo = res.data.allStage
      this.currentStageId = res.data.currentStageId
      for (let i = 0; i < this.currentStageId.length; i++) {
        this.currentStageInfo.push(this.allStageInfo[this.currentStageId[i]])
      }
    }
  }
}
</script>

<style Lang="less" scoped>
/*自定义表单的标题*/
.form_label{
  padding-left: 20px;
  font-size: 16px;
  text-align: start;
}
/*自定义分割线*/
.divider{
  height: 12px;
}
</style>
