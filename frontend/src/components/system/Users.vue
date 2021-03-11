<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>系统管理</el-breadcrumb-item>
      <el-breadcrumb-item>用户管理</el-breadcrumb-item>
    </el-breadcrumb>
    <!--  卡片视图区-->
    <el-card class="box-card">
      <!--      搜索与添加区-->
      <el-row :gutter="20">
        <!--        搜索框-->
        <el-col :span="12">
          <el-input placeholder="请输入内容">
            <el-button slot="append" icon="el-icon-search"></el-button>
          </el-input>
        </el-col>
        <!--        按钮区-->
        <el-col :span="6">
          <el-button type="primary">添加用户</el-button>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'Users',
  data() {
    return {}
  },
  created() {
    this.getUserList()
  },
  methods: {
    async getUserList() {
      const { data: res } = await this.$http.get('/mock/userlist_success')
      if (res.meta.status !== 200) return this.$message.error('获取用户列表失败！')
    }
  }
}
</script>

<style Lang="less" scoped>

</style>
