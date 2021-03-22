<template>
  <div class="header">
<!--      <el-button class="logout" type="info" @click="logout">退出登录</el-button>-->
    <el-dropdown>
      <span class="el-dropdown-link" style="height: 100%; font-size: 15px">
        用户中心<a-icon type="user" />
      </span>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item icon="el-icon-caret-left"><span @click="logout">退出登陆</span></el-dropdown-item>
        <el-dropdown-item icon="el-icon-phone">消息通知<a-badge count="25" style="font-size: 10px"/></el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
export default {
  name: 'Header',
  props: ['isCollapsed'],
  data() {
    return {
      isCollapsedcpy: this.isCollapsed,
      toggle_icon: 'el-icon-s-unfold'
    }
  },
  methods: {
    // 退出登录
    logout() {
      // 清空sessionStorage
      window.sessionStorage.clear()
      // 强制导航到登录页面
      this.$router.push('/login')
    }
  }
}
</script>

<style scoped>
.header {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

</style>
