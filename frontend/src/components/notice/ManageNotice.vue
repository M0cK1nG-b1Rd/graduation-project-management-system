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
      <!--      搜索框及发布公告按钮-->
      <el-row>
        <!--      搜索框-->
        <el-col :span="12">
          <el-input placeholder="输入关键字查询相关公告"
                    v-model="queryInfo.keyWord" @change="getNotice"
                    class="input-with-select">
            <el-button slot="append" icon="el-icon-search" type="primary"></el-button>
          </el-input>
        </el-col>
        <!--        发布公告按钮-->
        <el-col :span="4" :offset="1">
          <el-button type="primary" size="medium" @click="addNoticeFormVisible = true">发布新公告</el-button>
        </el-col>
      </el-row>
      <!--      表格区-->
      <el-row>
        <el-table
          :data="noticeList"
          size="medium "
          :default-sort = "{prop: 'date', order: 'descending'}"
          style="width: 100%; font-size: 15px">
          <!--          标题-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="annTitle"
            label="标题"
            width="300">
          </el-table-column>
          <!--          日期-->
          <el-table-column
            sortable
            :show-overflow-tooltip="true"
            prop="createTime"
            label="修改时间"
            width="110">
          </el-table-column>
          <!--          类型-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="type"
            label="公告类型"
            width="100"
            :filters="[{ text: '学业通知', value: 1 }, { text: '答辩安排', value: 2 }, { text: '工作安排', value: 3 }]"
            :filter-method="filterType"
            filter-placement="bottom-end">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.type==1" type="info">学业通知</el-tag>
              <el-tag v-if="scope.row.type==2" type="success">答辩安排</el-tag>
              <el-tag v-if="scope.row.type==3" type="primary">工作安排</el-tag>
            </template>
          </el-table-column>
          <!--          状态-->
          <el-table-column
            :show-overflow-tooltip="true"
            prop="status"
            width="120"
            :filters="[{ text: '等待发布', value: 1 }, { text: '已发布', value: 2 }, { text: '已取消发布', value: 3 }]"
            :filter-method="filterStatus"
            filter-placement="bottom-end"
            label="发布状态">
            <template slot-scope="scope">
              <el-tag type="success" v-if=" scope.row.status == 2">已经过发布</el-tag>
              <el-tag type="warning" v-if=" scope.row.status == 1">等待发布</el-tag>
              <el-tag type="danger" v-if=" scope.row.status == 3">已取消发布</el-tag>
            </template>
          </el-table-column>
          <!--          操作-->
          <el-table-column
            :show-overflow-tooltip="true"
            width="200"
            label="操作">
            <template slot-scope="scope">
<!--              查看详细内容-->
              <el-button type="success" icon="el-icon-view" circle size="mini" @click="viewNotice(scope.row)"></el-button>
<!--              编辑通知-->
              <el-button type="primary" icon="el-icon-edit" circle size="mini" @click="editNotice(scope.row)"></el-button>
<!--              删除通知-->
              <el-button type="danger" icon="el-icon-delete" circle size="mini" @click="deleteNotice(scope.row)"></el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-row>
      <!--      分页区-->
      <el-row>
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="queryInfo.page"
          :page-sizes="[5, 10, 20]"
          :page-size="100"
          layout="total, sizes, prev, pager, next, jumper"
          :total="totalPageNum">
        </el-pagination>
      </el-row>
    </el-card>
<!--    查看公告详情对话框-->
    <el-dialog
      :visible.sync="viewPageVisible"
      width="60%">
        <div class="ql-container ql-snow" style="height: 860px">
          <div class="notice_content ql-editor" v-html="currentNoticeInfo.annDetail"></div>
        </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewPageVisible = false">退出查看</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'ManageNotice',
  mounted() {
    this.getNotice()
  },
  data() {
    return {
      // 发布公告窗口可见性
      addNoticeFormVisible: false,
      // （符合要求）公告总数
      totalPageNum: 0,
      // 所有状态的通知信息
      noticeList: [],
      // 正在编辑（改，删）的通知信息
      currentNoticeInfo: {},
      // 向后端发送查询请求及分页信息时用
      queryInfo: {
        status: '', // 需要查询的通知记录状态（1-未发布，2-已发布，3-删除）, 不发送则返回所有类型
        keyWord: '', // 关键词
        page: 1, // 当前页号
        size: 10, // 页面大小
        type: '' // 通知类型（1-学业通知， 2-答辩安排， 3-工作安排）
      },
      // 查看公告详情对话框可见性
      viewPageVisible: false
    }
  },
  methods: {
    // 获取通知信息
    async getNotice() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/announcement', { params: this.queryInfo })
      if (res.meta.code !== 200) return this.$message.error('获取公告信息失败！')
      this.noticeList = res.data.records
      this.totalPageNum = res.data.total
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
    // 筛选公告类型
    filterType(value, row) {
      return row.type === value
    },
    // 筛选公告状态
    filterStatus(value, row) {
      return row.status === value
    },
    // 查看公告详情
    viewNotice(row) {
      this.viewPageVisible = true
      this.currentNoticeInfo = row
      console.log(this.currentNoticeInfo)
    },
    // 编辑公告
    editNotice(row) {},
    // 删除公告
    deleteNotice(row) {}
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
