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
                <div style="text-align: center">答辩表现</div>
<!--                答辩表现未出-->
                <el-row type="flex" justify="center" v-if="score.startPleaScore == undefined">
                  <el-tag type="info">
                    答辩得分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--                答辩表现已出-->
                <el-row v-else>
                  <a-progress
                    style="margin-bottom: 10px"
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.startPleaScore"
                    status="active"
                    :format="percent => `${percent} 分`"/>
                </el-row>
                <div style="text-align: center">开题材料</div>
<!--                开题材料未出-->
                <el-row type="flex" justify="center" v-if="score.startMaterialScore == undefined">
                  <el-tag type="info">
                    开题材料得分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--                开题材料已出-->
                <el-row v-else>
                  <a-progress
                    style="margin-bottom: 10px"
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.startMaterialScore"
                    status="active"
                    :format="percent => `${percent} 分`"/>
                </el-row>
                <div style="text-align: center">总分</div>
<!--                开题总分未出-->
                <el-row type="flex" justify="center" v-if="score.startScore == undefined">
                  <el-tag type="info">
                    开题阶段总分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--                开题总分已出-->
                <el-row v-else>
                  <a-progress
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.startScore"
                    status="active"
                    :format="percent => `${percent} 分`"/>
                </el-row>
              </el-col>
<!--              超过年级百分比-->
              <el-col :span="10" style="margin-top: 3px">
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',}"
                  :percent="statistics.startGreaterThan*100"/>
                <div style="font-weight: bold; display: flex; justify-content: center">您超越了年级<br>{{statistics.startGreaterThan*100}}%的小伙伴</div>
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
                <div style="text-align: center">答辩表现</div>
<!--                中期答辩未出-->
                <el-row v-if="score.middlePleaScore == undefined" type="flex" justify="center">
                  <el-tag type="info">
                    答辩得分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--                中期答辩已出-->
                <el-row v-else>
                  <a-progress
                    style="margin-bottom: 10px"
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.middlePleaScore"
                    status="active"
                    :format="percent => `${percent} 分`"/>
                </el-row>
                <div style="text-align: center">中期材料</div>
<!--                中期材料未出-->
                <el-row v-if="score.middleMaterialScore == undefined" type="flex" justify="center">
                  <el-tag type="info">
                    中期报告得分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--                中期材料已出-->
                <el-row v-else>
                  <a-progress
                    style="margin-bottom: 10px"
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.middleMaterialScore"
                    status="active"
                    :format="percent => `${percent} 分`"/>
                </el-row>
                <div style="text-align: center">总分</div>
<!--                中期总分未出-->
                <el-row v-if="score.middleScore == undefined" type="flex" justify="center">
                  <el-tag type="info">
                    中期阶段总分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--               中期总分已出-->
                <el-row v-else>
                  <a-progress
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.middleScore"
                    status="active"
                    :format="percent => `${percent} `"/>
                </el-row>
              </el-col>
              <!--              超越年级-->
              <el-col :span="10" style="margin-top: 3px">
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',}"
                  :percent="statistics.midGreaterThan*100"/>
                <div style="font-weight: bold; display: flex; justify-content: center">您超越了年级<br>{{statistics.midGreaterThan*100}}%的小伙伴</div>
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
                <div style="text-align: center">总分</div>
<!--                阶段任务成绩未出-->
                <el-row v-if="score.procedureScore == undefined" type="flex" justify="center">
                  <el-tag type="info">
                    中期阶段总分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--                阶段任务成绩已出-->
                <el-row v-else>
                  <a-progress
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.procedureScore"
                    status="active"
                    :format="percent => `${percent} 分`"/>
                </el-row>
              </el-col>
              <!--              超越年级-->
              <el-col :span="10" style="margin-top: 3px">
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',}"
                  :percent="statistics.stageTaskGreaterThan*100"/>
                <div style="font-weight: bold; display: flex; justify-content: center">您超越了年级<br>{{statistics.stageTaskGreaterThan*100}}%的小伙伴</div>
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
                <div style="text-align: center">答辩表现</div>
<!--                结题答辩成绩未出-->
                <el-row v-if="score.endPleaScore == undefined" type="flex" justify="center">
                  <el-tag type="info">
                    结题答辩得分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--                结题答辩成绩已出-->
                <el-row v-else>
                  <a-progress
                    style="margin-bottom: 10px"
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.endPleaScore"
                    status="active"
                    :format="percent => `${percent} 分`"/>
                </el-row>
                <div style="text-align: center">毕业论文</div>
<!--                毕业论文得分未出-->
                <el-row v-if="score.endMaterialScore == undefined" type="flex" justify="center">
                  <el-tag type="info">
                    毕业论文得分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--                毕业论文得分已出-->
                <el-row v-else>
                  <a-progress
                    style="margin-bottom: 10px"
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.endMaterialScore"
                    status="active"
                    :format="percent => `${percent} 分`"/>
                </el-row>
                <div style="text-align: center">总分</div>
<!--                结题阶段总分未出-->
                <el-row v-if="score.endScore == undefined" type="flex" justify="center">
                  <el-tag type="info">
                    结题阶段总分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
                <el-row v-else>
                  <a-progress
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="score.endScore"
                    status="active"
                    :format="percent => `${percent} 分`"/>
                </el-row>
              </el-col>
              <!--              超越比例-->
              <el-col :span="10" style="margin-top: 3px">
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',}"
                  :percent="statistics.finGreaterThan*100"/>
                <div style="font-weight: bold; display: flex; justify-content: center">您超越了年级<br>{{statistics.finGreaterThan*100}}%的小伙伴</div>
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
<!--                总分未出-->
                <el-row v-if="score.totalScore == undefined" type="flex" justify="center">
                  <el-tag type="info">
                    总分暂未发布
                    <a-icon type="exclamation" />
                  </el-tag>
                </el-row>
<!--                总分已出-->
                <el-row v-else>
                  <a-progress style="margin-left: 10%"
                              strokeWidth="15"
                              :stroke-color="{from: '#a548f6',to: '#f098fa',}"
                              :percent="score.totalScore"
                              status="active"
                              :format="percent => `${percent} 分`"/>
                </el-row>
              </el-col>
<!--              统计信息-->
              <el-col :span="13">
                <el-col :span="8">
                  <a-progress
                    style="display: flex; justify-content: center"
                    type="circle"
                    :stroke-color="{
                      '0%': '#8566f6',
                      '100%': '#3a7bff',
                        }"
                    :percent="statistics.totalGreaterThan*100"
                    :format="percent => `${percent} `"/>
                  <div style="font-weight: bold; display: flex; justify-content: center; margin-bottom: 15px">您超越年级{{statistics.totalGreaterThan*100}}%的同学</div>
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
      score: {},
      statistics: {}
    }
  },
  methods: {
    // 获取成绩信息
    async getMyScoreInfo() {
      const { data: res } = await this.$http.get('/statistics/student/allScore')
      if (res.meta.code !== 200) {
        this.$message.error(res.meta.message)
      } else {
        this.score = res.data
        this.statistics = res.data.statistics
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
