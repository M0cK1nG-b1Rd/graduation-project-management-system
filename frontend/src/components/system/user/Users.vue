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
      <!--用户列表区-->
      <el-table :data="userlist" border stripe>
        <el-table-column type="index"></el-table-column>
        <el-table-column label="姓名" prop="username"></el-table-column>
        <el-table-column label="邮箱" prop="email"></el-table-column>
        <el-table-column label="电话" prop="mobile"></el-table-column>
        <el-table-column label="角色" prop="role_name"></el-table-column>
        <el-table-column label="状态" width="100px">
          <template slot-scope="scope">
            <el-switch v-model="scope.row.mg_state" active-color="#13ce66">
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180px">
          <template>
            <!--修改-->
            <el-button type="primary" icon="el-icon-edit" size="mini"></el-button>
            <!--删除-->
            <el-button type="danger" icon="el-icon-delete" size="mini"></el-button>
            <!--分配角色-->
            <el-tooltip effect="dark" content="分配角色" placement="top" enterable="false">
              <el-button type="warning" icon="el-icon-setting" size="mini"></el-button>
            </el-tooltip>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'Users',
  data() {
    return {
      // 获取用户列表的参数对象
      queryInfo: {
        query: '',
        pagenum: 1,
        pagesize: 2
      },
      userlist: [],
      total: 0
    }
  },
  created() {
    this.getUserList()
  },
  methods: {
    async getUserList() { // TODO 等待替换为后端接口
      const { data: res } = await this.$http.get('/mock/user_list_success.json')
      if (res.meta.code !== 200) return this.$message.error('获取用户列表失败！')
      this.userlist = res.data.users
      this.total = res.data.total
    }
  }
}
</script>

<style Lang="less" scoped>

</style>
