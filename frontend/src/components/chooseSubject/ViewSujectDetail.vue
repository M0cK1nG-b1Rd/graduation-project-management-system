<template>
  <div>
<!--    页面标题-->
    <el-row class="page_header">
      查看课题详情
    </el-row>
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
              <el-link :href="currentSubjectInfo.teacherHomePage" target="_blank" style="font-size: 15px;">
                {{currentSubjectInfo.teacherName+' '}}<i class="el-icon-view"></i>
              </el-link>
            </a-tag>
          </el-col>
<!--          课题领域-->
          <el-col :span="8">课题领域：<a-tag color="cyan" style="font-size: 15px; color: #333333">{{currentSubjectInfo.zone}}</a-tag></el-col>
<!--          所属专业-->
          <el-col :span="8">所属学院：<a-tag color="#87d068" style="font-size: 15px;">{{currentSubjectInfo.collegeName}}</a-tag></el-col>
        </el-row>
        <el-divider></el-divider>
<!--          课题要求-->
        <el-row type="flex" align="center">
          <el-col :span="4" class="item_label">选题要求：</el-col>
          <el-col :span="20">
            <div class="ql-container ql-snow">
              <div class="ql-editor" v-html="currentSubjectInfo.requirement" style="font-size: 15px"></div>
            </div>
          </el-col>
        </el-row>
        <el-divider></el-divider>
<!--          课题描述-->
        <el-row type="flex" align="center">
          <el-col :span="4" class="item_label">课题内容：</el-col>
          <el-col :span="20">
            <div class="ql-container ql-snow">
              <div class="ql-editor" v-html="currentSubjectInfo.description" style="font-size: 15px"></div>
            </div>
          </el-col>
        </el-row>
        <el-divider></el-divider>
<!--        附件-->
        <el-row type="flex" align="center">
          <el-col :span="4" class="item_label">附件下载：</el-col>
          <el-col :span="16">
            <el-row type="flex" justify="center">
              <Downloader :doc-id="docId"></Downloader>
            </el-row>
          </el-col>
        </el-row>
      </el-card>
    </el-row>
<!--    返回上一页（查看所有课题）按钮-->
    <el-row type="flex" justify="center" style="margin-top: 30px">
      <el-button type="primary" plain icon="el-icon-arrow-left"
                 @click="returnAllSubjectPage">
        回到上一页
      </el-button>
    </el-row>
  </div>
</template>

<script>
import Downloader from '@/plugins/upload-download/Downloader'
export default {
  name: 'ViewSubjectDetail',
  components: { Downloader },
  created() {
    this.currentSubjectInfo = this.$route.params
    this.docId = this.currentSubjectInfo.docId
  },
  data() {
    return {
      docId: '',
      // 当前课题信息
      currentSubjectInfo: {}
    }
  },
  methods: {
    returnAllSubjectPage() {
      this.$router.push('/subject/all')
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
/*分割线*/
.el-divider{
  margin: 6px;
}
/*富文本字体大小*/
.ql-editor{
  font-size: 15px;
}
/*表单标签*/
.item_label{
  display: flex;
  align-items: center;
}
</style>
