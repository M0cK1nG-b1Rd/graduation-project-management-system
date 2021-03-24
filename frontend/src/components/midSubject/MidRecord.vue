<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>中期管理</el-breadcrumb-item>
      <el-breadcrumb-item>报告记录</el-breadcrumb-item>
    </el-breadcrumb>
    <!--    查看我的开题报告提交记录列表区-->
    <!--卡片视图区-->
    <el-card class="el-card">
      <el-row>
        <el-col :span="18">
          <!--  表格卡片-->
          <el-card>
            <!--      表格区-->
            <el-row>
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
                  width="150">
                </el-table-column>
                <!--         报告状态-->
                <el-table-column
                  :show-overflow-tooltip="true"
                  prop="status"
                  width="120"
                  :filters="[{ text: '待审核', value: 'WSH' }, { text: '已通过', value: 'YTG' }, { text: '未通过', value: 'WTG' }]"
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
                    <!--              查看开题阶段内容-->
                    <el-tooltip class="item" effect="dark" content="查看中期阶段内容" placement="top" :enterable="false">
                      <el-button type="warning" icon="el-icon-s-flag" circle size="mini" @click="viewReport(scope.row)"></el-button>
                    </el-tooltip>
                    <!--              查看反馈结果-->
                    <el-tooltip class="item" effect="dark" content="查看反馈结果" placement="top" :enterable="false">
                      <el-button type="primary" icon="el-icon-message" circle size="mini" @click="viewFeedback(scope.row)"></el-button>
                    </el-tooltip>
                  </template>
                </el-table-column>
              </el-table>
            </el-row>
            <!--      分页区-->
            <el-row type="flex" style="margin-top: 10px" justify="center">
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
        <!--      评分区-->
        <el-col :span="6">
          <el-card style="margin-left: 10px">
            <div class="card_header">我的中期成绩</div>
            <div>答辩表现</div>
            <a-progress
              style="margin-bottom: 10px"
              :stroke-color="{from: '#108ee9',to: '#87d068',}"
              :percent="score.defenseScore"
              status="active"
              :format="percent => `${percent} 分`"
            />
            <div>中期材料</div>
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
              :percent="score.midScore"
              status="active"
              :format="percent => `${percent} 分`"
            />
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
    <!--    查看中期详情对话框-->
    <el-dialog
      :visible.sync="viewReportVisible"
      width="60%">
      <el-row type="flex" justify="center" style="font-size: 20px; font-weight: bold">中期报告详情</el-row>
      <el-divider></el-divider>
      <el-form ref="subject" :model="currentReportInfo" label-width="80px">
        <el-row>
          <el-col :span="10">
            <el-form-item label="学生姓名">
              <div class="ql-container ql-snow" style="margin-left: 20px; margin-top: 20px">
                <div class="ql-editor" v-html="currentReportInfo.studentName"></div>
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="提交时间">
              <div class="ql-container ql-snow" style="margin-left: 20px; margin-top: 20px">
                <div class="ql-editor" v-html="currentReportInfo.poseTime"></div>
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="研究进展">
              <div class="ql-container ql-snow" style="margin-left: 20px; margin-top: 20px">
                <div class="ql-editor" v-html="currentReportInfo.progress"></div>
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="20">
            <el-form-item label="后续计划">
              <div class="ql-container ql-snow" style="margin-left: 20px; margin-top: 20px">
                <div class="ql-editor" v-html="currentReportInfo.postPlan"></div>
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="20">
            <el-form-item label="相关附件">
              <Downloader :doc-id="docId"></Downloader>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewReportVisible = false">退出查看</el-button>
      </span>
    </el-dialog>
    <!--    查看反馈抽屉-->
    <el-drawer
      title="中期报告意见"
      :with-header="false"
      :visible.sync="drawer">
      <div class="card_header">中期报告意见</div>
      <el-form ref="subject" :model="currentReportInfo" label-width="80px">
        <el-row>
          <el-col :span="20">
            <el-form-item label="反馈教师">
              <el-input v-model="currentSubjectInfo.teacherName"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="22" class="feedback">
            <div class="fankui">报告反馈</div>
            <div class="ql-container ql-snow" style="margin-left: 20px; margin-top: 20px">
              <div class="ql-editor" v-html="feedBack.teacherComment" ></div>
            </div>
          </el-col>
          <el-col :span="22" class="feedback">
            <!--            <el-form-item label="反馈内容">-->
            <!--              <el-input readonly="readonly" type="textarea" v-model="currentSubjectInfo.description"></el-input>-->
            <!--            </el-form-item>-->
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
        stage: 'ZQ'
      },
      // 查看分数
      score: {
        fileScore: 0, // 材料分数
        defenseScore: 0, // 答辩分数
        midScore: 0 // 总分
      },
      // 查看课题详情对话框可见性
      viewPageVisible: false,
      // 查看开题详情对话框可见性
      viewReportVisible: false,
      // 查看反馈抽屉可见性
      drawer: false,
      docId: ''
    }
  },
  async created() {
    await this.getReportList()
    await this.getScore()
    await this.getSubjectInfo()
    await this.getFeedBackInfo()
  },
  methods: {
    async getReportList() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/report', { params: this.queryInfo })
      if (res.meta.code !== 200) {
        return this.$message.error('获取开题报告列表失败')
      } else {
        this.subjectlist = res.data.records
        this.totalPageNum = res.data.total
      }
    },
    async getSubjectInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/subject/student/my')
      if (res.meta.code !== 200) {
        return this.$message.error('获取课题信息失败')
      } else {
        this.currentSubjectInfo = res.data
        this.subjectDocId = res.data.docId
      }
    },
    async getFeedBackInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/report')
      if (res.meta.code !== 200) {
        this.$message.error('获取反馈失败')
      } else {
        this.feedBack = res.data.records[0]
      }
    },
    async getScore() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/statistics/score/mid')
      if (res.meta.code !== 200) {
        this.$message.error('获取成绩失败')
      } else {
        this.score = res.data
      }
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
    // 查看中期详情
    viewReport(row) {
      this.viewReportVisible = true
      this.currentReportInfo = row
      this.docId = row.docId
    },
    // 查看反馈结果
    viewFeedback(row) {
      this.getSubjectInfo()
      this.feedBack.teacherComment = row.comment
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
