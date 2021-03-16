<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>开题管理</el-breadcrumb-item>
      <el-breadcrumb-item>答辩安排</el-breadcrumb-item>
    </el-breadcrumb>
<!--    -->
    <el-row type="flex" justify="center">
      <el-card class="outer_card">
<!--        折叠框-->
        <el-collapse>
<!--          折叠框1--查看答辩学生名单-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#FFFFCC" class="collapse_title_tag">
                <i class="el-icon-user"></i>
                查看答辩学生名单
              </a-tag>
            </template>
            <div class="stu_info">
              <stu-info></stu-info>
            </div>
          </el-collapse-item>
<!--          折叠框2--查看答辩专家名单-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#FFCCCC" class="collapse_title_tag">
                <a-icon type="team" />
                查看答辩专家名单
              </a-tag>
            </template>
            <div class="tutor_info">
              <tutor-info></tutor-info>
            </div>
          </el-collapse-item>
<!--          折叠框3--设置分组信息（组数）-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#f4f4f2" class="collapse_title_tag">
                <i class="el-icon-help"></i>
                设置分组信息
              </a-tag>
            </template>
          </el-collapse-item>
<!--          折叠框4--查看分组结果并设置答辩信息-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#CCFFFF" class="collapse_title_tag">
                <i class="el-icon-files"></i>
                查看答辩学生名单
              </a-tag>
            </template>
          </el-collapse-item>
        </el-collapse>
      </el-card>
    </el-row>
  </div>
</template>

<script>
import stuInfo from '@/components/startSubject/arrangePlea/StudentInfo'
import tutorInfo from '@/components/startSubject/arrangePlea/TutorInfo'
export default {
  name: 'ArrangePlea',
  components: { stuInfo, tutorInfo }
}
</script>

<style Lang="less" scoped>
/*最外层卡片*/
.outer_card{
  width: 100%;
  border-radius: 4px;
  background: #ffffff;
  box-shadow:  28px 28px 56px #bababa,
    -28px -28px 56px #ffffff;
}
/*折叠面板标题中的Tag*/
.collapse_title_tag {
  font-size: 16px;
  color: #343232;
}
/*第一个折叠框内容--学生信息*/
.stu_info{
}
</style>
