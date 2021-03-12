<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>公告管理</el-breadcrumb-item>
      <el-breadcrumb-item>管理公告</el-breadcrumb-item>
    </el-breadcrumb>
<!--    内容最外层卡片区-->
    <el-card>
<!--      选择公告类型，发布新公告-->
      <el-row>
        <!--      选择公告类型-->
        <el-col :span="8">
          <el-radio-group size="medium" fill="#F56C6C" v-model="radio4">
            <el-radio-button  label="已发布" type="success"></el-radio-button>
            <el-radio-button label="草稿箱"></el-radio-button>
            <el-radio-button label="回收站"></el-radio-button>
          </el-radio-group>
        </el-col>
        <!--        发布公告按钮-->
        <el-col :span="4" >
          <el-button type="primary" size="small">发布新公告</el-button>
        </el-col>
      </el-row>
<!--      搜索框-->
      <el-row>
        <el-col :span="12">
          <el-input placeholder="输入关键字查询相关公告" class="input-with-select">
            <el-button slot="append" icon="el-icon-search" type="primary"></el-button>
          </el-input>
        </el-col>
      </el-row>
<!--      表格区-->
      <el-row>
        <el-table
          :data="tableData"
          style="width: 100%"
          :row-class-name="tableRowClassName">
          <el-table-column
            prop="date"
            label="日期"
            width="180">
          </el-table-column>
          <el-table-column
            prop="name"
            label="姓名"
            width="180">
          </el-table-column>
          <el-table-column
            prop="address"
            label="地址">
          </el-table-column>
        </el-table>
      </el-row>
<!--      分页区-->
      <el-row>
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage4"
          :page-sizes="[100, 200, 300, 400]"
          :page-size="100"
          layout="total, sizes, prev, pager, next, jumper"
          :total="400">
        </el-pagination>
      </el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'ManageNotice',
  components: [],
  mounted() {
    this.getAllNotice()
  },
  data() {
    return {
      // 所有状态的通知信息
      allNoticeInfo: {},
      // 已发布状态的通知信息
      publishedNoticeInfo: {},
      // 未发布 （草稿箱）通知信息
      unpublishedNoticeInfo: {},
      // 已删除通知信息
      deletedNoticeInfo: {},
      // 正在编辑（改，删）的通知信息
      editingNoticeInfo: {},
      // 向后端发送查询请求及分页信息时用
      queryInfo: {
        // status: 2, // 需要查询的通知记录类型（1-未发布，2-已发布，3-删除）, 不发送则返回所有类型
        keyWord: '', // 关键词
        page: 1, // 当前页号
        size: 10 // 页面大小
      },
      tableData: [{
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      }, {
        date: '2016-05-04',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      }, {
        date: '2016-05-01',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      }, {
        date: '2016-05-03',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      }]
    }
  },
  methods: {
    // 获取通知信息
    async getAllNotice() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/announcement', this.queryInfo)
      if (res.meta.code !== 200) return this.$message.error('获取公告信息失败！')
      // console.log(res)
    },
    // 返回表格项颜色
    tableRowClassName({ row, rowIndex }) {
      if (rowIndex === 1) {
        return 'warning-row'
      } else if (rowIndex === 3) {
        return 'success-row'
      }
      return ''
    }
  }
}
</script>

<style Lang="less" scoped>
/*表格状态颜色*/
.el-table .warning-row {
  background: oldlace;
}
/*表格状态颜色*/
.el-table .success-row {
  background: #f0f9eb;
}
</style>
