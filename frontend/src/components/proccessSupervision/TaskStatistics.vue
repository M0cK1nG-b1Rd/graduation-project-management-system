<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>过程监督</el-breadcrumb-item>
      <el-breadcrumb-item>我的任务</el-breadcrumb-item>
    </el-breadcrumb>
    <!--    外层卡片区-->
    <el-card class="outer_card">
      <!--      页面标题-->
      <el-row type="flex" justify="center" class="page_title">统计数据</el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'TaskStatistics'
}
</script>

<style Lang="less" scoped>
/*外层卡片*/
.outer_card{
  padding: 50px;
}
/*页面标题*/
.page_title{
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}
/*抽屉标题*/
.drawer_title{
  font-size: 20px;
  font-weight: bold;
  text-align: center;
}
/*自定义表单的标题*/
.form_label{
  padding-left: 20px;
  font-size: 16px;
  text-align: start;
}
/*自定义分割线*/
.divider{
  height: 12px;
}
</style>
