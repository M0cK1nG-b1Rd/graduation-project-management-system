<template>
<div>
  <!--    面包屑导航区域-->
  <el-breadcrumb separator-class="el-icon-arrow-right">
    <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item>结题管理</el-breadcrumb-item>
    <el-breadcrumb-item>结题申请</el-breadcrumb-item>
  </el-breadcrumb>
  <!--      题目信息展示区-->
  <el-row>
    <el-col>
      <el-card class="bg-top">
        <div class="card_header">我的课题基本信息</div>
        <!--    课题详情卡片-->
        <el-row type="flex" justify="center">
          <el-card class="subject_detail">
            <!--        课题名称-->
            <el-row>
              课题名称：<a-tag color="blue" style="font-size: 15px">{{currentSubjectInfo.subName}}</a-tag>
            </el-row>
            <el-divider></el-divider>
            <!--        课题领域、所属专业、指导老师-->
            <el-row>
              <!--          指导老师-->
              <el-col :span="8">指导老师：
                <a-tag color="cyan">
                  <el-link :href="currentSubjectInfo.teacherHomePage" target="_blank">
                    {{currentSubjectInfo.teacherName+' '}}<i class="el-icon-view"></i>
                  </el-link>
                </a-tag>
              </el-col>
              <!--          课题领域-->
              <el-col :span="8">课题领域：
                <a-tag color="orange" v-if=" currentSubjectInfo.zone == 'KXTS'">科学探索与技术创新</a-tag>
                <a-tag color="orange" v-if=" currentSubjectInfo.zone == 'SMGH'">生命关怀与社会认知</a-tag>
                <a-tag color="orange" v-if=" currentSubjectInfo.zone == 'ZXZH'">哲学智慧与创新思维</a-tag>
              </el-col>
            </el-row>
            <el-divider></el-divider>
            <!--          课题要求-->
            <el-row type="flex" align="center">
              <el-col :span="3" class="item_label">课题要求：</el-col>
              <el-col :span="21">
                <div class="ql-container ql-snow">
                  <div class="ql-editor" v-html="currentSubjectInfo.requirement"></div>
                </div>
              </el-col>
            </el-row>
            <el-divider></el-divider>
            <!--          课题描述-->
            <el-row type="flex" align="center">
              <el-col :span="3" class="item_label">课题内容：</el-col>
              <el-col :span="21">
                <div class="ql-container ql-snow">
                  <div class="ql-editor" v-html="currentSubjectInfo.description"></div>
                </div>
              </el-col>
            </el-row>
          </el-card>
        </el-row>
        <div class="card_header">结题答辩申请</div>
        <!--   结题答辩申请表单卡片-->
        <el-row type="flex" justify="center">
          <el-card class="subject_detail">
            <!--        课题名称-->
            <el-row>
              <el-col :span="16">
              课题名称：<a-tag color="blue" style="font-size: 15px">{{currentSubjectInfo.subName}}</a-tag>
              </el-col>
              <!--          课题领域-->
              <el-col :span="8">课题领域：
                <a-tag color="blue" v-if=" currentSubjectInfo.zone == 'KXTS'">科学探索与技术创新</a-tag>
                <a-tag color="green" v-if=" currentSubjectInfo.zone == 'SMGH'">生命关怀与社会认知</a-tag>
                <a-tag color="cyan" v-if=" currentSubjectInfo.zone == 'ZXZH'">哲学智慧与创新思维</a-tag>
              </el-col>
            </el-row>
            <el-divider></el-divider>
<!--            表单部分-->
            <!--        学生姓名，专业-->
            <el-row type="flex" align="center">
              <el-col :span="4" class="item_label">学生姓名：</el-col>
              <el-col :span="8">
                <el-input v-model="applicationInfo.stuName" style="width: 70%">
                </el-input>
              </el-col>
              <el-col :span="4" class="item_label">所在专业：</el-col>
              <el-col :span="8">
                <el-input style="width: 70%" v-model="applicationInfo.stuMajorName">
                </el-input>
              </el-col>
            </el-row>
            <el-divider></el-divider>
            <!--        学生班级，专业-->
            <el-row :gutter="10" type="flex" align="center">
              <el-col :span="4" class="item_label">学生班级：</el-col>
              <el-col :span="8">
                <el-input style="width: 70%" v-model="applicationInfo.stuClass">
                </el-input>
              </el-col>
              <el-col :span="4" class="item_label">学生学号：</el-col>
              <el-col :span="8">
                <el-input style="width: 70%" v-model="applicationInfo.sid">
                </el-input>
              </el-col>
            </el-row>
            <el-divider></el-divider>
            <!--        申请理由-->
            <el-row type="flex" align="center">
              <el-col :span="4" class="item_label"><span>申请理由：</span></el-col>
              <el-col :span="20">
                <div class="ql-container ql-snow">
                  <div class="notice_content ql-editor"
                       @click="useQuillEditor"
                       style="font-size: 14px"
                       v-html="applicationInfo.applyReason">
                  </div>
                </div>
              </el-col>
            </el-row>
            <el-divider></el-divider>
          </el-card>
        </el-row>
        <!--    操作按钮区-->
        <el-row type="flex" justify="center" style="margin-top: 30px">
          <!--      提交申请按钮-->
          <el-button type="success" icon="el-icon-finished"
                     @click="submitApplication">
            提交申请
          </el-button>
          <el-popconfirm
            @confirm="uploaderVisible=true"
            title="上传毕业论文前请确认已提交结题答辩申请！">
            <el-button slot="reference" icon="el-icon-upload" type="primary" style="margin-left: 1px">提交论文</el-button>
          </el-popconfirm>
        </el-row>
      </el-card>
    </el-col>
  </el-row>
  <!--      符文本编辑器对话框-->
  <el-dialog
    title="请输入申请理由"
    :visible.sync="quillEditorVisible"
    :before-close="resetQuillEditorContent"
    width="60%">
    <quill-editor ref="quillEditor"
                  :init-content="applicationInfo.applyReason">
    </quill-editor>
    <span slot="footer" class="dialog-footer">
      <el-row style="margin-top: 30px">
          <el-button @click="resetQuillEditorContent">清 空</el-button>
          <el-button type="primary" @click="submitQuillEditorContent">确 定</el-button>
      </el-row>
    </span>
  </el-dialog>
  <!--    上传附件对话框-->
  <el-dialog
    title="上传附件"
    :visible.sync="uploaderVisible"
    width="30%">
    <uploader :doc-id="docId"></uploader>
    <span slot="footer" class="dialog-footer">
        <el-button type="primary" plain @click="uploaderVisible = false">确 定</el-button>
      </span>
  </el-dialog>
</div>
</template>

<script>
import quillEditor from '@/plugins/quill-editor/VueQuillEditor'
import Uploader from '@/plugins/upload-download/Uploader'
export default {
  name: 'applyClosing',
  components: { quillEditor, Uploader },
  data() {
    return {
      docId: null,
      uploaderVisible: false,
      // 当前选中的课题信息
      currentSubjectInfo: {
        subId: '',
        subName: '',
        zone: '', // 课题领域
        description: '',
        majorName: '',
        requirement: '',
        teacherTitle: '',
        teacherName: '',
        teacherHomePage: ''
      },
      // 学生申请信息
      applicationInfo: {
        subId: '',
        stuName: '', // 学生姓名
        stuMajorName: '', // 学生专业名称
        stuClass: '', // 学生班级
        sid: '', // 学号
        stage: 'JT',
        applyReason: '（请输入申请原因）本人保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。' // 申请理由
      },
      // 富文本编辑器可见性
      quillEditorVisible: false
    }
  },
  created() {
    this.getCurrentSubjectInfo()
  },
  methods: {
    // 获取课题信息
    async getCurrentSubjectInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/subject/student/my')
      if (res.meta.code !== 200) {
        return this.$message.error('获取课题列表失败')
      }
      this.currentSubjectInfo = res.data
      this.applicationInfo.subId = res.data.subId
    },
    // 提交表单
    async reportSubmit() {
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/report', this.report)
      if (res.meta.code !== 200) {
        this.$message.error('答辩申请提交失败！')
      } else {
        this.docId = res.data
        this.$message.success('答辩申请提交成功！')
      }
    },
    // 调用富文本编辑器
    useQuillEditor() {
      this.quillEditorVisible = true
    },
    // 重置富文本编辑框
    resetQuillEditorContent() {
      this.$refs.quillEditor.reset()
      this.applicationInfo.applyReason = '请输入申请理由'
      this.quillEditorVisible = false
    },
    // 提交（采用）富文本编辑器框
    submitQuillEditorContent() {
      this.applicationInfo.applyReason = this.$refs.quillEditor.returnContent()
      this.quillEditorVisible = false
    },
    // 提交申请
    async submitApplication() {
      const applicationForm = {}
      applicationForm.subId = this.applicationInfo.subId
      applicationForm.applyReason = this.applicationInfo.applyReason
      applicationForm.stage = 'JT'
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/report', applicationForm)
      if (res.meta.code !== 200) {
        this.$message.error('提交答辩申请失败！')
      } else {
        this.$message.success('答辩申请提交成功！')
        this.docId = res.data
      }
    }
  }
}
</script>

<style Lang="less" scoped>
.el-card{
  margin-bottom: 20px;
  margin-right: 5px;
}
.card_header{
  margin-bottom: 10px;
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
/*分割线*/
.el-divider{
  margin: 6px;
}
/*课题详情卡片*/
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
/*表单标签*/
.item_label{
  display: flex;
  align-items: center;
}
/*输入框、富文本字体大小*/
.ql-editor{
  font-size: 15px;
}
</style>
