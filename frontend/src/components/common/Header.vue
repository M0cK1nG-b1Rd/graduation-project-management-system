<template>
  <div class="header">
      <el-button class="logout" type="info" @click="logout">退出登录</el-button>
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
