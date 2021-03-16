<template>
  <div>
  <!--    面包屑导航区域-->
  <el-breadcrumb separator-class="el-icon-arrow-right">
    <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item>开题管理</el-breadcrumb-item>
    <el-breadcrumb-item>开题报告</el-breadcrumb-item>
  </el-breadcrumb>
    <!--      题目信息展示区-->
  <el-row>
    <el-col>
      <el-card class="bg-top">
        <el-row>
          <el-col :span="8">
<!--            名称、申请人表格卡片-->
            <el-card>
          <el-table
            :data="subjectlist"
            size="medium "
            :default-sort = "{prop: 'date', order: 'descending'}"
            style="width: 100%; font-size: 15px">
            <!--          课题名称-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="subName"
              label="课题名称"
              width="110">
            </el-table-column>
            <!--        课题类型-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="type"
              label="课题类型"
              width="200">
              <template slot-scope="scope">
                <el-tag v-if="scope.row.type==1" type="info">类型一</el-tag>
                <el-tag v-if="scope.row.type==2" type="success">类型二</el-tag>
                <el-tag v-if="scope.row.type==3" type="primary">类型三</el-tag>
              </template>
            </el-table-column>
          </el-table>
            </el-card>
            <!--          申请人-->
              <el-card>
          <el-table :data="subjectlist" size="medium " style="width: 100%; font-size: 15px">
            <el-table-column
              prop="teacherName"
              label="指导教师"
              width="110">
            </el-table-column>
            <el-table-column
              prop="teacherName"
              label="指导教师联系方式"
              width="200">
            </el-table-column>
          </el-table>
            </el-card>
          </el-col>
          <el-col :span="16">
<!--            内容表格卡片-->
            <el-card>
            <el-table
              :data="subjectlist"
              size="medium "
              :default-sort = "{prop: 'date', order: 'descending'}"
              style="width: 100%; font-size: 15px">
              <!--          课题描述-->
              <el-table-column
                :show-overflow-tooltip="true"
                prop="subName"
                label="课题描述"
                width="200">
              </el-table-column>
            </el-table>
            </el-card>
            <el-card>
              <el-table :data="subjectlist" size="medium " style="width: 100%; font-size: 15px">
                <!--          课题要求-->
                <el-table-column
                  prop="teacherName"
                  label="课题要求"
                  width="200">
                </el-table-column>
              </el-table>
            </el-card>
          </el-col>
        </el-row>
      </el-card>
    </el-col>
  </el-row>
    <!--      填写开题报告，上传附件区-->
    <el-card class="bg-bottom">
  <el-row>
    <el-col :span="16">
      <el-card>
        <div class="card_header">填写开题报告基本信息</div>
        <el-form ref="form" :model="form" label-width="80px">
          <el-row>
            <el-col :span="20">
<!--              <el-form-item label="研究意义" prop="description">-->
<!--                <el-input type="textarea" v-model="report.meaning"></el-input>-->
<!--              </el-form-item>-->
              <quill-editor :init-content="'请输入详情'"></quill-editor>
            </el-col>
            <el-col :span="20">
              <el-form-item label="调研结果" prop="requirement">
                <el-input type="textarea" v-model="report.research"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="20">
              <el-form-item label="研究计划">
                <el-input type="textarea" v-model="report.myPlan"></el-input>
              </el-form-item>
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
      currentSubjectInfo: {},
      subjectlist: [],
      report: {
        meaning: '',
        research: '',
        myPlan: '',
        fileList: [{
          name: 'food.jpeg',
          url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
        }, {
          name: 'food2.jpeg',
          url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
        }]
      }
    }
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
  margin-bottom: 50px;
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
</style>
