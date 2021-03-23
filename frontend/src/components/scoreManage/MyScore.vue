<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>成绩管理</el-breadcrumb-item>
      <el-breadcrumb-item>我的成绩</el-breadcrumb-item>
    </el-breadcrumb>
    <!--  成绩查看整体卡片-->
    <el-card>
      <!--      开题，中期成绩卡-->
      <el-row style="margin-bottom: 3%">
<!--        开题成绩-->
        <el-col :span="10" style="margin-left: 3%">
          <div class="card_header">开题成绩</div>
          <el-card style="margin-left: 10px">
            <el-row>
              <el-col :span="14">
                <div>答辩表现</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.startPleaScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>开题材料</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.startMaterialScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>总分</div>
                <a-progress
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.startScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
              </el-col>
<!--              超过年级百分比-->
              <el-col :span="10" style="margin-top: 3px">
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',
                      }"
                  :percent="90"/>
                <div style="font-weight: bold; display: flex; justify-content: center">超越比例</div>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
<!--        中期成绩-->
        <el-col :span="10" style="margin-left: 10%">
          <div class="card_header">中期成绩</div>
          <el-card style="margin-left: 10px">
            <el-row>
              <el-col :span="14">
                <div>答辩表现</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.middlePleaScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>中期材料</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.middleMaterialScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>总分</div>
                <a-progress
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.middleScore"
                  status="active"
                  :format="percent => `${percent} `"
                />
              </el-col>
              <!--              超越年级-->
              <el-col :span="10" style="margin-top: 3px">
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',
                      }"
                  :percent="90"
                  :format="percent => `${percent} `"/>
                <div style="font-weight: bold; display: flex; justify-content: center">超越比例</div>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
      <!--      阶段，结题成绩卡-->
      <el-row>
<!--        阶段成绩-->
        <el-col :span="10" style="margin-left: 3%">
          <div class="card_header">阶段任务成绩</div>
          <el-card style="margin-left: 10px">
            <el-row type="flex" align="middle">
              <el-col :span="14">
                <div>总分</div>
                <a-progress
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.procedureScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
              </el-col>
              <!--              超越年级-->
              <el-col :span="10" style="margin-top: 3px">
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',
                      }"
                  :percent="90"
                  :format="percent => `${percent} `"/>
                <div style="font-weight: bold; display: flex; justify-content: center">超越比例</div>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
<!--        结题成绩-->
        <el-col :span="10" style="margin-left: 10%">
          <div class="card_header">结题成绩</div>
          <el-card style="margin-left: 10px">
            <el-row>
              <el-col :span="14">
                <div>答辩表现</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.endPleaScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>结题材料</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.endMaterialScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>总分</div>
                <a-progress
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.endScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
              </el-col>
              <!--              超越比例-->
              <el-col :span="10" style="margin-top: 3px">
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',
                      }"
                  :percent="90"
                  :format="percent => `${percent} `"/>
                <div style="font-weight: bold; display: flex; justify-content: center">超越比例</div>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
      <!--      总成绩与统计分析-->
      <el-row>
        <el-col>
          <div class="card_header" style="margin-top: 1%">总成绩</div>
          <el-card style="margin: 3%">
            <el-row type="flex" justify="space-between">
<!--              总分-->
              <el-col :span="6" style="margin-top: 6%">
                <div style="font-size: 17px;font-weight: bold; display: flex; justify-content: center; margin-bottom: 15px">总分:</div>
                <a-progress style="margin-left: 10%"
                  strokeWidth="15"
                  :stroke-color="{from: '#a548f6',to: '#f098fa',}"
                  :percent="score.totalScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
              </el-col>
<!--              统计信息-->
              <el-col :span="13" style="margin-left: 20%" >
                <el-col :span="8">
                  <a-progress
                    style="display: flex; justify-content: center"
                    type="circle"
                    :stroke-color="{
                      '0%': '#8566f6',
                      '100%': '#3a7bff',
                        }"
                    :percent="10"
                    :format="percent => `${percent} `"/>
                  <div style="font-weight: bold; display: flex; justify-content: center; margin-bottom: 15px">您超越年级10%的同学</div>
                </el-col>
                <el-col :span="14">
                <div style="font-weight: bold; display: flex; margin-left: 50%">年级成绩统计</div>
                  <v-chart :forceFit="true" height="240" :data="data" >
                    <v-tooltip :showTitle="false"></v-tooltip>
                    <v-legend dataKey="type"></v-legend>
                    <v-coord type="theta" innerRadius="0.75"></v-coord>
                    <v-pie position="value" color="type" shape="sliceShape"></v-pie>
                  </v-chart>
                </el-col>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
const data = [{
  type: '优秀',
  value: 20
}, {
  type: '良好',
  value: 18
}, {
  type: '中',
  value: 32
}, {
  type: '及格',
  value: 15
}, {
  type: '其他',
  value: 15
}]
export default {
  name: 'MyScore',
  created() {
    this.getMyScoreInfo()
  },
  data() {
    return {
      data: data,
      // 分数信息
      score: {}
    }
  },
  methods: {
    // 获取成绩信息
    async getMyScoreInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/statistics/student/allScore')
      if (res.meta.code !== 200) {
        this.$message.error('成绩查询失败!')
      } else {
        this.score = res.data
      }
    }
  }
}
</script>

<style Lang="less" scoped>
.card_header{
  margin-bottom: 15px;
  font-size: 17px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
</style>
