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
          <el-aside width="400px">
<!--            侧边栏轮播图片区-->
            <el-card class="carousel">
              <el-carousel height="150px" :interval="2000">
                <el-carousel-item>
<!--                  轮播卡片01-->
                  <div class="carousel_box">
<!--                    轮播卡片内容-->
                    <div class="carousel_box_content">
                      <img src="../../assets/imgs/gongGaoLan/lunbotu01.jpg" alt="" style="height: 130px">
                    </div>
<!--                    轮播卡片描述-->
                    <div class="carousel_box_desc">晋校长视察学校食堂，与学生共进午餐</div>
                  </div>
                </el-carousel-item>
                <el-carousel-item>
<!--                  轮播卡片02-->
                  <div class="carousel_box">
<!--                    轮播卡片内容-->
                    <div class="carousel_box_content">
                      <img src="../../assets/imgs/gongGaoLan/lunbotu02.jpg" alt="" style="height: 130px">
                    </div>
<!--                    轮播卡片描述-->
                    <div class="carousel_box_desc">晋校长视察学生机房，与学生一同观看猫和老鼠</div>
                  </div>
                </el-carousel-item>
              </el-carousel>
            </el-card>
<!--            侧边栏最新通知及分类区-->
            <el-card class="classification_zone">
<!--            分类选择按钮-->
              <div style="margin-top: 20px" class="classification_button">
                <el-radio-group size="medium">
                  <el-radio-button label="答辩安排" ></el-radio-button>
                  <el-radio-button label="学业通知"></el-radio-button>
                  <el-radio-button label="工作安排"></el-radio-button>
                </el-radio-group>
              </div>
<!--            最新通知表格-->
              <el-table
                :data="newestNoticeData"
                style="width: 100%">
                <el-table-column
                  prop="date"
                  label="日期"
                  width="100">
                </el-table-column>
                <el-table-column
                  prop="address"
                  width="250px"
                  label="地址">
                </el-table-column>
              </el-table>
<!--            查看更多-按钮-->
              <div>
                <el-link>查看更多<i class="el-icon-view el-icon--right" type="primary"></i> </el-link>
              </div>
            </el-card>
          </el-aside>
          <!--       右侧通知详情内容区-->
          <el-main>
            <el-card class="content_zone">
              <quill-editor></quill-editor>
            </el-card>
          </el-main>
        </el-container>
      </el-row>
    </el-card>
  </div>
</template>

<script>
import quillEditor from '@/plugins/VueQuillEditor'
export default {
  name: 'ViewNotice',
  components: { quillEditor },
  data() {
    return {
      newestNoticeData: [{
        date: '2016-05-02',
        address: '上海市普陀区金沙江路 1518 弄'
      }, {
        date: '2016-05-04',
        address: '上海市普陀区金沙江路 1517 弄'
      }, {
        date: '2016-05-01',
        address: '上海市普陀区金沙江路 1519 弄'
      }, {
        date: '2016-05-03',
        address: '上海市普陀区金沙江路 1516 弄'
      }, {
        date: '2016-05-04',
        address: '上海市普陀区金沙江路 1517 弄'
      }, {
        date: '2016-05-01',
        address: '上海市普陀区金沙江路 1519 弄'
      }, {
        date: '2016-05-03',
        address: '上海市普陀区金沙江路 1516 弄'
      }, {
        date: '2016-05-04',
        address: '上海市普陀区金沙江路 1517 弄'
      }, {
        date: '2016-05-01',
        address: '上海市普陀区金沙江路 1519 弄'
      }, {
        date: '2016-05-03',
        address: '上海市普陀区金沙江路 1516 弄'
      }
      ]
    }
  }
}
</script>

<style Lang='less' scoped>
.el-breadcrumb {
  margin-top: 20px;
  margin-left: 20px;
}
/*视图区最外层卡片*/
.box-card {
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
.el-main{
  padding-top: 0;
  padding-bottom: 0;
}
/*主体内容区*/
.content_zone{
  height: 100%;
}
/*轮播卡片*/
.carousel_box{
  display: flex;
  justify-content: center;
  align-content: end;
}
/*轮播卡片描述*/
.carousel_box_desc{
  text-align: center;
  z-index: 999;
  font-size: 15px;
}
/*左侧下方分类区*/
.classification_zone{
  padding: 0px !important;
}
/*单选按钮*/
.el-radio-button{
  margin-top: 0;
}
.el-card{
  padding: 0 !important;
  margin: 0 !important;
}
</style>
