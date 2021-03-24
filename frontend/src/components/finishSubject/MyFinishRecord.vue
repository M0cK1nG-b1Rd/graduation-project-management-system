<template>
  <div>
  <!--    面包屑导航区域-->
  <el-breadcrumb separator-class="el-icon-arrow-right">
    <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item>开题管理</el-breadcrumb-item>
    <el-breadcrumb-item>报告记录</el-breadcrumb-item>
  </el-breadcrumb>
<!--    查看我的报告提交记录列表区-->
    <!--卡片视图区-->
    <el-card class="el-card">
      <el-row type="flex" align="middle">
        <el-col :span="18">
    <!--  表格卡片-->
      <el-card>
      <!--      表格区-->
      <el-row type="flex" justify="center">
        <el-card>
          <el-table
            :data="subjectlist"
            size="medium "
            style="width: 100%; font-size: 15px">
            <!--          课题名称-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="subName"
              label="课题名称"
              width="200">
            </el-table-column>
            <!--          申请日期-->
            <el-table-column
              sortable
              :show-overflow-tooltip="true"
              prop="poseTime"
              label="提交日期"
              width="140">
            </el-table-column>
            <!--         报告状态-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="status"
              width="100"
              :filters="[{ text: '待审核', value: 1 }, { text: '已通过', value: 2 }, { text: '未通过', value: 3 }]"
              :filter-method="filterStatus"
              filter-placement="bottom-end"
              label="报告状态">
              <template slot-scope="scope">
                <el-tag type="success" v-if=" scope.row.status == 'YTG'">已通过</el-tag>
                <el-tag type="warning" v-if=" scope.row.status == 'WSH'">待审核</el-tag>
                <el-tag type="danger" v-if=" scope.row.status == 'WTG'">未通过</el-tag>
              </template>
            </el-table-column>
            <!--          操作-->
            <el-table-column
              :show-overflow-tooltip="true"
              width="200"
              label="操作">
              <template slot-scope="scope">
                <!--              查看课题详细内容-->
                <el-tooltip class="item" effect="dark" content="查看课题详细内容" placement="top" :enterable="false">
                  <el-button type="success" icon="el-icon-view" circle size="mini" @click="viewSubject(scope.row)"></el-button>
                </el-tooltip>
                <!--              下载毕业论文-->
                <el-tooltip class="item" effect="dark" content="查看答辩申请及毕业论文" placement="top" :enterable="false">
                  <el-button type="warning" icon="el-icon-s-flag" circle size="mini" @click="viewReport(scope.row)"></el-button>
                </el-tooltip>
                <!--              查看反馈结果-->
                <el-tooltip class="item" effect="dark" content="查看反馈结果" placement="top" :enterable="false">
                  <el-button type="primary" icon="el-icon-message" circle size="mini" @click="viewFeedback(scope.row)"></el-button>
                </el-tooltip>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-row>
      <!--      分页区-->
      <el-row style="margin-top: 10px" type="flex" justify="center">
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
        </el-col>
        <!--      得分区-->
        <el-col :span="6">
          <el-card style="margin-left: 10px">
            <div class="card_header">我的结题成绩</div>
            <div style="text-align: center">答辩表现</div>
            <!--            答辩暂无分数-->
            <el-row type="flex" justify="center" v-if="score.defenseScore == -1">
              <el-tag type="info">
                答辩得分暂未发布
                <a-icon type="exclamation" />
              </el-tag>
            </el-row>
            <!--            答辩已有分数-->
            <el-row v-else>
              <a-progress
                style="margin-bottom: 10px"
                :stroke-color="{from: '#108ee9',to: '#87d068',}"
                :percent="score.defenseScore"
                status="active"
                :format="percent => `${percent} 分`"/>
            </el-row>
            <div style="text-align: center">毕业论文</div>
            <!--            报告暂无得分-->
            <el-row type="flex" justify="center" v-if="score.thesisScore == -1">
              <el-tag type="info">
                毕业论文得分暂未发布
                <a-icon type="exclamation" />
              </el-tag>
            </el-row>
            <!--            报告已有分数-->
            <el-row v-else>
              <a-progress
                style="margin-bottom: 10px"
                :stroke-color="{from: '#108ee9',to: '#87d068',}"
                :percent="score.thesisScore"
                status="active"
                :format="percent => `${percent} 分`"/>
            </el-row>
            <div style="text-align: center">总分</div>
            <!--            总分暂无-->
            <el-row type="flex" justify="center" v-if="score.finScore == -1">
              <el-tag type="info">
                中期阶段总成绩暂未发布
                <a-icon type="exclamation" />
              </el-tag>
            </el-row>
            <!--            总分已发布-->
            <el-row v-else>
              <a-progress
                :stroke-color="{from: '#108ee9',to: '#87d068',}"
                :percent="score.finScore"
                status="active"
                :format="percent => `${percent} 分`"/>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </el-card>
    <!--    查看课题详情对话框-->
    <el-dialog
      :visible.sync="viewPageVisible"
      width="60%">
      <el-row type="flex" justify="center" style="font-size: 20px; font-weight: bold">课题详情</el-row>
      <el-divider></el-divider>
      <el-form ref="subject" :model="currentSubjectInfo" label-width="80px">
        <el-row>
          <el-col :span="20">
            <el-form-item label="课题名称">
              <el-input v-model="currentSubjectInfo.subName"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="10">
            <el-form-item label="题目类型">
              <el-tag type="success" v-if=" currentSubjectInfo.zone == 'KXTS'">科学探索与技术创新</el-tag>
              <el-tag type="success" v-if=" currentSubjectInfo.zone == 'SMGH'">生命关怀与社会认知</el-tag>
              <el-tag type="success" v-if=" currentSubjectInfo.zone == 'ZXZH'">哲学智慧与创新思维</el-tag>
            </el-form-item>
          </el-col>
          <el-col :span="10">
            <el-form-item label="申报时间">
              <el-row>
                <el-input v-model="currentSubjectInfo.poseTime"></el-input>
              </el-row>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="10">
            <el-form-item label="指导教师">
              <el-input v-model="currentSubjectInfo.teacherName"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="10">
            <el-form-item label="导师电话">
              <el-input v-model="currentSubjectInfo.tel"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="课题内容">
              <div class="ql-container ql-snow" style="margin-left: 20px; margin-top: 20px">
                <div class="ql-editor" v-html="currentSubjectInfo.description"></div>
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="20">
            <el-form-item label="课题要求">
              <div class="ql-container ql-snow" style="margin-left: 20px; margin-top: 20px">
                <div class="ql-editor" v-html="currentSubjectInfo.requirement"></div>
              </div>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewPageVisible = false">退出查看</el-button>
      </span>
    </el-dialog>
    <!--    申请及毕业论文对话框-->
    <el-dialog
      :visible.sync="viewReportVisible"
      width="50%">
      <el-row type="flex" justify="center" style="font-size: 20px; font-weight: bold; margin-bottom: 20px">答辩申请及毕业论文</el-row>
      <el-divider>学生信息</el-divider>
      <el-row style="font-size: 15px">
        <el-col :span="3" :offset="2">申请人:</el-col>
        <el-col :span="5">{{currentReportInfo.studentName}}</el-col>
        <el-col :span="3" :offset="1">申请时间:</el-col>
        <el-col :span="8">{{currentReportInfo.poseTime}}</el-col>
      </el-row>
      <el-divider>答辩申请内容</el-divider>
      <el-row>
        <div class="ql-container ql-snow" style="margin-left: 20px; margin-top: 20px">
          <div class="ql-editor" v-html="currentReportInfo.applyReason"></div>
        </div>
      </el-row>
      <el-divider>毕业论文</el-divider>
      <el-row type="flex" justify="center">
        <Downloader :doc-id="docId"></Downloader>
      </el-row>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewReportVisible = false">退出查看</el-button>
      </span>
    </el-dialog>
    <!--    查看反馈抽屉-->
    <el-drawer
      title="开题报告意见"
      :with-header="false"
      :visible.sync="drawer">
      <div class="card_header">结题报告意见</div>
      <el-form ref="subject" :model="currentReportInfo" label-width="80px">
        <el-row>
          <el-col :span="22" class="feedback">
            <div class="fankui">答辩反馈</div>
            <div class="ql-container ql-snow" style="margin-left: 20px; margin-top: 20px">
              <div class="ql-editor" v-html="feedBack.secretatryComment"></div>
            </div>
          </el-col>
        </el-row>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="drawer = false">退出查看</el-button>
      </span>
    </el-drawer>
  </div>
</template>

<script>
import Downloader from '@/plugins/upload-download/Downloader'
export default {
  name: 'MyRecord',
  components: { Downloader },
  data() {
    return {
      docId: '',
      // 查看详情的课题信息
      currentSubjectInfo: {},
      subjectlist: [],
      currentReportInfo: {},
      // 查看反馈信息
      feedBack: {
        teacherComment: '',
        secretatryComment: ''
      },
      // （符合要求）课题总数
      totalPageNum: 0,
      // 获取课题列表
      queryInfo: {
        status: '', // 需要查询的通知记录状态（1-待审核，2-已通过，3-未通过）, 不发送则返回所有类型
        keyWord: '', // 关键词
        page: 1, // 当前页号
        size: 10, // 页面大小
        type: '', // 通知类型（1-学业通知， 2-答辩安排， 3-工作安排）
        stage: 'JT'
      },
      // 查看分数
      score: {
        thesisScore: 0, // 材料分数
        defenseScore: 0, // 答辩分数
        finScore: 0 // 总分
      },
      // 查看课题详情对话框可见性
      viewPageVisible: false,
      // 查看开题详情对话框可见性
      viewReportVisible: false,
      // 查看反馈抽屉可见性
      drawer: false
    }
  },
  created() {
    this.getReportList()
    this.getScore()
    this.getSubjectInfo()
  },
  methods: {
    async getReportList() {
      const { data: res } = await this.$http.get('/report', { params: this.queryInfo })
      if (res.meta.code !== 200) {
        this.$message.error('获取开题报告列表失败')
      } else {
        this.subjectlist = res.data.records
        this.totalPageNum = res.data.total
      }
    },
    async getSubjectInfo() {
      const { data: res } = await this.$http.get('/subject/student/my')
      if (res.meta.code !== 200) {
        this.$message.error('获取课题信息失败')
      } else {
        this.currentSubjectInfo = res.data
      }
    },
    async getScore() {
      const { data: res } = await this.$http.get('/statistics/score/fin')
      if (res.meta.code !== 200) {
        return this.$message.error('获取反馈失败')
      }
      this.score = res.data
      this.feedBack.secretatryComment = res.data.defenseFeedback
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
    // 查看课题详情
    viewSubject() {
      this.getSubjectInfo()
      this.viewPageVisible = true
    },
    // 查看课题详情
    viewReport(row) {
      this.docId = row.docId
      this.viewReportVisible = true
      this.currentReportInfo = row
    },
    // 查看反馈结果
    viewFeedback() {
      this.getSubjectInfo()
      this.drawer = true
    }
  }
}
</script>

<style Lang="less" scoped>
.card_header{
  margin-bottom: 50px;
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
.grades{
  display: flex;
  justify-content: center;
}
.fankui{
  font-size: 15px;
  font-weight: bold;
  text-align: center;
  align-items: center;
  display: flex;
  justify-content: center;
}

</style>
