<template>
  <div>
<!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>成绩管理</el-breadcrumb-item>
      <el-breadcrumb-item>权重配置</el-breadcrumb-item>
    </el-breadcrumb>
<!--    外层卡片-->
    <el-card class="outer_card">
<!--      页面标题-->
      <el-row type="flex" justify="center" class="page_title">配置权重</el-row>
      <el-divider></el-divider>
<!--      第一步-设置各阶段大比重-->
      <el-row>
        <!--      第一步-标题及说明-->
        <el-row type="flex" justify="center">
          <h1 style="font-weight: bold">第一步-配置各阶段占比</h1>
        </el-row>
        <div class="divider"></div>
        <el-row type="flex" justify="center">
          <h2>总成绩由开题、中期、结题及过程任务四部分构成，请在此设置各部分占总成绩的比例</h2>
        </el-row>
        <el-row type="flex" justify="center" style="margin-bottom: 20px">
          <h3>例如：开题阶段分占10%，中期阶段分占20%，结题阶段分占60%，过程任务占10%。四部分得分加权平均即为最终得分</h3>
        </el-row>
        <!--      第一步权重配置区-->
        <!--        开题阶段-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            开题阶段：
            <el-input style="width: 120px" v-model="weightSetting.startStage" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#f8d802', to: '#e85a50'}"
              :percent="parseInt(weightSetting.startStage)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <!--        中期阶段-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            中期阶段：
            <el-input style="width: 120px" v-model="weightSetting.middleStage" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#f8d802', to: '#e85a50'}"
              :percent="parseInt(weightSetting.middleStage)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <!--        结题阶段-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            结题阶段：
            <el-input style="width: 120px" v-model="weightSetting.endStage" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#f8d802', to: '#e85a50'}"
              :percent="parseInt(weightSetting.endStage)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <!--        阶段任务-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            阶段任务：
            <el-input style="width: 120px" v-model="weightSetting.stageTask" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#f8d802', to: '#e85a50'}"
              :percent="parseInt(weightSetting.stageTask)"
              status="active"/>
          </el-col>
        </el-row>
      </el-row>
      <el-divider></el-divider>
<!--      第二步-设置各阶段中校比重-->
      <el-row>
<!--      第二步-标题及说明-->
        <el-row type="flex" justify="center">
          <h1 style="font-weight: bold">第二步-配置各阶段内小分占比</h1>
        </el-row>
        <div class="divider"></div>
        <el-row type="flex" justify="center">
          <h2>开题、中期、结题三个阶段成绩分别由该阶段材料得分及答辩得分两部分构成，请在此配置各阶段内这两部分占阶段得分的比重</h2>
        </el-row>
        <el-row type="flex" justify="center" style="margin-bottom: 20px">
          <h3>例如：开题阶段材料得分占开题阶段得分的40%，开题答辩得分占开题阶段得分的60%，二者加权平均即为开题阶段成绩</h3>
        </el-row>
<!--        第二步权重配置区-->
        <el-row type="flex" justify="center"><h1>开题阶段</h1></el-row>
        <!--        开题材料-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            开题材料：
            <el-input style="width: 120px" v-model="weightSetting.startMaterial" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#ffc900', to: '#ff3c00'}"
              :percent="parseInt(weightSetting.startMaterial)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <!--        开题答辩-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            开题答辩：
            <el-input style="width: 120px" v-model="weightSetting.startPlea" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#ffc900', to: '#ff3c00'}"
              :percent="parseInt(weightSetting.startPlea)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <el-row type="flex" justify="center"><h1>中期阶段</h1></el-row>
        <!--        中期材料-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            中期材料：
            <el-input style="width: 120px" v-model="weightSetting.middleMaterial" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#ffc900', to: '#ff3c00'}"
              :percent="parseInt(weightSetting.middleMaterial)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <!--        中期答辩-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            中期答辩：
            <el-input style="width: 120px" v-model="weightSetting.middlePlea" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#ffc900', to: '#ff3c00'}"
              :percent="parseInt(weightSetting.middlePlea)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <el-row type="flex" justify="center"><h1>结题阶段</h1></el-row>
        <!--        结题材料-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            结题材料：
            <el-input style="width: 120px" v-model="weightSetting.endMaterial" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#ffc900', to: '#ff3c00'}"
              :percent="parseInt(weightSetting.endMaterial)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <!--        结题答辩-->
        <el-row type="flex" align="middle">
          <el-col :span="6" style="font-size: 15px">
            结题答辩：
            <el-input style="width: 120px" v-model="weightSetting.endPlea" size="small"></el-input>
          </el-col>
          <el-col :span="18">
            <a-progress
              :stroke-color="{from: '#ffc900', to: '#ff3c00'}"
              :percent="parseInt(weightSetting.endPlea)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
      </el-row>
<!--      保存配置按钮-->
      <el-divider></el-divider>
      <el-row type="flex" justify="center">
        <el-popconfirm
          @confirm="submitWeightSetting"
          title="确定要保存分数权重设置吗？">
          <el-button type="primary" plain slot="reference">保存权重配置</el-button>
        </el-popconfirm>
      </el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'SetWeight',
  mounted() {
    this.getWeightSetting()
  },
  data() {
    return {
      weightSetting: {
        // 大阶段分
        startStage: 0,
        middleStage: 0,
        endStage: 0,
        stageTask: 0,
        // 阶段小分
        startMaterial: 0,
        startPlea: 0,
        middleMaterial: 0,
        middlePlea: 0,
        endMaterial: 0,
        endPlea: 0
      }
    }
  },
  methods: {
    // 提交权重设置
    async submitWeightSetting() {
      // 校验四部分权重之和是否为100%
      if (parseInt(this.weightSetting.startStage) + parseInt(this.weightSetting.middleStage) + parseInt(this.weightSetting.endStage) + parseInt(this.weightSetting.stageTask) !== 100) {
        return this.$message.warning('开题、中期、结题及过程任务四部分之和不为100，请检查！')
      }
      // 校验开题小分
      if (parseInt(this.weightSetting.startMaterial) + parseInt(this.weightSetting.startPlea) !== 100) {
        return this.$message.warning('开题材料及开题答辩权重之和不为100%，请检查！')
      }
      // 校验中期小分
      if (parseInt(this.weightSetting.middleMaterial) + parseInt(this.weightSetting.middlePlea) !== 100) {
        return this.$message.warning('中期材料及中期答辩权重之和不为100%，请检查！')
      }
      // 校验结题小分
      if (parseInt(this.weightSetting.endMaterial) + parseInt(this.weightSetting.endPlea) !== 100) {
        return this.$message.warning('结题材料及结题答辩权重之和不为100%，请检查！')
      }
      // 校验通过后发送到后端
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/score/weight', this.weightSetting)
      if (res.meta.code === 200) {
        this.$notify.success('配置打分权重成功！')
      } else {
        this.$notify.error('配置打分权重失败！')
      }
    },
    // 获取权重设置
    async getWeightSetting() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/score/weight')
      if (res.meta.code === 200) {
        this.weightSetting = res.data
      } else {
        this.$notify.error('获得打分配置失败！')
      }
    }
  }
}
</script>

<style Lang="less" scoped>
/*页面标题*/
.page_title{
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}
.outer_card{
  padding-left: 30px;
  padding-right: 30px;
}
/*分割线*/
.divider{
  height: 10px;
}
</style>
