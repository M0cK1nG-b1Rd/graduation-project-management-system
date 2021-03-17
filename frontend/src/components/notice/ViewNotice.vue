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
      <el-row v-if="Visible" type="flex" justify="center" class="page_title">
        <span>系统通知栏</span>
      </el-row>
      <!--      分割线-->
      <el-row v-if="Visible">
        <el-divider></el-divider>
      </el-row>
      <!--      返回通知栏首页按钮链接-->
      <el-row v-if="!Visible">
        <el-button type="text" @click="Visible = !Visible">返回公告首页</el-button>
      </el-row>
      <!--      页面主体信息-->
      <el-row class="page_body">
        <el-container>
          <!--      侧边栏-->
          <el-aside width="400px" v-if="Visible">
            <!--            侧边栏轮播图片区-->
            <el-card class="carousel">
              <el-carousel height="150px" :interval="2000">
                <!--                  轮播卡片01-->
                <el-carousel-item class="carousel_box">
                    <!--                    轮播卡片图片-->
                      <img src="../../assets/imgs/gongGaoLan/lunbotu01.jpg" title="晋校长视察学校食堂，与学生共进午餐" class="carousel_box_img">
                    <!--                    轮播卡片描述-->
                    <div class="carousel_box_desc"></div>
                </el-carousel-item>
                <!--                  轮播卡片02-->
                <el-carousel-item class="carousel_box">
                    <!--                    轮播卡片图片-->
                      <img src="../../assets/imgs/gongGaoLan/lunbotu02.jpg" title="晋校长视察学生机房，与学生一同观看猫和老鼠"  class="carousel_box_img">
                    <!--                    轮播卡片描述-->
                    <div class="carousel_box_desc"></div>
                </el-carousel-item>
              </el-carousel>
            </el-card>
            <!--            侧边栏最新通知及分类区-->
            <el-card class="classification_zone">
              <!--            分类选择按钮-->
              <div style="margin-top: 20px" class="classification_button">
                <el-radio-group v-model="queryInfo.type" @change="handletypeChange"
                                style="display: flex; justify-content: center">
                  <el-radio-button label="1" value="1">学业通知</el-radio-button>
                  <el-radio-button label="2" value="2">答辩安排</el-radio-button>
                  <el-radio-button label="3" value="3">工作安排</el-radio-button>
                </el-radio-group>
              </div>
              <!--           通知表格搜索框-->
              <el-input prefix-icon="el-icon-search" v-model="queryInfo.keyWord"
                        @change="getNotice"
                        placeholder="输入关键字搜索" style="margin-top: 5px">
              </el-input>
              <!--            通知表格-->
              <el-table
                :data="noticeList"
                style="width: 100%">
                <el-table-column
                  :show-overflow-tooltip="true"
                  prop="annTitle"
                  width="235px"
                  label="标题">
                </el-table-column>
                <el-table-column
                  :show-overflow-tooltip="true"
                  prop="createTime"
                  label="发布日期"
                  width="85px">
                </el-table-column>
                <el-table-column
                  label=""
                  width="35px">
                  <template slot-scope="scope">
                    <i class="el-icon-view" @click="viewDetail(scope.row)"></i>
                  </template>
                </el-table-column>
              </el-table>
<!--              分页-->
              <el-pagination
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page="queryInfo.page"
                :page-sizes="[5, 10]"
                :page-size="queryInfo.size"
                layout="total, sizes, prev, pager, next"
                :total="totalPageNum">
              </el-pagination>
            </el-card>
          </el-aside>
          <!--       右侧通知详情内容区-->
          <el-main>
<!--              通知内容-->
              <div class="ql-container ql-snow" style="height: 860px">
                <div class="notice_content ql-editor" v-html="noticeDetial"></div>
              </div>
          </el-main>
        </el-container>
      </el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'ViewNotice',
  created() {
    this.getNotice()
  },
  data() {
    return {
      // 左侧边框可见性
      Visible: true,
      // 查询分页时，向后端发送的参数信息
      queryInfo: {
        status: 2, // 需要查询的通知记录类型（1-未发布，2-已发布，3-删除）
        keyWord: '', // 关键词
        page: 1, // 当前页号
        size: 10, // 页面大小
        type: 1 // 通知类型（1-学业通知， 2-答辩安排， 3-工作安排）
      },
      // 当前页编号
      currentPage: 1,
      // 总共页数
      totalPageNum: 1,
      // 通知列表信息
      noticeList: [],
      // 选中通知的内容
      noticeDetial: '',
      // 选中通知的标题
      noticeTitle: ''
    }
  },
  methods: {
    async getNotice() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/announcement', { params: this.queryInfo })
      if (res.meta.code !== 200) return this.$message.error('获取公告信息失败！')
      // console.log(res)
      this.noticeList = res.data.records
      this.totalPageNum = res.data.total
      this.noticeDetial = res.data.records[0].annDetail
      this.noticeTitle = res.data.records[0].annTitle
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.getNotice()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.page = newPage
      this.getNotice()
    },
    // 处理公告类型改变
    handletypeChange(newType) {
      this.queryInfo.type = newType
      this.getNotice()
    },
    // 查看选中公告详情
    viewDetail(row) {
      this.noticeDetial = row.annDetail
      this.noticeTitle = row.annTitle
      this.Visible = false
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

/*卡片组件*/
.el-card{
  padding: 0 !important;
}
/*页面上方标题区,不是通知内容标题*/
.page_title {
  background-color: #cccccc;
  border-radius: 10px;
  background: linear-gradient(145deg, #cacaca, #f0f0f0);
  box-shadow:  20px 20px 60px #bebebe,
    -20px -20px 60px #ffffff;
  font-size: 25px;
  font-weight: bold;
}

/*左侧上方轮播表*/
.carousel {
  margin-bottom: 10px;
}

.el-main {
  padding-top: 0;
  padding-bottom: 0;
}
/*选中通知标题区*/
.notice_title{
  font-size: 25px;
  font-weight: bold;
  text-align: center;
}
/*选中通知内容区*/
.notice_content {
  padding: 10px;
  height: 100%;
}

.notice_content::-webkit-scrollbar{
  width:0;
}

/*轮播卡片*/
.carousel_box {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
}
/*轮播卡片图片*/
.carousel_box_img{
  height: 200px;
  width: 300px;
}
/*轮播卡片描述*/
.carousel_box_desc {
  text-align: center;
  z-index: 999;
  font-size: 13px;
}

/*左侧下方分类区*/
.classification_zone {
  padding: 0px !important;
}

/*单选按钮*/
.el-radio-button {
  margin-top: 0;
}

.el-card {
  padding: 0 !important;
  margin: 0 !important;
}
</style>
