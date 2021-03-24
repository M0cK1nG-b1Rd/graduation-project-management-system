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
            width="80">
          </el-table-column>
          <!--          任务总结-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="summary"
            width="150"
            label="任务总结">
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
                <el-button type="danger" icon="el-icon-edit" circle size="mini" @click="beginJudge(scope.row)"></el-button>
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
<!--    批改页面对话框-->
    <el-dialog
      :visible.sync="judgePageVisible"
      width="50%"
      center>
<!--      学生提交内容-->
      <el-row style="font-size: 15px">
        <el-row style="font-size: 18px; font-weight: bold" type="flex" justify="center">学生提交内容</el-row>
        <el-divider></el-divider>
<!--      任务名称-->
        <el-row type="flex" align="middle">
          <el-col :span="5" class="form_label">任务名称：</el-col>
          <el-col :span="16">
            {{currentSubmitInfo.taskName}}
          </el-col>
        </el-row>
        <div class="divider"></div>
<!--      任务描述-->
        <el-row type="flex" align="middle">
          <el-col :span="5" class="form_label">任务描述：</el-col>
          <el-col :span="16">
            {{currentSubmitInfo.description}}
          </el-col>
        </el-row>
        <div class="divider"></div>
<!--      学生总结-->
        <el-row type="flex" align="middle">
          <el-col :span="5" class="form_label">学生总结：</el-col>
          <el-col :span="16">
            {{currentSubmitInfo.summary}}
          </el-col>
        </el-row>
        <div class="divider"></div>
<!--      提交次数-->
        <el-row type="flex" align="middle">
          <el-col :span="5" class="form_label">提交次数：</el-col>
          <el-col :span="16">
            {{currentSubmitInfo.retries}}
          </el-col>
        </el-row>
        <div class="divider"></div>
<!--      相关附件-->
        <el-row type="flex" align="middle">
          <el-col :span="5" class="form_label">相关附件：</el-col>
          <el-col :span="16">
            <Downloader :doc-id="currentSubmitInfo.docId"></Downloader>
          </el-col>
        </el-row>
      </el-row>
      <!--        分割线-->
<!--      教师审核意见-->
      <el-row style="font-size: 15px">
        <div class="divider"></div>
        <div class="divider"></div>
        <el-row style="font-size: 18px; font-weight: bold" type="flex" justify="center">教师审核反馈</el-row>
        <el-divider></el-divider>
        <!--      反馈意见-->
        <el-row type="flex" align="middle">
          <el-col :span="5" class="form_label">反馈意见：</el-col>
          <el-col :span="16">
            <el-input
              type="textarea"
              :autosize="{ minRows: 3}"
              placeholder="请输入内容"
              v-model="currentSubmitInfo.feedback">
            </el-input>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <!--      任务得分-->
        <el-row type="flex" align="middle">
          <el-col :span="5" class="form_label">任务得分：</el-col>
          <el-col :span="2">
            <el-input size="mini" v-model="currentSubmitInfo.score"></el-input>
          </el-col>
          <el-col :span="13" :offset="1">
            <a-progress
              :format="percent => `${percent}分`"
              :stroke-color="{from: '#ffc900', to: '#ff3c00'}"
              :percent="parseInt(currentSubmitInfo.score)"
              status="active"/>
          </el-col>
        </el-row>
        <div class="divider"></div>
        <!--      审核结果-->
        <el-row type="flex" align="middle">
          <el-col :span="5" class="form_label">审核结果：</el-col>
          <el-col :span="16">
            <el-radio-group v-model="currentSubmitInfo.status">
              <el-radio :label="'YTG'">通过</el-radio>
              <el-radio :label="'WTG'">驳回</el-radio>
            </el-radio-group>
          </el-col>
        </el-row>
        <div class="divider"></div>
      </el-row>
<!--      操作按钮-->
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="judgePageVisible = false">取 消</el-button>
          <el-button type="primary" @click="submitJudge">提交</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script>
import Downloader from '@/plugins/upload-download/Downloader'
export default {
  name: 'JudgeTaskSubmit',
  components: { Downloader },
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
      totalPageNum: Number,
      // 批改任务页面对话框可见性
      judgePageVisible: false,
      // 当前评审的任务提交信息
      currentSubmitInfo: {}
    }
  },
  methods: {
    // 获取学生提交信息
    async getSubmitInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/stage/task/handin', { params: this.queryInfo })
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
    },
    // 进入评审页面（对话框）
    beginJudge(row) {
      this.currentSubmitInfo = row
      this.judgePageVisible = true
    },
    // 提交审核结果
    async submitJudge() {
      this.judgePageVisible = false
      const submitData = {}
      submitData.taskId = this.currentSubmitInfo.taskId
      submitData.feedback = this.currentSubmitInfo.feedback
      submitData.score = this.currentSubmitInfo.score
      submitData.status = this.currentSubmitInfo.status
      submitData.retries = this.currentSubmitInfo.retries
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/stage/task/result/score', submitData)
      if (res.meta.code === 200) {
        this.$message.success('提交反馈成功！')
        await this.getSubmitInfo()
      } else {
        this.$message.error('提交反馈失败！')
      }
    },
    // 筛选提交状态
    filterStatus(value, row) {
      return row.status === value
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
/*自定义分割线*/
.divider{
  height: 5px;
}
/*自定义表单的标题*/
.form_label{
  padding-left: 20px;
  font-size: 16px;
  text-align: start;
}
</style>
