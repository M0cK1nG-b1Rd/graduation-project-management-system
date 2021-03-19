<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>开题管理</el-breadcrumb-item>
      <el-breadcrumb-item>答辩评分</el-breadcrumb-item>
    </el-breadcrumb>
    <!--      题目信息展示区-->
    <el-row>
      <el-col>
          <div class="card_header">开题答辩安排信息</div>
          <!--    答辩相情卡片-->
          <el-row type="flex" justify="center">
            <el-card class="pre_detail">
              <!--        课题名称-->
              <el-row>
                <el-col :span="8">
                答辩时间：<a-tag color="blue" style="font-size: 15px">{{currentPreInfo.startTime}}</a-tag>
                </el-col>
                <el-col :span="8">
                  答辩地点：<a-tag color="green">{{currentPreInfo.classroomName}}</a-tag>
                </el-col>
                <el-col :span="8">
                  负责人：<a-tag color="orange">{{currentPreInfo.teacherTeam.secretary.realName}}</a-tag>
                </el-col>
              </el-row>
              <el-divider></el-divider>
              <!--        参与学生名单、指导老师名单-->
              <el-row>
                <!--          答辩学生参与名单-->
                <el-col :span="10">
                  <el-card class="box-student" style="margin-top: 5px" >
                    <el-table
                      :data="currentPreInfo.stuGroup.students"
                      style="width: 100%; font-size: 13px">
                      <el-table-column
                        prop="realName"
                        label="学生名单"
                        width="180">
                      </el-table-column>
                      <el-table-column
                        prop="collegeName"
                        label="所属学院"
                        width="100">
                      </el-table-column>
                    </el-table>
                  </el-card>
                </el-col>
<!--                 &lt;!&ndash;         占位符       &ndash;&gt;-->
<!--                <el-col :span="4">-->
<!--                  <el-divider direction="vertical"></el-divider>-->
<!--                </el-col>-->
                <!--          答辩老师参与名单-->
                <el-col :span="14">
                  <el-card class="box-teacher" style="margin-left: 20%; margin-top: 5px">
                    <el-table
                      :data="currentPreInfo.teacherTeam.teachers"
                      style="width: 100%; font-size: 13px">
                      <el-table-column
                        prop="realName"
                        label="教师名单"
                        width="130">
                      </el-table-column>
                      <el-table-column
                        prop="tel"
                        label="电话"
                        width="150">
                      </el-table-column>
                    </el-table>
                  </el-card>
                </el-col>
              </el-row>
              <el-divider></el-divider>
              <!--        答辩信息附件下载区-->
              <el-row type="flex" align="center">
                <el-col :span="4" class="item_label">附件下载：</el-col>
              </el-row>
              <!--         回形针区     -->
              <el-col>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
                <i class="el-icon-paperclip"></i>
              </el-col>
              <div class="card_header">开题答辩成绩登记</div>
              <el-row type="flex" justify="center">
                <!--  表格卡片-->
                <!--      表格区-->
                <el-row>
                  <el-table
                    :data="currentPreInfo.stuGroup.students"
                    style="width: 100%; font-size: 15px">
                    <!--          答辩人-->
                    <el-table-column
                      :show-overflow-tooltip="true"
                      prop="realName"
                      label="答辩人"
                      width="100">
                    </el-table-column>
                    <!--          学号-->
                    <el-table-column
                      :show-overflow-tooltip="true"
                      prop="userId"
                      label="学号"
                      width="100">
                    </el-table-column>
                    <!--          联系方式-->
                    <el-table-column
                      :show-overflow-tooltip="true"
                      prop="mail"
                      label="邮箱"
                      width="180">
                    </el-table-column>
                    <!--          操作-->
                    <el-table-column
                      :show-overflow-tooltip="true"
                      width="200"
                      label="操作">
                      <template slot-scope="scope">
                        <!--              查看课题详细内容-->
                        <el-tooltip class="item" effect="dark" content="查看课题详细内容" placement="top" :enterable="false">
                          <el-button type="primary" icon="el-icon-view" circle size="mini" @click="viewSubject(scope.row)"></el-button>
                        </el-tooltip>
                        <!--              查看开题阶段内容-->
                        <el-tooltip class="item" effect="dark" content="查看开题阶段内容" placement="top" :enterable="false">
                          <el-button type="success" icon="el-icon-s-flag" circle size="mini" @click="viewReport(scope.row)"></el-button>
                        </el-tooltip>
                        <!--              编辑反馈结果-->
                        <el-tooltip class="item" effect="dark" content="编辑开题成绩" placement="top" :enterable="false">
                          <el-button type="danger" icon="el-icon-edit" circle size="mini" @click="editFeedback(scope.row)"></el-button>
                        </el-tooltip>
                      </template>
                    </el-table-column>
                  </el-table>
                </el-row>
              </el-row>
            </el-card>
          </el-row>
      </el-col>
      <el-col>
      </el-col>
    </el-row>
    <!--    查看课题详情对话框-->
    <el-dialog
      :visible.sync="viewPageVisible"
      width="60%">
      <el-form ref="subject" :model="currentSubjectInfo" label-width="80px">
        <el-row>
          <el-col :span="8">
            <el-form-item label="课题名称">
              <el-tag type="primary"  effect="plain" v-model="currentSubjectInfo.subName">{{currentSubjectInfo.subName}}</el-tag>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="题目类型">
              <el-tag type="success"  effect="plain" v-if=" currentSubjectInfo.zone == 'KXTS'">科学探索与技术创新</el-tag>
              <el-tag type="success"  effect="plain" v-if=" currentSubjectInfo.zone == 'SMGH'">生命关怀与社会认知</el-tag>
              <el-tag type="success"  effect="plain" v-if=" currentSubjectInfo.zone == 'ZXZH'">哲学智慧与创新思维</el-tag>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="指导教师">
              <el-tag type="warning"  effect="plain" v-model="currentSubjectInfo.teacherName">{{currentSubjectInfo.teacherName}}</el-tag>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="课题内容">
              <el-input type="textarea" v-model="currentSubjectInfo.description"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="20">
            <el-form-item label="课题要求">
              <el-input type="textarea" v-model="currentSubjectInfo.requirement"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewPageVisible = false">退出查看</el-button>
      </span>
    </el-dialog>
    <!--    查看开题详情对话框  注意下载附件-->
    <el-dialog
      :visible.sync="viewReportVisible"
      width="60%">
      <el-form ref="subject" :model="currentReportInfo" label-width="80px">
        <el-row>
          <el-col :span="7">
            <el-form-item label="提交人">
              <el-input v-model="currentReportInfo.studentName"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="提交时间">
              <el-row>
                <el-input v-model="currentReportInfo.poseTime"></el-input>
              </el-row>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="研究意义">
              <el-input readonly="readonly" type="textarea" v-model="currentReportInfo.meaning"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="20">
            <el-form-item label="调研结果">
              <el-input readonly="readonly" type="textarea" v-model="currentReportInfo.result"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="20">
            <el-form-item label="研究计划">
              <el-input readonly="readonly" type="textarea" v-model="currentReportInfo.plan"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewReportVisible = false">退出查看</el-button>
      </span>
    </el-dialog>
    <!--    给学生反馈信息抽屉-->
    <el-dialog
      title="开题信息反馈及评分"
      :visible.sync="drawer"
      size="50%">
      <el-row class="drawer-bg">
        <!--      富文本编辑器输入框-->
        <el-form ref="form" :model="feedBack" label-width="80px">
          <el-row>
            <el-col style="padding: 40px">
              <el-card class="feedBackCard">
                <el-row>
                  <el-col :span="10" class="item_label"><span class="card_header">反馈信息表</span></el-col>
                  <el-col :span="24" style="margin-bottom: 10px">
                    <div class="ql-container ql-snow">
                      <div class="notice_content ql-editor"
                           @click="useQuillEditor"
                           v-html="feedBack.comment">
                      </div>
                    </div>
                  </el-col>
                </el-row>
                <el-divider></el-divider>
                <el-col>
                  <div class="block">
                    <el-slider
                      v-model="feedBack.fileScore"
                      show-input>
                    </el-slider>
                  </div>
                </el-col>
                <el-col>
                  <el-form-item label="开题结果">
                    <el-radio-group v-model="feedBack.isPassed">
                      <el-radio label="false">通过审核</el-radio>
                      <el-radio label="true">未通过</el-radio>
                    </el-radio-group>
                  </el-form-item>
                </el-col>
              </el-card>
            </el-col>
          </el-row>
          <el-form-item>
            <el-button type="success" @click="feedBackSubmit">立即提交</el-button>
            <el-button>取消</el-button>
          </el-form-item>
        </el-form>
      </el-row>
    </el-dialog>
    <!--      符文本编辑器对话框-->
    <el-dialog
      title="请输入反馈信息"
      :visible.sync="quillEditorVisible"
      :before-close="resetQuillEditorContent"
      width="75%">
      <quill-editor ref="quillEditor"
                    :init-content="feedBack.comment">
      </quill-editor>
      <span slot="footer" class="dialog-footer">
          <el-button @click="resetQuillEditorContent">清 空</el-button>
          <el-button type="primary" @click="submitQuillEditorContent">确 定</el-button>
        </span>
    </el-dialog>
  </div>
</template>

<script>
import quillEditor from '@/plugins/quill-editor/VueQuillEditor'
export default {
  name: 'StartReport',
  components: { quillEditor },
  data() {
    return {
      // 当场答辩信息
      currentPreInfo: {
        classroomName: '',
        Id: 0,
        preName: '',
        startTime: ''
      },
      stage: '',
      studentList: [],
      // 查看详情的课题信息
      currentSubjectInfo: {},
      currentReportInfo: {},
      feedBack: {
        userId: 0,
        pleaId: 0,
        score: 0,
        feedback: '',
        isPassed: true,
        stage: 'KT'
      },
      viewPageVisible: false,
      viewReportVisible: false,
      // 反馈抽屉可见性
      drawer: false,
      // 富文本编辑器可见性
      quillEditorVisible: false
    }
  },
  created() {
    // this.getStudentList()
    this.getcurrentPreInfo()
  },
  methods: {
    async getcurrentPreInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/plea/user', { params: { stage: 'XT' } })
      if (res.meta.code !== 200) {
        this.$message.error('获取答辩安排信息失败')
      }
      this.currentPreInfo = res.data[0] // 与后端对接
      this.feedBack.pleaId = res.data[0].id
      console.log(this.feedBack.pleaId)
    },
    async getSubjectInfo(row) {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/subject/userId', { params: { userId: row.userId } })
      if (res.meta.code !== 200) {
        this.$message.error('获取课题信息失败')
      }
      this.currentSubjectInfo = res.data // 与后端对接
    },
    async getReportInfo(row) {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/report/user', { params: { userId: row.userId, stage: 'KT' } })
      if (res.meta.code !== 200) {
        this.$message.error('获取开题报告信息失败')
      }
      this.currentReportInfo = res.data[0] // 与后端对接
    },
    // 提交表单
    async feedBackSubmit() {
      this.drawer = false
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/pleaResult', this.feedBack)
      if (res.meta.code !== 200) this.$message.error('提交答辩成绩失败！')
      else this.$message.success('提交答辩成绩成功！')
    },
    // 查看课题详情
    viewSubject(row) {
      this.getSubjectInfo(row)
      this.viewPageVisible = true
      this.currentSubjectInfo = row
      console.log(this.currentSubjectInfo)
    },
    // 查看学生开题报告详情
    viewReport(row) {
      this.getReportInfo(row)
      this.viewReportVisible = true
      this.currentReportInfo = row
      console.log(this.currentReportInfo)
    },
    // 编辑反馈表单
    editFeedback(row) {
      console.log(row)
      this.feedBack.userId = row.id
      this.drawer = true
    },
    // 调用富文本编辑器
    useQuillEditor() {
      this.quillEditorVisible = true
    },
    // 重置富文本编辑框
    resetQuillEditorContent() {
      this.$refs.quillEditor.reset()
      this.feedBack.comment = '请输入反馈信息'
      this.quillEditorVisible = false
    },
    // 提交（采用）富文本编辑器框
    submitQuillEditorContent() {
      this.feedBack.comment = this.$refs.quillEditor.returnContent()
      this.quillEditorVisible = false
    }
  }
}
</script>

<style Lang="less" scoped>
.el-card{
  margin-bottom: 20px;
  margin-right: 5px;
}
.bg-top{
  background-color: #faf9f9;
}
.card_header{
  margin-bottom: 10px;
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
.box-student{
  border-radius: 34px;
  background: #ffffff;
  box-shadow:  7px 7px 14px #c2c2c2,
    -7px -7px 14px #ffffff;
}
.box-teacher{
  border-radius: 34px;
  background: #ffffff;
  box-shadow:  7px 7px 14px #c2c2c2,
    -7px -7px 14px #ffffff;
}
/*分割线*/
.el-divider{
  margin: 7px;
}
.divider2{
  margin: 10px;
}
.box-teacher{
}
/*答辩详情卡片*/
.subject_detail{
  width: 80%;
  padding-left: 50px;
  font-size: 16px;
  /*边框阴影*/
  border-radius: 4px;
  background: #ffffff;
  box-shadow:  28px 28px 56px #bababa,
    -28px -28px 56px #ffffff;
}
.drawer-bg{
  height: 90%;
  border-radius: 24px;
  background: #f0f0f0;
  box-shadow:  20px 20px 32px #959595,
    -20px -20px 32px #ffffff;
}
/*表单标签*/
.item_label{
  display: flex;
  align-items: center;
}
</style>
