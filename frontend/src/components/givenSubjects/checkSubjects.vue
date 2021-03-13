<template>
    <div>
      <!--    面包屑导航区域-->
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>出题管理</el-breadcrumb-item>
        <el-breadcrumb-item>审核列表</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
</template>

<script>
export default {
  name: 'checkSubjects'
}
</script>

<style scoped>

</style>
