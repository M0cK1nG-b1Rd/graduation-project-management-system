<template>
  <div>
<!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>我的消息</el-breadcrumb-item>
    </el-breadcrumb>
<!--    页面标题-->
    <el-row type="flex" justify="center" class="page_title">我的消息</el-row>
<!--    消息区-->
    <el-row type="flex" justify="center">
      <el-card class="outer_card">
<!--      表格区-->
        <el-row>
          <el-table
            :highlight-current-row="true"
            :data="messageInfo"
            size="medium "
            :default-sort = "{prop: 'date', order: 'descending'}"
            style="width: 100%; font-size: 15px">
            <!--          标题-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="title"
              label="标题"
              width="200">
            </el-table-column>
            <!--          日期-->
            <el-table-column
              sortable
              :show-overflow-tooltip="true"
              prop="creatTime"
              label="发布时间"
              width="160">
            </el-table-column>
            <!--          来源-->
            <el-table-column
              sortable
              :show-overflow-tooltip="true"
              prop="realName"
              label="消息来源"
              width="120">
            </el-table-column>
            <!--          状态-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="type"
              width="120"
              :filters="[{ text: '未读', value: 'WCK' }, { text: '已读', value: 'YCK' }]"
              :filter-method="filterStatus"
              filter-placement="bottom-end"
              label="状态">
              <template slot-scope="scope">
                <el-tag type="danger" v-if=" scope.row.type == 'WCK'">未读</el-tag>
                <el-tag type="info" v-if=" scope.row.type == 'YCK'">已读</el-tag>
              </template>
            </el-table-column>
            <!--          操作-->
            <el-table-column
              :show-overflow-tooltip="true"
              width="190"
              label="操作">
              <template slot-scope="scope">
                <!--              查看详细内容-->
                <el-tooltip class="item" effect="dark" content="查看详细内容" placement="top" :enterable="false">
                  <el-button type="primary" icon="el-icon-view" circle size="mini" @click="viewDetail(scope.row)"></el-button>
                </el-tooltip>
                <!--              标为已读-->
                <el-tooltip class="item" effect="dark" content="标为已读" placement="top" :enterable="false">
                  <el-button type="success" icon="el-icon-circle-check" circle size="mini" @click="noteAsRead(scope.row)"></el-button>
                </el-tooltip>
                <!--              标为未读-->
                <el-tooltip class="item" effect="dark" content="标为未读" placement="top" :enterable="false">
                  <el-button type="warning" icon="el-icon-circle-close" circle size="mini" @click="noteAsUnread(scope.row)"></el-button>
                </el-tooltip>
                <!--              删除通知-->
                <el-tooltip class="item" effect="dark" content="删除通知" placement="top" :enterable="false">
                  <el-popconfirm
                    @confirm="deleteMessage(scope.row)"
                    style="margin-left: 9px"
                    title="删除后不可撤回，确定要删除该条通知吗？">
                    <el-button slot="reference" type="danger" icon="el-icon-delete" circle size="mini"></el-button>
                  </el-popconfirm>
                </el-tooltip>
              </template>
            </el-table-column>
          </el-table>
        </el-row>
<!--      分页区-->
        <el-row type="flex" justify="center">
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="queryInfo.page"
            :page-sizes="[5, 10, 20]"
            :page-size="queryInfo.size"
            layout="total, sizes, prev, pager, next, jumper"
            :total="totalPageNum">
          </el-pagination>
        </el-row>
      </el-card>
<!--      消息详情对话框-->
      <el-dialog
        :visible.sync="detailPageVisivle"
        width="50%">
<!--        消息内容-->
        <div class="ql-container ql-snow" style="height: 80%">
          <div class="dialog_content ql-editor" v-html="currentMessageInfo.detail"></div>
        </div>
        <span slot="footer" class="dialog-footer">
         <el-button type="primary" @click="detailPageVisivle = false">退出查看</el-button>
        </span>
      </el-dialog>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'Message',
  mounted() {
    this.getMessageInfo()
  },
  data() {
    return {
      messageInfo: [],
      queryInfo: {
        page: 1, // 当前页面
        size: 10 // 页面大小
      },
      totalPageNum: Number,
      currentMessageInfo: {},
      detailPageVisivle: false,
      updateingMessageId: []
    }
  },
  methods: {
    // 获得消息内容
    async getMessageInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/message/all', { params: this.queryInfo })
      if (res.meta.code === 200) {
        this.messageInfo = res.data.records
        this.totalPageNum = res.data.total
      } else {
        this.$message.error(res.meta.message)
      }
    },
    // 筛选消息状态
    filterStatus(value, row) {
      return row.type === value
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.getMessageInfo()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.page = newPage
      this.getMessageInfo()
    },
    // 查看详细内容
    viewDetail(row) {
      this.currentMessageInfo = row
      this.detailPageVisivle = true
    },
    // 标为已读
    async noteAsRead(row) {
      this.updateingMessageId = []
      this.updateingMessageId.push(row.messageId)
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/message/read', this.updateingMessageId)
      if (res.meta.code === 200) {
        this.$message.success(res.meta.message)
      } else {
        this.$message.error(res.meta.message)
      }
      await this.getMessageInfo()
    },
    // 标为未读
    async noteAsUnread(row) {
      this.updateingMessageId = []
      this.updateingMessageId.push(row.messageId)
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/message/unread', this.updateingMessageId)
      if (res.meta.code === 200) {
        this.$message.success(res.meta.message)
      } else {
        this.$message.error(res.meta.message)
      }
      await this.getMessageInfo()
    },
    // 删除消息
    async deleteMessage(row) {
      this.updateingMessageId = []
      this.updateingMessageId.push(row.messageId)
      const { data: res } = await this.$http.delete('http://127.0.0.1:9528/message/delete', this.updateingMessageId)
      if (res.meta.code === 200) {
        this.$message.success(res.meta.message)
      } else {
        this.$message.error(res.meta.message)
      }
      await this.getMessageInfo()
    }
  }
}
</script>

<style Lang="less" scoped>
/*页面标题*/
.page_title{
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}
/*外层卡片*/
.outer_card{
  width: 85%;
  border-radius: 4px;
  background: #ffffff;
  box-shadow: 28px 28px 56px #bababa,
    -28px -28px 56px #ffffff;
}
/*消息详情*/
.dialog_content{
  font-size: 15px;
}
</style>
