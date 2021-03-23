<template>
 <div>
 <!--    面包屑导航区域-->
   <el-breadcrumb separator-class="el-icon-arrow-right">
     <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
     <el-breadcrumb-item>过程监督</el-breadcrumb-item>
     <el-breadcrumb-item>我的任务</el-breadcrumb-item>
   </el-breadcrumb>
<!--   内容卡片区-->
   <el-card class="outer_card">
<!--      页面标题-->
     <el-row type="flex" justify="center" class="page_title">我的阶段任务</el-row>
<!--     表格区-->
     <el-row type="flex" justify="center">
       <el-table
         :highlight-current-row="true"
         :data="taskInfo"
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
         <!--          开始时间-->
         <el-table-column
           sortable
           :show-overflow-tooltip="true"
           prop="startTime"
           label="开始时间"
           width="120">
         </el-table-column>
         <!--          截止时间-->
         <el-table-column
           sortable
           :show-overflow-tooltip="true"
           prop="endTime"
           label="截止时间"
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
             <!--              查看详细内容-->
             <el-tooltip class="item" effect="dark" content="查看详细内容" placement="top" :enterable="false">
               <el-button type="primary" icon="el-icon-view" circle size="mini" @click="viewTaskDetail(scope.row)"></el-button>
             </el-tooltip>
             <!--              进行任务提交-->
             <el-tooltip class="item" effect="dark" content="进行提交" placement="top" :enterable="false">
               <el-button type="danger" icon="el-icon-edit" circle size="mini" @click="viewSubmitTask(scope.row)"></el-button>
             </el-tooltip>
           </template>
         </el-table-column>
       </el-table>
     </el-row>
<!--     分页区-->
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
<!--     任务详情抽屉-->
     <el-drawer
       size="50%"
       :visible.sync="taskDetailDrawerVisible"
       :direction="'rtl'">
       <div style="margin-left: 20px">
         <el-row type="flex" justify="center" style="font-weight: bold; font-size: 20px">任务详情</el-row>
         <div class="divider"></div>
         <!--        任务名称-->
         <el-row type="flex" align="middle">
           <el-col :span="4" class="form_label">任务名称：</el-col>
           <el-col :span="16">
             <el-input size="medium" v-model="currentTask.taskName"></el-input>
           </el-col>
         </el-row>
         <div class="divider"></div>
         <!--        开始时间-->
         <el-row type="flex" align="middle">
           <el-col :span="4" class="form_label">开始时间：</el-col>
           <el-col :span="16">
             <el-input v-model="currentTask.startTime" size="medium"></el-input>
           </el-col>
         </el-row>
         <div class="divider"></div>
         <!--        截止时间-->
         <el-row type="flex" align="middle">
           <el-col :span="4" class="form_label">截止时间：</el-col>
           <el-col :span="16">
             <el-input v-model="currentTask.endTime" size="medium"></el-input>
           </el-col>
         </el-row>
         <div class="divider"></div>
         <!--        任务要求及描述-->
         <el-row type="flex" align="middle">
           <el-col :span="4" class="form_label">任务描述：</el-col>
           <el-col :span="16">
             <el-input
               type="textarea"
               :autosize="{ minRows: 4}"
               v-model="currentTask.description">
             </el-input>
           </el-col>
         </el-row>
         <div class="divider"></div>
         <!--        相关附件-->
         <el-row type="flex" justify="center" style="font-weight: bold; font-size: 20px">相关附件</el-row>
         <div class="divider"></div>
         <el-row type="flex" justify="center">
           <Downloader :doc-id="downloadDocId"></Downloader>
         </el-row>
       </div>
     </el-drawer>
<!--     任务提交抽屉-->
     <el-drawer
       size="50%"
       :visible.sync="taskSubmitDrawerVisible"
       :direction="'rtl'">
       <div class="drawer_title" slot="title">
         提交任务
       </div>
       <div style="margin-left: 20px">
         <!--        任务名称-->
         <el-row type="flex" align="middle">
           <el-col :span="4" class="form_label">任务名称：</el-col>
           <el-col :span="16">
             <el-input size="medium" v-model="currentTask.taskName"></el-input>
           </el-col>
         </el-row>
         <div class="divider"></div>
         <!--        开始时间-->
         <el-row type="flex" align="middle">
           <el-col :span="4" class="form_label">开始时间：</el-col>
           <el-col :span="16">
             <el-input v-model="currentTask.startTime" size="medium"></el-input>
           </el-col>
         </el-row>
         <div class="divider"></div>
         <!--        截止时间-->
         <el-row type="flex" align="middle">
           <el-col :span="4" class="form_label">截止时间：</el-col>
           <el-col :span="16">
             <el-input v-model="currentTask.endTime" size="medium"></el-input>
           </el-col>
         </el-row>
         <div class="divider"></div>
         <!--         填写任务总结-->
         <el-row type="flex" align="middle">
           <el-col :span="4" class="form_label">任务总结：</el-col>
           <el-col :span="16">
             <el-input
               type="textarea"
               :autosize="{ minRows: 4}"
               placeholder="请输入对本次任务的总结"
               v-model="taskSubmitInfo.summary">
             </el-input>
           </el-col>
         </el-row>
         <div class="divider"></div>
         <!--        发布任务表单-->
         <el-row type="flex" align="middle" justify="center">
           <el-popconfirm
             @confirm="submitTaskForm"
             title="确定要提交本次任务吗？">
             <el-button type="primary" slot="reference" plain>提交任务回执</el-button>
           </el-popconfirm>
         </el-row>
         <el-divider></el-divider>
         <!--        上传附件-->
         <el-row type="flex" justify="center" style="font-weight: bold; font-size: 20px">上传附件</el-row>
         <div class="divider"></div>
         <el-row type="flex" justify="center">
           <el-popconfirm
             @confirm="uploaderVisible=true"
             title="上传附件前请确认已发布阶段任务！">
             <el-button slot="reference" type="success" plain>上传附件</el-button>
           </el-popconfirm>
         </el-row>
       </div>
     </el-drawer>
<!--    上传附件对话框-->
     <el-dialog
       title="上传附件"
       :visible.sync="uploaderVisible"
       width="30%">
       <uploader :doc-id="uploadDocId"></uploader>
       <span slot="footer" class="dialog-footer">
        <el-button type="primary" plain @click="uploaderVisible = false">确 定</el-button>
      </span>
     </el-dialog>
   </el-card>
 </div>
</template>

<script>
import Uploader from '@/plugins/upload-download/Uploader'
import Downloader from '@/plugins/upload-download/Downloader'
export default {
  name: 'MyTask',
  components: { Downloader, Uploader },
  mounted() {
    this.getTaskInfo()
  },
  data() {
    return {
      // 阶段任务信息
      taskInfo: [],
      // 分页参数
      queryInfo: {
        page: 1,
        size: 5
      },
      // 页数
      totalPageNum: 0,
      // 当前任务详情
      currentTask: {},
      // 任务提交表单内容
      taskSubmitInfo: {
        taskId: null,
        summary: ''
      },
      // 任务详情抽屉可见性
      taskDetailDrawerVisible: false,
      // 任务提交抽屉可见性
      taskSubmitDrawerVisible: false,
      // 上传附件对话框可见性
      uploaderVisible: false,
      // 查看任务详情时，该任务的DocID，用于下载
      downloadDocId: '',
      // 提交任务时，该任务提交的DocId，用于上传
      uploadDocId: ''
    }
  },
  methods: {
    // 获取阶段任务
    async getTaskInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/stage/task', { params: this.queryInfo })
      if (res.meta.code === 200) {
        this.taskInfo = res.data.records
        this.totalPageNum = res.data.total
      } else {
        this.$message.error('获取阶段任务信息失败!')
      }
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.getTaskInfo()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.page = newPage
      this.getTaskInfo()
    },
    // 查看任务详情
    viewTaskDetail(row) {
      this.currentTask = row
      this.downloadDocId = row.docId
      this.taskDetailDrawerVisible = true
    },
    // 进入提交阶段任务抽屉
    viewSubmitTask(row) {
      this.currentTask = row
      this.downloadDocId = row.docId
      this.taskSubmitInfo.taskId = row.taskId
      this.taskSubmitDrawerVisible = true
    },
    // 提交任务表单上传
    async submitTaskForm() {
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/stage/task/result', this.taskSubmitInfo)
      if (res.meta.code === 200) {
        this.$notify.success(res.meta.message)
        // 更新docId
        this.uploadDocId = res.data
      } else {
        this.$notify.error(res.meta.message)
      }
    },
    // 筛选任务状态
    filterStatus(value, row) {
      return row.status === value
    },
    // 筛选任务阶段
    filterStage(value, row) {
      return row.stage === value
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
/*外层卡片*/
.outer_card{
  padding: 50px;
}
/*抽屉标题*/
.drawer_title{
  font-size: 20px;
  font-weight: bold;
  text-align: center;
}
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
