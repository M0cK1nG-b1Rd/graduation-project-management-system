<template>
  <div class="header">
    <!--       logo及系统名区-->
    <div id="header_left">
      <img src="../../assets/imgs/login_logo.jpg" alt="" class="header_left_logo">
      <span class="header_left_title" v-if="!isCollapsedcpy">快乐毕设系统</span>
      <!--            收起、关闭菜单图标-->
      <div id="toggle_icon">
        <i :class="isCollapsedcpy ? 'el-icon-s-unfold' : 'el-icon-s-fold'" @click="toggleCollapse"></i>
      </div>
    </div>
    <div class="logout">
      <el-button type="info" @click="logout">退出登录</el-button>
    </div>
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
    },
    // 菜单展开、折叠切换
    toggleCollapse() {
      this.isCollapsedcpy = !this.isCollapsedcpy
      if (this.isCollapsedcpy) {
        document.getElementById('toggle_icon').style.paddingLeft = '0px'
        document.getElementById('header_left').style.width = '64px'
      } else {
        document.getElementById('toggle_icon').style.paddingLeft = '15px'
        document.getElementById('header_left').style.width = '220px'
      }
      this.$emit('MenuCollapse', this.isCollapsed)
    }
  }
}
</script>

<style scoped>
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

#header_left {
  width: 220px;
  height: 40px;
  display: flex;
  align-items: center;
  padding-left: 0px;
  background-color: #41b883;
  position: sticky;
  top: 0;
  /*置于顶层*/
  z-index: 999;
}

.header_left_logo {
  height: 35px;
  border-radius: 50%;
  margin-left: 10px;
  box-shadow: 0 0 2px #ffecec;
}

.header_left_title {
  margin-left: 10px;
  color: #FFFFFF;
  font-size: 20px;
  font-weight: bold;
  font-family: Microsoft YaHei;
  text-shadow: 0 0 2px #000000;
}

#toggle_icon {
  /*display: inline-block;*/
  padding-left: 15px;
  font-size: 20px;
  cursor: pointer;
}
</style>
