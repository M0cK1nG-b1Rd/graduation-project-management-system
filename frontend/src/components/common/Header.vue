<template>
  <div class="header">
<!--    用户中心下拉菜单-->
   <el-dropdown>
      <span class="el-dropdown-link" style="height: 100%; font-size: 15px">
        用户中心<a-icon type="user" />
      </span>
      <el-dropdown-menu slot="dropdown">
<!--        消息通知-->
        <el-dropdown-item icon="el-icon-phone">
          <span @click="gotoMessagePage">消息通知</span>
          <a-badge :count="unreadMessageNum" style="font-size: 10px"/>
        </el-dropdown-item>
<!--        退出登录-->
        <el-dropdown-item icon="el-icon-caret-left">
          <span @click="logout">退出登录</span>
        </el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
export default {
  name: 'Header',
  props: ['isCollapsed'],
  mounted() {
    this.getUnreadMessageNum()
  },
  data() {
    return {
      // 未读消息个数
      unreadMessageNum: Number
    }
  },
  methods: {
    // 退出登录
    logout() {
      // 清空sessionStorage
      window.sessionStorage.clear()
      // 强制导航到登录页面
      this.$router.push('/login')
    },
    // 获得当前未读消息数
    async getUnreadMessageNum() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/message')
      if (res.meta.code === 200) {
        this.unreadMessageNum = res.data
      } else {
        this.$message.error(res.meta.message)
      }
    },
    // 前往查看通知消息页面
    gotoMessagePage() {
      this.$router.push('/message')
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
