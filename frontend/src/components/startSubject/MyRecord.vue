<template>
  <div>
  <!--    面包屑导航区域-->
  <el-breadcrumb separator-class="el-icon-arrow-right">
    <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item>开题管理</el-breadcrumb-item>
    <el-breadcrumb-item>报告记录</el-breadcrumb-item>
  </el-breadcrumb>
  </div>
</template>

<script>
export default {
  name: 'MyRecord'
}
</script>

<style scoped>

</style>
