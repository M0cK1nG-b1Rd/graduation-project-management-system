<template>
  <div>
    <el-button type="info" @click="logout">退出登录</el-button>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {}
  },
  methods: {
    logout() {
      // 清空sessionStorage
      window.sessionStorage.clear()
      // 强制导航到登录页面
      this.$router.push('/login')
    }
  }
}
</script>

<style Lang="less" scoped>

</style>
