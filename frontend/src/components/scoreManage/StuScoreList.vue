<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>成绩管理</el-breadcrumb-item>
      <el-breadcrumb-item>成绩列表</el-breadcrumb-item>
    </el-breadcrumb>
    <!--卡片视图区-->
    <el-card class="el-card">
      <!--搜索区-->
      <el-row :gutter="20">
        <el-col :span="7">
          <el-input placeholder="请输入关键词查询学生成绩信息">
            <el-button slot="append" icon="el-icon-search"></el-button>
          </el-input>
        </el-col>
        <el-col :span="4"></el-col>
      </el-row>
      <!--      表格区-->
      <el-row>
        <el-table
          :data="studentList"
          size="medium "
          :default-sort = "{prop: 'date', order: 'descending'}"
          style="width: 100%; font-size: 15px">
          <!--          课题名称-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="stuName"
            label="学生名字"
            width="170">
          </el-table-column>
          <el-table-column
            sortable
            :show-overflow-tooltip="true"
            prop="subName"
            label="课题名称"
            width="200">
          </el-table-column>
          <!--        课题类型-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="zone"
            label="课题类型"
            width="200"
            :filters="[{ text: '科学探索与技术创新', value: 'KXTS' }, { text: '生命关怀与社会认知', value: 'SMGH' }, { text: '哲学智慧与创新思维', value: 'ZXZH' }]"
            :filter-method="filterType"
            filter-placement="bottom-end">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.zone=='KXTS'" type="primary">科学探索与技术创新</el-tag>
              <el-tag v-if="scope.row.zone=='SMGH'" type="success">生命关怀与社会认知</el-tag>
              <el-tag v-if="scope.row.zone=='ZXTS'" type="danger">哲学智慧与创新思维</el-tag>
            </template>
          </el-table-column>
          <!--          总成绩-->
          <el-table-column
            prop="endScore"
            label="总成绩"
            width="100">
          </el-table-column>
          <!--          操作-->
          <el-table-column
            :show-overflow-tooltip="true"
            width="200"
            label="操作">
            <template slot-scope="scope">
              <!--              查看详细成绩-->
              <el-tooltip class="item" effect="dark" content="查看详细成绩" placement="top" :enterable="false">
                <el-button type="danger" icon="el-icon-apple" circle size="mini" @click="viewStuScore(scope.row)"></el-button>
              </el-tooltip>
            </template>
          </el-table-column>
        </el-table>
      </el-row>
      <!--      分页区-->
      <el-row>
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="queryInfo.page"
          :page-sizes="[5, 10, 20]"
          :page-size="100"
          layout="total, sizes, prev, pager, next, jumper"
          :total="totalPageNum">
        </el-pagination>
      </el-row>
    </el-card>
    <!--    查看课题详情对话框-->
    <el-dialog
      :visible.sync="viewPageVisible"
      width="60%">
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
                    :percent="currentScoreInfo.startPleaScore"
                    status="active"
                    :format="percent => `${percent} 分`"
                  />
                  <div>开题材料</div>
                  <a-progress
                    style="margin-bottom: 10px"
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="currentScoreInfo.startMaterialScore"
                    status="active"
                    :format="percent => `${percent} 分`"
                  />
                  <div>总分</div>
                  <a-progress
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="currentScoreInfo.startScore"
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
                    :percent="currentScoreInfo.middlePleaScore"
                    status="active"
                    :format="percent => `${percent} 分`"
                  />
                  <div>中期材料</div>
                  <a-progress
                    style="margin-bottom: 10px"
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="currentScoreInfo.middleMaterialScore"
                    status="active"
                    :format="percent => `${percent} 分`"
                  />
                  <div>总分</div>
                  <a-progress
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="currentScoreInfo.middleScore"
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
                    :percent="currentScoreInfo.procedureScore"
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
                    :percent="currentScoreInfo.endPleaScore"
                    status="active"
                    :format="percent => `${percent} 分`"
                  />
                  <div>结题材料</div>
                  <a-progress
                    style="margin-bottom: 10px"
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="currentScoreInfo.endMaterialScore"
                    status="active"
                    :format="percent => `${percent} 分`"
                  />
                  <div>总分</div>
                  <a-progress
                    :stroke-color="{from: '#108ee9',to: '#87d068',}"
                    :percent="currentScoreInfo.endScore"
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
                              :percent="currentScoreInfo.totalScore"
                              status="active"
                              :format="percent => `${percent} 分`"
                  />
                </el-col>
                <!--              统计信息-->
                <el-col :span="13" style="margin-left: 20%" >
                  <el-col :span="8">
                    <a-progress
                      style="display: flex; justify-content: center; padding-top: 25%"
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
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewPageVisible = false">退出查看</el-button>
      </span>
    </el-dialog>
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
  name: 'checkSubjects',
  data() {
    return {
      data: data,
      // 查看分数
      score: {
        fileScore: 0, // 材料分数
        // defenseScore: 0, // 答辩分数
        total: 0 // 总分
      },
      // 查看详情的课题信息
      currentScoreInfo: {},
      // （符合要求）课题总数
      totalPageNum: 0,
      // 获取课题列表
      queryInfo: {
        status: '', // 需要查询的通知记录状态（1-待审核，2-已通过，3-未通过）, 不发送则返回所有类型
        keyWord: '', // 关键词
        page: 1, // 当前页号
        size: 10, // 页面大小
        type: '' // 通知类型（1-学业通知， 2-答辩安排， 3-工作安排）
      },
      studentList: [],
      total: 0,
      // 查看详情对话框可见性
      viewPageVisible: false
    }
  },
  created() {
    this.getStudentList()
  },
  methods: {
    async getStudentList() {
      const { data: res } = await this.$http.get('http://localhost:9528/statistics/teacher/allScore', { params: this.queryInfo })
      if (res.meta.code !== 200) {
        return this.$message.error('获取课题列表失败')
      }
      this.studentList = res.data.records
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.getSubjectList()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.page = newPage
      this.getSubjectList()
    },
    // 筛选课题类型
    filterType(value, row) {
      return row.type === value
    },
    // 筛选课题状态
    filterStatus(value, row) {
      return row.status === value
    },
    // 查看成绩详情
    viewStuScore(row) {
      this.viewPageVisible = true
      this.currentScoreInfo = row
    }
  }
}
</script>

<style Lang="less" scoped>
.el-card{
  box-shadow: 0 1px 1px rgba(0,0,0, 0.15) !important
}
/*表格状态颜色*/
.el-table .warning-row {
  background: oldlace;
}
/*表格状态颜色*/
.el-table .success-row {
  background: #f0f9eb;
}
.card_header{
  margin-bottom: 15px;
  font-size: 17px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
</style>
