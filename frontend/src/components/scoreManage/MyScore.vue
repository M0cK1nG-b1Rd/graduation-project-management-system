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
        <el-col :span="10" style="margin-left: 3%">
          <div class="card_header">开题成绩</div>
          <el-card style="margin-left: 10px">
            <el-row>
              <el-col :span="10">
            <div>答辩表现</div>
            <a-progress
              style="margin-bottom: 10px"
              :stroke-color="{from: '#108ee9',to: '#87d068',}"
              :percent="score.defenseScore"
              status="active"
              :format="percent => `${percent} 分`"
            />
            <div>开题材料</div>
            <a-progress
              style="margin-bottom: 10px"
              :stroke-color="{from: '#108ee9',to: '#87d068',}"
              :percent="score.fileScore"
              status="active"
              :format="percent => `${percent} 分`"
            />
            <div>总分</div>
            <a-progress
              :stroke-color="{from: '#108ee9',to: '#87d068',}"
              :percent="85"
              status="active"
              :format="percent => `${percent} 分`"
            />
              </el-col>
<!--              统计-->
              <el-col :span="10" style="margin-top: 3px">
                <div style="font-weight: bold; display: flex; justify-content: center">统计</div>
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',
                      }"
                  :percent="90"
                  :format="percent => `${percent} `"
                />
              </el-col>
            </el-row>
          </el-card>
        </el-col>
        <el-col :span="10" style="margin-left: 10%">
          <div class="card_header">中期成绩</div>
          <el-card style="margin-left: 10px">
            <el-row>
              <el-col :span="10">
                <div>答辩表现</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.defenseScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>开题材料</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.fileScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>总分</div>
                <a-progress
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="85"
                  status="active"
                  :format="percent => `${percent} `"
                />
              </el-col>
              <!--              统计-->
              <el-col :span="10" style="margin-top: 3px">
                <div style="font-weight: bold; display: flex; justify-content: center">统计</div>
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',
                      }"
                  :percent="90"
                  :format="percent => `${percent} `"
                />
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
      <!--      阶段，结题成绩卡-->
      <el-row>
        <el-col :span="10" style="margin-left: 3%">
          <div class="card_header">阶段成绩</div>
          <el-card style="margin-left: 10px">
            <el-row>
              <el-col :span="10">
                <div>总分</div>
                <a-progress
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="85"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
              </el-col>
              <!--              统计-->
              <el-col :span="10" style="margin-top: 3px">
                <div style="font-weight: bold; display: flex; justify-content: center">统计</div>
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',
                      }"
                  :percent="90"
                  :format="percent => `${percent} `"
                />
              </el-col>
            </el-row>
          </el-card>
        </el-col>
        <el-col :span="10" style="margin-left: 10%">
          <div class="card_header">结题成绩</div>
          <el-card style="margin-left: 10px">
            <el-row>
              <el-col :span="10">
                <div>答辩表现</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.defenseScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>开题材料</div>
                <a-progress
                  style="margin-bottom: 10px"
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="score.fileScore"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
                <div>总分</div>
                <a-progress
                  :stroke-color="{from: '#108ee9',to: '#87d068',}"
                  :percent="85"
                  status="active"
                  :format="percent => `${percent} 分`"
                />
              </el-col>
              <!--              统计-->
              <el-col :span="10" style="margin-top: 3px">
                <div style="font-weight: bold; display: flex; justify-content: center">统计</div>
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#fcce56',
                    '100%': '#fa312a',
                      }"
                  :percent="90"
                  :format="percent => `${percent} `"
                />
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
            <el-row>
            <el-col :span="6" style="margin-top: 6%">
              <div style="font-size: 17px;font-weight: bold; display: flex; justify-content: center; margin-bottom: 15px">总分:</div>
              <a-progress style="margin-left: 10%"
                strokeWidth="15"
                :stroke-color="{from: '#a548f6',to: '#f098fa',}"
                :percent="85"
                status="active"
                :format="percent => `${percent} 分`"
              />
            </el-col>
            <el-col :span="13" style="margin-left: 20%" >
              <el-card style="margin-right: 20%">
              <el-col :span="8">
                <div style="font-weight: bold; display: flex; justify-content: center; margin-bottom: 15px">个人：</div>
                <a-progress
                  style="display: flex; justify-content: center"
                  type="circle"
                  :stroke-color="{
                    '0%': '#8566f6',
                    '100%': '#3a7bff',
                      }"
                  :percent="90"
                  :format="percent => `${percent} `"
                />
              </el-col>
              <el-col :span="14">
              <div style="font-weight: bold; display: flex; margin-left: 50%">年级：</div>
                <v-chart :forceFit="true" height="240" :data="data" >
                  <v-tooltip :showTitle="false"></v-tooltip>
                  <v-legend dataKey="type"></v-legend>
                  <v-coord type="theta" innerRadius="0.75"></v-coord>
                  <v-pie position="value" color="type" shape="sliceShape"></v-pie>
                </v-chart>
              </el-col>
              </el-card>
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
  data() {
    return {
      data: data,
      // 查看分数
      score: {
        fileScore: 0, // 材料分数
        // defenseScore: 0, // 答辩分数
        total: 0 // 总分
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
