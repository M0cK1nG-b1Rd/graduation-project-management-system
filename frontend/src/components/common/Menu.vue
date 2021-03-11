<template>
  <!--        侧边栏菜单区-->
  <el-menu
    :collapse="isCollapsed"
    :default-active="activePath"
    :collapse-transition="false"
    background-color="#393e46"
    text-color="#fff"
    router
    active-text-color="#41b883"
    unique-opened>
    <!--    系统主页-->
<!--    <el-menu-item :index="'0'">-->
<!--      <template slot="title">-->
<!--        <i class="el-icon-location"></i>-->
<!--        <span>系统主页</span>-->
<!--      </template>-->
<!--    </el-menu-item>-->
    <!--          一级菜单-->
    <el-submenu :index="item.path"
                :disabled="item.disable"
                v-for="item in menuList"
                :key="item.id">
      <!--            一级菜单的模板区-->
      <template slot="title">
        <!--              菜单图标-->
        <i :class="item.icon"></i>
        <!--              文本（菜单名）-->
        <span>{{item.name}}</span>
      </template>
      <!--            二级菜单-->
      <el-menu-item :index="subItem.path"
                    @click="saveNavState(subItem.path)"
                    :disabled="subItem.disable"
                    v-for="subItem in item.children"
                    :key="subItem.id">
        <template slot="title">
          <i :class="subItem.icon"></i>
          <span>{{ subItem.name }}</span>
        </template>
      </el-menu-item>
    </el-submenu>
  </el-menu>
</template>

<script>
export default {
  name: 'Menu',
  props: ['isCollapsed'],
  data() {
    return {
      // 菜单数据
      menuList: [],
      // 被激活的菜单路由
      activePath: ''
    }
  },
  // 创建时，先向后台申请菜单信息
  created() {
    this.getMeunList()
    this.activePath = window.sessionStorage.getItem('activePath')
  },
  methods: {
    // 获取所有的菜单
    async getMeunList() {
      // TODO 像后端请求菜单列表信息
      const { data: res } = await this.$http.get('/mock/menu_list_success.json')
      if (res.meta.status !== 200) return this.$message.error(res.meta.msg)
      this.menuList = res.data
    },
    // 保存菜单的激活状态，以便实现路由跳转后选中菜单的高亮
    saveNavState(activePath) {
      window.sessionStorage.setItem('activePath', activePath)
      this.activePath = activePath
    }
  }
}
</script>

<style scoped>
.el-menu{
  border-right: none;
}
</style>
