<template>
  <div>
<!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>过程监督</el-breadcrumb-item>
      <el-breadcrumb-item>审核任务</el-breadcrumb-item>
    </el-breadcrumb>
<!--      页面标题-->
    <el-row type="flex" justify="center" class="page_title">审核阶段任务</el-row>
<!--    内容卡片区-->
    <el-row type="flex" justify="center">
      <el-card class="outer_card">
<!--        表格-->
        <el-table
          :highlight-current-row="true"
          :data="submitInfo"
          size="medium "
          :default-sort = "{prop: 'date', order: 'descending'}"
          style="width: 100%; font-size: 15px">
          <!--          任务名称-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="taskName"
            label="任务名称"
            width="200">
          </el-table-column>
          <!--          学生姓名-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="studentName"
            label="学生姓名"
            width="120">
          </el-table-column>
          <!--          提交轮次-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="retries"
            label="提交轮次"
            width="120">
          </el-table-column>
          <!--          所属阶段-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="status"
            width="100"
            :filters="[{ text: '开题', value: 'KT' }, { text: '中期', value: 'ZQ' }, { text: '结题', value: 'JT' }]"
            :filter-method="filterStage"
            filter-placement="bottom-end"
            label="所属阶段">
            <template slot-scope="scope">
              <el-tag type="info" v-if=" scope.row.stage == 'KT'">开题</el-tag>
              <el-tag type="primary" v-if=" scope.row.stage == 'ZQ'">中期</el-tag>
              <el-tag type="success" v-if=" scope.row.stage == 'JT'">结题</el-tag>
            </template>
          </el-table-column>
          <!--          任务状态-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="status"
            width="120"
            :filters="[{ text: '未提交', value: 'WTJ' }, { text: '待审核', value: 'DSH' }, { text: '已通过', value: 'YTG' }, { text: '未通过', value: 'WTG' }]"
            :filter-method="filterStatus"
            filter-placement="bottom-end"
            label="任务状态">
            <template slot-scope="scope">
              <el-tag type="warning" v-if=" scope.row.status == 'WTJ'">未提交</el-tag>
              <el-tag type="info" v-if=" scope.row.status == 'DSH'">待审核</el-tag>
              <el-tag type="success" v-if=" scope.row.status == 'YTG'">已通过</el-tag>
              <el-tag type="danger" v-if=" scope.row.status == 'WTG'">未通过</el-tag>
            </template>
          </el-table-column>
          <!--          操作-->
          <el-table-column
            :show-overflow-tooltip="true"
            width="200"
            label="操作">
            <template slot-scope="scope">
              <!--              进行审核-->
              <el-tooltip class="item" effect="dark" content="进行审核" placement="top" :enterable="false">
                <el-button type="danger" icon="el-icon-edit" circle size="mini" @click="viewSubmitTask(scope.row)"></el-button>
              </el-tooltip>
            </template>
          </el-table-column>
        </el-table>
<!--        分页-->
        <el-row type="flex" justify="center" style="margin-top: 20px; margin-left: 20px">
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="queryInfo.page"
            :page-sizes="[5, 10, 20]"
            :page-size="queryInfo.size"
            layout="total, sizes, prev, pager, next, jumper"
            :total="totalPageNum">
          </el-pagination>
        </el-row>
      </el-card>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'JudgeTaskSubmit',
  mounted() {
    this.getSubmitInfo()
  },
  data() {
    return {
      // 学生阶段任务提交信息
      submitInfo: [],
      // 分页参数
      queryInfo: {
        page: 1, // 当前页面
        size: 5 // 页大小
      },
      // 页数
      totalPageNum: Number
    }
  },
  methods: {
    // 获取学生提交信息
    async getSubmitInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/stage/task/result', this.queryInfo)
      if (res.meta.code === 200) {
        this.totalPageNum = res.data.total
        this.submitInfo = res.data.records
      } else {
        this.$message.error(res.meta.message)
      }
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.getSubmitInfo()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.page = newPage
      this.getSubmitInfo()
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
/*卡片*/
.el-card{
  width: 90%;
  border-radius: 18px;
  background: #ffffff;
  box-shadow:  5px 5px 10px #ededed,
    -5px -5px 10px #ffffff;
}
</style>
