<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>结题管理</el-breadcrumb-item>
      <el-breadcrumb-item>论文评审安排</el-breadcrumb-item>
    </el-breadcrumb>
    <!--    页面标题-->
    <el-row class="page_header">
      论文评审安排
    </el-row>
    <el-card>
    <el-collapse v-model="activeNames" @change="handleChange">
      <el-collapse-item>
        <template slot="title">
          <a-tag color="blue" class="collapse_title_tag">
            <i class="el-icon-user"></i>
            查看评审人名单
          </a-tag>
        </template>
        <div class="tutor_info">
          <tutor-info></tutor-info>
        </div>
      </el-collapse-item>
      <el-collapse-item>
        <template slot="title">
          <a-tag color="red" class="collapse_title_tag">
            <i class="el-icon-user"></i>
            设置交叉评审安排
          </a-tag>
        </template>
        <el-steps :active="active" finish-status="success">
          <el-step title="开始评审安排"></el-step>
          <el-step title="查看安排信息"></el-step>
          <el-step title="完成评审安排"></el-step>
        </el-steps>
        <el-button style="margin-top: 12px;" @click="startArrange">开始评审安排</el-button>
      </el-collapse-item>
    </el-collapse>
    </el-card>
    <!--    对话框1-->
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible1"
      width="30%"
    >
      <span>获取安排信息成功！</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible1 = false">取 消</el-button>
    <el-button type="primary" @click="viewArrangeInfo">查看安排</el-button>
  </span>
    </el-dialog>
    <!--    对话框2-->
    <el-dialog
      fullscreen="true"
      title="交叉评审安排"
      :visible.sync="dialogVisible2"
      width="30%"
    >
      <!--    卡片区-->
      <!--      主要内容区-->
      <el-row class="subject_zone">
        <div class="card" v-for="(item, index) in allArrangeInfo" :key="index">
          <!--          卡片头--课题名称-->
          <div class="card_header">
            <el-tooltip class="item" effect="dark" :content="item.teacher.realName" placement="top">
              <div class="title_1">
                评阅人：<a-tag color="blue">{{ item.teacher.realName }}</a-tag>
              </div>
            </el-tooltip>
          </div>
          <!--          卡片内分割线-->
          <el-divider class="card_divider"></el-divider>
          <!--          卡片体-->
          <div class="card_body">
            <!--            被评阅人-->
            <div v-for="(item, index) in allArrangeInfo[index].thesisList" :key="index">
              <div class="title_1">
                被评阅人：<el-tag type="success">{{ item.student.realName }}</el-tag>
              </div>
            </div>
            <!--            卡片底部下载论文-->
          </div>
        </div>
      </el-row>
      <!--          分页-->
      <div class="pagination">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="queryInfo.current"
          :page-sizes="[5, 10, 20, 50]"
          :page-size="queryInfo.size"
          layout="sizes, prev, pager, next, jumper">
        </el-pagination>
      </div>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible2 = false">取 消</el-button>
    <el-button type="primary" @click="publishArrange">发布安排</el-button>
  </span>
    </el-dialog>
    <!--    对话框3-->
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible3"
      width="30%"
    >
      <span>评审安排已发布，请通知教师及时查看</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible3 = false">取 消</el-button>
    <el-button type="primary" @click="finishArrange">完成安排</el-button>
  </span>
    </el-dialog>
  </div>
</template>

<script>
import tutorInfo from '@/components/startSubject/arrangePlea/TutorInfo'
export default {
  name: 'CrossJudgeArrange',
  components: { tutorInfo },
  data() {
    return {
      // 查询参数
      queryInfo: {
        page: 1, // 当前页号
        size: 10 // 页面大小
      },
      // 所有课题信息
      allArrangeInfo: [],
      // 总页数
      totalPageNum: 0,
      active: 0,
      dialogVisible1: false,
      dialogVisible2: false,
      dialogVisible3: false
    }
  },
  methods: {
    next() {
      if (this.active++ > 2) this.active = 0
    },
    async startArrange() {
      this.dialogVisible1 = true
      // 获取安排信息，提示安排成功，成功则跳转下一界面
      const { data: res } = await this.$http.post('/thesisGroup')
      if (res.meta.code === 200) {
        this.$message.success('评审安排成功！')
      } else {
        this.$message.error('答辩安排失败！')
      }
      this.next()
    },
    async viewArrangeInfo() {
      this.dialogVisible1 = false
      const { data: res } = await this.$http.get('/thesisGroup', { params: this.queryInfo })
      if (res.meta.code === 200) {
        this.allArrangeInfo = res.data.records
        this.$message.success('获取答辩安排信息成功！')
      } else {
        this.$message.error('获取答辩安排信息失败！')
      }
      this.next()
      this.dialogVisible2 = true
    },
    async publishArrange() {
      this.dialogVisible2 = false
      const { data: res } = await this.$http.put('/thesisGroup')
      if (res.meta.code === 200) {
        this.$message.success('论文交叉互评安排发布成功！')
      } else {
        this.$message.error('论文交叉互评安排发布失败！')
      }
      this.next()
      this.dialogVisible3 = true
    },
    finishArrange() {
      this.dialogVisible3 = false
      this.next()
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.viewArrangeInfo()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.current = newPage
      this.viewArrangeInfo()
    }
  }
}
</script>

<style Lang="less" scoped>
/*页面标题*/
.page_header {
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 20px;
}
/*折叠面板标题中的Tag*/
.collapse_title_tag {
  font-size: 16px;
  color: #343232;
}
/*课题展示区*/
.subject_zone {
  display: flex;
  flex-wrap: wrap;
}
/*课题卡片*/
.card {
  width: 280px;
  height: 240px;
  margin: 8px;
  border-radius: 20px;
  background: #ffffff;
  box-shadow: 20px 20px 60px #d9d9d9,
    -20px -20px 60px #ffffff;
}

/*卡片头, 设置标题太长自动省略，鼠标悬浮显示完整*/
.card_header {
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 10px;
  font-size: 16px;
  text-align: center;
  font-weight: bold;
  /*阴影*/
}

/*长度受限的标题*/
.title_1 {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.card_header:hover .title_2 {
  display: block;
}

/*卡片内分割线*/
.card_divider {
  margin-top: 10px;
  margin-bottom: 10px;
}

/*卡片下方内容*/
.card_body {
  font-size: 16px;
  padding-left: 25px;
  padding-right: 25px;
  display: flex;
  flex-direction: column;
}

/*卡片内，课题简介*/
.subject_breif {
  font-size: 14px;
  margin-top: 5px;
  height: 65px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}

/*卡片脚*/
.card_footer {
}

/*分页区*/
.pagination {
  margin: 20px;
  display: flex;
  justify-content: center;
}
</style>
