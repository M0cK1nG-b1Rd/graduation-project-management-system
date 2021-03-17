<template>
  <div>
    <!--    页面标题-->
    <el-row class="page_header">
      提交选题申请
    </el-row>
    <!--    申请表单区-->
    <el-row type="flex" justify="center">
      <el-card class="application_form">
        <!--        课题名称-->
        <el-row>
          课题名称：<a-tag color="blue" style="font-size: 15px">{{currentSubjectInfo.subName}}</a-tag>
        </el-row>
        <el-divider></el-divider>
        <!--        课题领域、所属专业-->
        <el-row :gutter="20">
          <!--          课题领域-->
          <el-col :span="12">课题领域：<a-tag color="orange">{{currentSubjectInfo.zone}}</a-tag></el-col>
          <!--          所属专业-->
          <el-col :span="12">所属专业：<a-tag color="#87d068">{{currentSubjectInfo.majorName}}</a-tag></el-col>
        </el-row>
        <el-divider></el-divider>
        <!--        指导老师信息-->
        <el-row :gutter="20">
        <!--        教师名字-->
          <el-col :span="12">老师姓名：
            <a-tag color="blue">
              <el-link :href="currentSubjectInfo.teacherHomePage" target="_blank">
                {{currentSubjectInfo.teacherName+' '}}<i class="el-icon-view"></i>
              </el-link>
            </a-tag>
          </el-col>
        <!--          教师职称-->
          <el-col :span="12">教师职称：<a-tag color="blue">{{currentSubjectInfo.teacherTitle}}</a-tag></el-col>
        </el-row>
        <el-divider></el-divider>
        <!--          课题要求-->
        <el-row type="flex" align="center">
          <el-col :span="3" class="item_label">选题要求：</el-col>
          <el-col :span="21">
            <div class="ql-container ql-snow">
              <div class="notice_content ql-editor" v-html="currentSubjectInfo.requirement"></div>
            </div>
          </el-col>
        </el-row>
        <el-divider></el-divider>
        <!--          课题描述-->
        <el-row type="flex" align="center">
          <el-col :span="3" class="item_label">课题内容：</el-col>
          <el-col :span="21">
            <div class="ql-container ql-snow">
              <div class="notice_content ql-editor" v-html="currentSubjectInfo.description"></div>
            </div>
          </el-col>
        </el-row>
        <el-divider></el-divider>
<!--        学生姓名，专业-->
        <el-row :gutter="10" type="flex" align="center">
          <el-col :span="3" class="item_label">学生姓名：</el-col>
          <el-col :span="9">
            <el-input v-model="applicationInfo.stuName" style="width: 70%">
            </el-input>
          </el-col>
          <el-col :span="3" class="item_label">所在专业：</el-col>
          <el-col :span="9">
            <el-input style="width: 70%" v-model="applicationInfo.stuMajorName">
            </el-input>
          </el-col>
        </el-row>
        <el-divider></el-divider>
<!--        学生班级，专业-->
        <el-row :gutter="10" type="flex" align="center">
          <el-col :span="3" class="item_label">学生班级：</el-col>
          <el-col :span="9">
            <el-input style="width: 70%" v-model="applicationInfo.stuClass">
            </el-input>
          </el-col>
          <el-col :span="3" class="item_label">学生学号：</el-col>
          <el-col :span="9">
            <el-input style="width: 70%" v-model="applicationInfo.sid">
            </el-input>
          </el-col>
        </el-row>
        <el-divider></el-divider>
<!--        申请理由-->
        <el-row type="flex" align="center">
          <el-col :span="3" class="item_label"><span>申请理由：</span></el-col>
          <el-col :span="21">
            <div class="ql-container ql-snow">
              <div class="notice_content ql-editor"
                   @click="useQuillEditor"
                   v-html="applicationInfo.applyReason">
              </div>
            </div>
          </el-col>
        </el-row>
        <el-divider></el-divider>
<!--        上传附件-->
        <el-row type="flex" align="center">
          <el-col :span="3" class="item_label"><span>上传附件：</span></el-col>
          <el-col :span="21">
          </el-col>
        </el-row>
      </el-card>
    </el-row>
    <!--    操作按钮区-->
    <el-row type="flex" justify="center" style="margin-top: 30px">
<!--      返回上一页（查看所有课题）按钮-->
      <el-button type="success" icon="el-icon-arrow-left"
                 @click="returnAllSubjectPage">
        回到上一页
      </el-button>
<!--      提交申请按钮-->
      <el-button type="primary" icon="el-icon-finished"
                 @click="submitApplication">
        提交选题申请
      </el-button>
    </el-row>
    <!--      符文本编辑器对话框-->
    <el-dialog
      title="请输入申请理由"
      :visible.sync="quillEditorVisible"
      :before-close="resetQuillEditorContent"
      width="75%">
      <quill-editor ref="quillEditor"
                    :init-content="applicationInfo.applyReason">
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
  name: 'ChooseSubjectApplication',
  components: { quillEditor },
  mounted() {
    this.currentSubjectInfo = this.$route.params
    this.applicationInfo.subId = this.currentSubjectInfo.subId
  },
  data() {
    return {
      // 当前所选课题基本信息
      currentSubjectInfo: {},
      // 学生申请信息
      applicationInfo: {
        subId: '',
        stuName: '', // 学生姓名
        stuMajorName: '', // 学生专业名称
        stuClass: '', // 学生班级
        sid: '', // 学号
        applyReason: '请输入申请原因' // 申请理由
      },
      // 富文本编辑器可见性
      quillEditorVisible: false
    }
  },
  methods: {
    // 返回查看所有课题信息页面
    returnAllSubjectPage() {
      this.$router.push('/subject/all')
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
    // 提交选题申请
    async submitApplication() {
      const applicationForm = {}
      applicationForm.subId = this.applicationInfo.subId
      applicationForm.applyReason = this.applicationInfo.applyReason
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/subject/apply', applicationForm)
      if (res.meta.code !== 200) return this.$message.error('提交选题申请失败！')
      this.$message.success('选题申请提交成功！')
    }
  }
}
</script>

<style Lang="less" scoped>
/*页面标题*/
.page_header{
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 20px;
}
/*选题表单卡片*/
.application_form{
  width: 80%;
  padding-left: 50px;
  font-size: 16px;
  /*边框阴影*/
  border-radius: 4px;
  background: #ffffff;
  box-shadow:  28px 28px 56px #bababa,
    -28px -28px 56px #ffffff;
}
/*分割线*/
.el-divider{
  margin: 6px;
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
/**/
</style>
