<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>公告管理</el-breadcrumb-item>
      <el-breadcrumb-item>查看公告</el-breadcrumb-item>
    </el-breadcrumb>
    <!--  卡片视图区-->
    <el-card class="box-card">
      <!--      页面标题-->
      <el-row type="flex" justify="center" class="page_title">
        <span>系统通知栏</span>
      </el-row>
      <!--      分割线-->
      <el-row>
        <el-divider></el-divider>
      </el-row>
      <!--      页面主体信息-->
      <el-row class="page_body">
        <el-container>
          <!--      侧边栏-->
          <el-aside>
            <el-card class="carousel">
              <el-carousel height="150px">
                <el-carousel-item v-for="item in 4" :key="item">
                  <h3 class="small">{{ item }}</h3>
                </el-carousel-item>
              </el-carousel>
            </el-card>
              <el-card class="classification_zone">这是分类区</el-card>
          </el-aside>
          <!--       右侧内容区-->
          <el-main>
            <el-card class="content_zone"></el-card>
          </el-main>
        </el-container>
      </el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'ViewNotice'
}
</script>

<style Lang='less' scoped>
.el-breadcrumb {
  margin-top: 20px;
  margin-left: 20px;
}

.box-card {
  height: 800px;
}

/*页面上方标题区*/
.page_title {
  font-size: 25px;
  font-weight: bold;
}
/*左侧上方轮播表*/
.carousel{
  margin-bottom: 10px;
}
/*左侧下方分类区*/
.classification_zone{
}
.el-main{
  padding-top: 0;
  padding-bottom: 0;
}
/*主体内容区*/
.content_zone{
  height: 100%;
}
</style>
