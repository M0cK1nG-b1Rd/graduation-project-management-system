<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>中期管理</el-breadcrumb-item>
      <el-breadcrumb-item>中期报告</el-breadcrumb-item>
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
                <el-col :span="8">课题领域：<a-tag color="orange">{{currentSubjectInfo.zone}}</a-tag></el-col>
                <!--          所属专业-->
                <el-col :span="8">所属专业：<a-tag color="#87d068">{{currentSubjectInfo.majorName}}</a-tag></el-col>
              </el-row>
              <el-divider></el-divider>
              <!--          课题要求-->
              <el-row type="flex" align="center">
                <el-col :span="4" class="item_label">课题要求：</el-col>
                <el-col :span="20">
                  <div class="ql-container ql-snow">
                    <div class="ql-editor" v-html="currentSubjectInfo.requirement"></div>
                  </div>
                </el-col>
              </el-row>
              <el-divider></el-divider>
              <!--          课题描述-->
              <el-row type="flex" align="center">
                <el-col :span="4" class="item_label">课题内容：</el-col>
                <el-col :span="20">
                  <div class="ql-container ql-snow">
                    <div class="ql-editor" v-html="currentSubjectInfo.description"></div>
                  </div>
                </el-col>
              </el-row>
              <el-divider></el-divider>
              <!--        附件-->
              <el-row type="flex" align="center">
                <el-col :span="4" class="item_label">附件下载：</el-col>
              </el-row>
            </el-card>
          </el-row>
        </el-card>
      </el-col>
    </el-row>
    <!--      填写开题报告，上传附件区-->
    <el-card class="bg-bottom">
      <el-row>
        <el-col :span="16">
          <el-card>
            <div class="card_header">填写中期报告基本信息</div>
            <el-form ref="form" :model="form" label-width="80px">
              <el-row>
                <el-col :span="20">
                  <el-col :span="3" class="item_label"><span>研究进展</span></el-col>
                  <el-col :span="21" style="margin-bottom: 20px">
                    <div class="ql-container ql-snow">
                      <div class="notice_content ql-editor"
                           @click="useQuillEditor1"
                           v-html="report.progress">
                      </div>
                    </div>
                  </el-col>
                </el-col>
                <el-col :span="20">
                  <el-col :span="3" class="item_label"><span>后续计划</span></el-col>
                  <el-col :span="21" style="margin-bottom: 20px">
                    <div class="ql-container ql-snow">
                      <div class="notice_content ql-editor"
                           @click="useQuillEditor2"
                           v-html="report.followPlan">
                      </div>
                    </div>
                  </el-col>
                </el-col>
              </el-row>
              <el-form-item>
                <el-button type="primary" @click="dialogVisible=true">立即创建</el-button>
                <el-button>取消</el-button>
              </el-form-item>
            </el-form>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card>
            <!--        文件上传-->
            <el-upload
              class="upload-demo"
              drag
              action="https://jsonplaceholder.typicode.com/posts/"
              multiple>
              <i class="el-icon-upload"></i>
              <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
              <div class="el-upload__tip" slot="tip">文件不超过500kb</div>
            </el-upload>
          </el-card>
        </el-col>
      </el-row>
    </el-card>
    <!--      符文本编辑器对话框-->
    <el-dialog
      title="简述开题以来所作的具体工作和取得进展"
      :visible.sync="quillEditor1Visible"
      :before-close="resetQuillEditor1Content"
      width="75%">
      <quill-editor ref="quillEditor1"
                    :init-content="report.progress">
      </quill-editor>
      <span slot="footer" class="dialog-footer">
          <el-button @click="resetQuillEditor1Content">清 空</el-button>
          <el-button type="primary" @click="submitQuillEditor1Content">确 定</el-button>
        </span>
    </el-dialog>
    <el-dialog
      title="请简述下一步的主要工作"
      :visible.sync="quillEditor2Visible"
      :before-close="resetQuillEditor2Content"
      width="75%">
      <quill-editor ref="quillEditor2"
                    :init-content="report.followPlan">
      </quill-editor>
      <span slot="footer" class="dialog-footer">
          <el-button @click="resetQuillEditor2Content">清 空</el-button>
          <el-button type="primary" @click="submitQuillEditor2Content">确 定</el-button>
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
      // 查看学生的课题信息
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
      report: {
        progress: '',
        followPlan: '',
        fileList: [{
          name: 'food.jpeg',
          url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
        }, {
          name: 'food2.jpeg',
          url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
        }]
      },
      // 富文本编辑器可见性
      quillEditor1Visible: false,
      quillEditor2Visible: false
    }
  },
  created() {
    this.getCurrentSubjectInfo()
  },
  methods: {
    // submitUpload() {
    //   this.$refs.upload.submit()
    // },
    // handleRemove(file, fileList) {
    //   console.log(file, fileList)
    // },
    // handlePreview(file) {
    //   console.log(file)
    // }
    // 获取课题信息
    async getCurrentSubjectInfo() {
      const { data: res } = await this.$http.get('/mock/mySubjects.json')
      if (res.meta.code !== 200) {
        return this.$message.error('获取课题列表失败')
      }
      this.currentSubjectInfo = res.data.MySubject
    },
    // 调用富文本编辑器
    useQuillEditor1() {
      this.quillEditor1Visible = true
    },
    useQuillEditor2() {
      this.quillEditor2Visible = true
    },
    // 重置富文本编辑框
    resetQuillEditor1Content() {
      this.$refs.quillEditor.reset()
      this.report.progress = '简述开题以来所作的具体工作和取得进展'
      this.quillEditor1Visible = false
    },
    resetQuillEditor2Content() {
      this.$refs.quillEditor.reset()
      this.report.followPlan = '请简述下一步的主要工作'
      this.quillEditor2Visible = false
    },
    // 提交（采用）富文本编辑器框
    submitQuillEditor1Content() {
      this.report.progress = this.$refs.quillEditor1.returnContent()
      this.quillEditor1Visible = false
    },
    submitQuillEditor2Content() {
      this.report.followPlan = this.$refs.quillEditor2.returnContent()
      this.quillEditor2Visible = false
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
  background-color: #ececec;
}
.bg-bottom{
  background-color: #def3fa;
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
</style>
