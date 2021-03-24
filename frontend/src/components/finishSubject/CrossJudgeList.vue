<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>结题管理</el-breadcrumb-item>
      <el-breadcrumb-item>交叉评审</el-breadcrumb-item>
    </el-breadcrumb>
    <!--    页面标题-->
    <el-row class="page_header">
      论文交叉评审
    </el-row>
    <!--卡片视图区-->
    <el-row  type="flex" justify="center">
      <el-card class="el-card">
        <!--      表格区-->
        <el-row>
          <el-table
            :data="paperlist"
            size="medium "
            :default-sort = "{prop: 'date', order: 'descending'}"
            style="width: 100%; font-size: 15px">
            <!--          待评审学生-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="thesisId"
              label="学生Id(匿名)"
              width="120">
            </el-table-column>
            <!--          课题名称-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="subject.subName"
              label="课题名称"
              width="250">
            </el-table-column>e
            <!--         课题领域-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="subject.zone"
              width="180"
              :filters="[{ text: '科学探索与技术创新', value: 'KXTS' }, { text: '生命关怀与社会认知', value: 'SMGH' }, { text: '哲学智慧与创新思维', value: 'ZXZH' }]"
              :filter-method="filterStatus"
              filter-placement="bottom-end"
              label="评审状态">
              <template slot-scope="scope">
                <el-tag type="success" v-if=" scope.row.subject.zone == 'KXTS'">科学探索与技术创新</el-tag>
                <el-tag type="warning" v-if=" scope.row.subject.zone == 'SMGH'">生命关怀与社会认知</el-tag>
                <el-tag type="danger" v-if=" scope.row.subject.zone == 'ZXZH'">哲学智慧与创新思维</el-tag>
              </template>
            </el-table-column>
            <!--          操作-->
            <el-table-column
              :show-overflow-tooltip="true"
              width="120"
              label="操作">
              <template slot-scope="scope">
                <!--              下载论文附件-->
                <el-tooltip class="item" effect="dark" content="下载论文附件" placement="top" :enterable="false">
                  <el-button type="primary" icon="el-icon-paperclip" circle size="mini" @click="downloadPaper(scope.row)"></el-button>
                </el-tooltip>
                <!-- 给学生反馈信息-->
                <el-tooltip class="item" effect="dark" content="给学生反馈信息" placement="top" :enterable="false">
                  <el-button type="success" icon="el-icon-chat-line-square" circle size="mini" @click="editFeedback(scope.row)"></el-button>
                </el-tooltip>
              </template>
            </el-table-column>
          </el-table>
        </el-row>
        <!--      分页区-->
        <el-row type="flex" justify="center" style="margin-top: 10px">
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
    <!--    给学生反馈信息抽屉-->
    <el-dialog
      title="毕业设计论文评分"
      :visible.sync="drawer"
      size="50%">
      <el-row class="drawer-bg">
        <el-form ref="form" :model="feedBack" label-width="80px">
          <el-row>
            <el-col style="padding: 40px">
              <el-card class="feedBackCard">
                <el-row>
                  <el-col :span="10" class="item_label"><span class="card_header">评审打分表</span></el-col>
                </el-row>
                <el-col>
                  <div class="block">
                    <el-slider
                      v-model="feedBack.score"
                      show-input>
                    </el-slider>
                  </div>
                </el-col>
                <el-col>
                  <el-form-item label="开题结果">
                    <el-radio-group v-model="feedBack.status">
                      <el-radio label="YTG">通过审核</el-radio>
                      <el-radio label="WTG">不通过</el-radio>
                    </el-radio-group>
                  </el-form-item>
                </el-col>
              </el-card>
            </el-col>
          </el-row>
          <el-row type="flex" justify="center">
            <el-popconfirm
              @confirm="feedBackSubmit"
              title="成绩仅允许提交一次，确认提交吗？">
            <el-button style="margin-right: 20px" slot="reference" type="success">立即提交</el-button>
            </el-popconfirm>
          </el-row>
        </el-form>
      </el-row>
    </el-dialog>
<!--    下载论文对话框-->
    <!--    查看答辩申请及毕业论文-->
    <el-dialog
      :visible.sync="viewReportVisible"
      width="50%">
      <el-row type="flex" justify="center" style="font-size: 20px; font-weight: bold; margin-bottom: 20px">毕业论文下载</el-row>
      <el-divider>毕业论文</el-divider>
      <el-row type="flex" justify="center">
        <Downloader :doc-id="docId"></Downloader>
      </el-row>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewReportVisible = false">退出查看</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import Downloader from '@/plugins/upload-download/Downloader'
export default {
  name: 'CrossJudgeList',
  components: { Downloader },
  data() {
    return {
      viewReportVisible: false,
      // （符合要求）课题总数
      totalPageNum: 0,
      // 获取报告列表
      queryInfo: {
        status: '', // 需要查询的通知记录状态（1-待审核，2-已通过，3-未通过）, 不发送则返回所有类型
        keyWord: '', // 关键词
        page: 1, // 当前页号
        size: 10, // 页面大小
        type: '' // 通知类型（1-学业通知， 2-答辩安排， 3-工作安排）
      },
      paperlist: [], // 开题报告列表信息
      total: 0,
      feedBack: {
        comment: '',
        score: 0,
        status: '',
        id: 0
      },
      // 反馈抽屉可见性
      drawer: false,
      docId: ''
    }
  },
  created() {
    this.getPaperList()
  },
  methods: {
    async getPaperList() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/thesisGroup/teacher')
      if (res.meta.code !== 200) {
        this.$message.error('获取评审列表失败')
      } else {
        this.paperlist = res.data
      }
    },
    downloadPaper(row) {
      this.viewReportVisible = true
      this.docId = row.docId
    },
    // 提交表单
    async feedBackSubmit() {
      this.drawer = false
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/thesisGroup/teacher', this.feedBack)
      if (res.meta.code !== 200) this.$message.error('提交打分信息失败，请勿重复打分！')
      else this.$message.success('提交反馈信息成功！')
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.getSubjectInfo()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.page = newPage
      this.getSubjectInfo()
    },
    // 筛选课题类型
    filterType(value, row) {
      return row.type === value
    },
    // 筛选报告状态
    filterStatus(value, row) {
      return row.status === value
    },
    // 编辑反馈表单
    editFeedback(row) {
      this.feedBack.id = row.id
      this.drawer = true
    }
    // // 调用富文本编辑器
    // useQuillEditor() {
    //   this.quillEditorVisible = true
    // },
    // // 重置富文本编辑框
    // resetQuillEditorContent() {
    //   this.$refs.quillEditor.reset()
    //   this.feedBack.comment = '请输入反馈信息'
    //   this.quillEditorVisible = false
    // },
    // // 提交（采用）富文本编辑器框
    // submitQuillEditorContent() {
    //   this.feedBack.comment = this.$refs.quillEditor.returnContent()
    //   this.quillEditorVisible = false
    // }
  }
}
</script>

<style Lang="less" scoped>
/*页面标题*/
.page_header {
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 20px;
}
.el-card{
  box-shadow: 0 1px 1px rgba(0,0,0, 0.15) !important;
  padding-left: 40px;
  width: 80%;
}
/*表格状态颜色*/
.el-table .warning-row {
  background: oldlace;
}
/*表格状态颜色*/
.el-table .success-row {
  background: #f0f9eb;
}
.drawer-bg{
  height: 90%;
  border-radius: 24px;
  background: #f0f0f0;
  box-shadow:  20px 20px 32px #959595,
    -20px -20px 32px #ffffff;
}
.feedBackCard{
  display: flex;
  justify-content: center;
}
.card_header{
  margin-bottom: 10px;
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
</style>
