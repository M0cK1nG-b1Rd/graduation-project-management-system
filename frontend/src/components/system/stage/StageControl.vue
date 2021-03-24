<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>系统管理</el-breadcrumb-item>
      <el-breadcrumb-item>阶段控制</el-breadcrumb-item>
    </el-breadcrumb>
    <!--  卡片视图区-->
      <el-card class="box-card">
        <!--      内容区域-->
        <div class="box">
          <!--        查看当前系统阶段-->
          <el-card class="inner-card">
            <div class="card_header">查看当前阶段</div>
            <div class="card_body">
              <el-button type="info" plain icon="el-icon-view" size="mini" @click="currentStagePage">点击查看</el-button>
              <p class="card_body_description"></p>
            </div>
          </el-card>
          <!--        当前激活激活-->
          <el-card class="inner-card">
            <div class="card_header">当前激活激活</div>
            <div class="card_body">
              <el-button type="success" plain icon="el-icon-magic-stick" size="mini" @click="activeStagePage">点击激活</el-button>
              <p class="card_body_description"></p>
            </div>
          </el-card>
          <!--        编辑系统阶段信息-->
          <el-card class="inner-card">
            <div class="card_header">编辑阶段信息</div>
            <div class="card_body">
              <el-button type="warning" plain icon="el-icon-edit" size="mini" @click="editStagePage">点击编辑</el-button>
              <p class="card_body_description"></p>
            </div>
          </el-card>
          <!--        查看所有系统阶段-->
          <el-card class="inner-card">
            <div class="card_header">查看所有阶段</div>
            <div class="card_body">
              <el-button type="primary" plain icon="el-icon-view" size="mini" @click="stageLineVisibility = true">点击查看</el-button>
              <p class="card_body_description"></p>
            </div>
          </el-card>
        </div>
      </el-card>
<!--    页面下方详情页-->
      <el-card class="specific_content">
          <!--        路由占位符-->
          <router-view></router-view>
      </el-card>
<!--右侧弹出的阶段状态步骤条抽屉-->
    <a-drawer
      title="系统阶段状态"
      :width="420"
      :visible="stageLineVisibility"
      :body-style="{ paddingBottom: '80px', paddingLeft: '40px' }"
      @close="stageLineVisibility = false"
    >
<!--      步骤条-->
      <el-steps :space="100"
                direction="vertical"
                :active="currentStageId[0]"
                process-status="success"
                finish-status="process">
        <el-step v-for="item in allStageInfo" :key="item.stageId" :description="item.description" :title="item.stageName"></el-step>
      </el-steps>
    </a-drawer>
  </div>
</template>

<script>
export default {
  name: 'StageControl',
  data() {
    return {
      // 当前所处状态
      currentStageId: [0],
      // 是否可以查看所有状态的抽屉界面
      stageLineVisibility: false,
      // 所有阶段的信息
      allStageInfo: [],
      // 阶段总数
      totalStageNum: 0
    }
  },
  created() {
    this.getAllStageInfo()
  },
  methods: {
    // 获取所有阶段信息
    async getAllStageInfo() {
      const { data: res } = await this.$http.get('/stage/system')
      if (res.meta.code !== 200) return this.$message.error('请求阶段信息失败！')
      this.allStageInfo = res.data.allStage
      this.currentStageId = res.data.currentStageId
      this.totalStageNum = res.data.totalStageNum
    },
    // 点击按钮，跳转至当前阶段详情界面
    currentStagePage() {
      this.$router.push('/sys/stage/current')
    },
    // 点击按钮，跳转至编辑阶段界面
    editStagePage() {
      this.$router.push('/sys/stage/edit')
    },
    // 点击按钮时，跳转至激活阶段界面
    activeStagePage() {
      this.$router.push('/sys/stage/active')
    }
  }
}
</script>

<style Lang="lang" scoped>
/*顶部标题区域*/
.title_decoration{
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
  font-size: 30px;
  font-weight: bold;
}
.box-card{
  margin-top: 40px;
}
/*进度条*/
.stage_line{
  margin-bottom: 15px;
  margin-left: 60px;
}
.box{
  display: flex;
  justify-content: space-evenly;
}
.inner-card{
  flex-basis: 190px;
  border-radius: 11px;
  background: #ffffff;
  box-shadow:  16px 16px 32px #cccccc,
  -16px -16px 32px #ffffff;
}
.card_header{
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
.card_body{
  margin-top: 15px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.card_body_description{
  font-size: 15px;
  padding-top: 15px;
  text-align: center;
}
.specific_content{
  margin-top: 15px;
}
</style>
