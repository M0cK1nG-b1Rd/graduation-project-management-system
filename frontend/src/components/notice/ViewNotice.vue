<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>公告管理</el-breadcrumb-item>
      <el-breadcrumb-item>查看公告</el-breadcrumb-item>
    </el-breadcrumb>
    <!--  卡片视图区-->
    <el-card class="box-card">
      这是公告
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'ViewNotice'
}
</script>

<style Lang='less' scoped>
.el-breadcrumb{
  margin-top: 20px;
  margin-left: 20px;
}
.box-card{
  height: 800px;
}
</style>
