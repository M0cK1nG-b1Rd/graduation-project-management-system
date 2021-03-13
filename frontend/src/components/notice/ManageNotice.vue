<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>公告管理</el-breadcrumb-item>
      <el-breadcrumb-item>管理公告</el-breadcrumb-item>
    </el-breadcrumb>
    <!--    内容最外层卡片区-->
    <el-card v-if="!addNewNoticePageVisible" style="padding-left: 20px">
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
          <el-button type="primary" size="medium" @click="addNotice">发布新公告</el-button>
        </el-col>
      </el-row>
      <!--      表格区-->
      <el-row>
        <el-table
          border
          :highlight-current-row="true"
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
            :filters="[{ text: '草稿箱', value: 1 }, { text: '已发布', value: 2 }, { text: '回收站', value: 3 }]"
            :filter-method="filterStatus"
            filter-placement="bottom-end"
            label="发布状态">
            <template slot-scope="scope">
              <el-tag type="success" v-if=" scope.row.status == 2">已发布</el-tag>
              <el-tag type="warning" v-if=" scope.row.status == 1">待发布</el-tag>
              <el-tag type="danger" v-if=" scope.row.status == 3">已撤回</el-tag>
            </template>
          </el-table-column>
          <!--          操作-->
          <el-table-column
            :show-overflow-tooltip="true"
            width="200"
            label="操作">
            <template slot-scope="scope">
<!--              查看详细内容-->
              <el-tooltip class="item" effect="dark" content="查看详细内容" placement="top" :enterable="false">
                <el-button type="success" icon="el-icon-view" circle size="mini" @click="viewNotice(scope.row)"></el-button>
              </el-tooltip>
<!--              编辑通知-->
              <el-tooltip class="item" effect="dark" content="编辑通知" placement="top" :enterable="false">
                <el-button type="primary" icon="el-icon-edit" circle size="mini" @click="editNotice(scope.row)"></el-button>
              </el-tooltip>
<!--              删除通知-->
              <el-tooltip class="item" effect="dark" content="删除通知" placement="top" :enterable="false">
                <el-popconfirm
                  @confirm="deleteNotice(scope.row)"
                  style="margin-left: 9px"
                  title="确定要撤回该公告吗？">
                  <el-button slot="reference" type="danger" icon="el-icon-delete" circle size="mini"></el-button>
                </el-popconfirm>
              </el-tooltip>
            </template>
          </el-table-column>
        </el-table>
      </el-row>
      <!--      分页区-->
      <el-row type="flex" style="margin-top: 20px; margin-left: 20px">
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
<!--    发布新公告页面-->
    <el-card v-if="addNewNoticePageVisible">
<!--      公告基本信息区-->
      <el-row type="flex" justify="space-between">
        <!--      公告标题-->
        <el-col :span="10">
          <el-input placeholder="请输入公告标题" v-model="newNoticeInfo.annTitle"></el-input>
        </el-col>
        <!--      公告来源(发布者)-->
        <el-col :span="8">
          <el-input placeholder="请输入公告发布单位,如'软件学院'" v-model="newNoticeInfo.signature"></el-input>
        </el-col>
        <!--      公告类型-->
        <el-col :span="5">
          <el-select v-model="newNoticeInfo.type" placeholder="请选择公告类型">
            <el-option :value="1" :label="'学业通知'"></el-option>
            <el-option :value="2" :label="'答辩安排'"></el-option>
            <el-option :value="3" :label="'工作安排'"></el-option>
          </el-select>
        </el-col>
      </el-row>
<!--      发布新公告--富文本区-->
      <el-row>
        <quill-editor ref="quillEditor"></quill-editor>
      </el-row>
      <!--      操作按钮区-->
      <el-row type="flex" justify="center" style="margin-top: 80px">
        <!--      返回通知栏首页按钮链接-->
        <el-popconfirm
          @confirm="addNewNoticePageVisible = !addNewNoticePageVisible"
        title="确定要返回通知管理首页吗？">
          <el-button type="info" plain slot="reference">
            返回公告首页
          </el-button>
        </el-popconfirm>
        <!--      发布本次编辑-->
        <el-popconfirm
          @confirm="submitNotice"
          title="确定要发布本条通知吗？">
          <el-button type="success" plain slot="reference">发布本次编辑</el-button>
        </el-popconfirm>
        <!--      保存至草稿箱-->
        <el-popconfirm
          @confirm="saveAsDraft"
          title="确定将此次编辑保存至草稿箱吗？">
          <el-button type="warning" plain slot="reference">保存至草稿箱</el-button>
        </el-popconfirm>
        <!--      取消本次编辑-->
        <el-popconfirm
          @confirm="cancelNotice"
          title="确定删除本次编辑吗？">
          <el-button type="danger" plain slot="reference">删除本次编辑</el-button>
        </el-popconfirm>
      </el-row>
    </el-card>
    <!--    查看公告详情对话框-->
    <el-dialog
      :visible.sync="viewPageVisible"
      width="60%">
      <div class="ql-container ql-snow" style="height: 860px">
        <div class="dialog_content ql-editor" v-html="currentNoticeInfo.annDetail"></div>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewPageVisible = false">退出查看</el-button>
      </span>
    </el-dialog>
    <!--    编辑修改公告对话框-->
    <el-dialog
      :visible.sync="editPageVisible"
      width="70%">
        <!--      公告基本信息区-->
        <el-row type="flex" justify="space-between">
          <!--      公告标题-->
          <el-col :span="10">
            <el-input placeholder="请输入公告标题" v-model="currentNoticeInfo.annTitle"></el-input>
          </el-col>
          <!--      公告来源(发布者)-->
          <el-col :span="8">
            <el-input placeholder="请输入公告发布单位,如'软件学院'" v-model="currentNoticeInfo.signature"></el-input>
          </el-col>
          <!--      公告类型-->
          <el-col :span="5">
            <el-select v-model="currentNoticeInfo.type" placeholder="请选择公告类型">
              <el-option :value="1" :label="'学业通知'"></el-option>
              <el-option :value="2" :label="'答辩安排'"></el-option>
              <el-option :value="3" :label="'工作安排'"></el-option>
            </el-select>
          </el-col>
        </el-row>
        <!--      发布新公告--富文本区-->
        <el-row>
          <quill-editor ref="quillEditor" :init-content="currentNoticeInfo.annDetail"></quill-editor>
        </el-row>
        <!--      操作按钮区-->
        <el-row type="flex" justify="center" style="margin-top: 80px">
          <!--      发布本次编辑-->
          <el-popconfirm
            @confirm="submitEdit"
            title="确定要发布本条通知吗？">
            <el-button type="success" plain slot="reference">发布本次编辑</el-button>
          </el-popconfirm>
          <!--      取消本次编辑-->
          <el-popconfirm
            @confirm="cancelEdit"
            title="确定撤销本次编辑吗？">
            <el-button type="danger" plain slot="reference">取消本次编辑</el-button>
          </el-popconfirm>
        </el-row>
    </el-dialog>
  </div>
</template>

<script>
import quillEditor from '@/plugins/quill-editor/VueQuillEditor'

export default {
  name: 'ManageNotice',
  components: {
    quillEditor
  },
  mounted() {
    this.getNotice()
  },
  data() {
    return {
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
      viewPageVisible: false,
      // 编辑修改公告对话框可见性
      editPageVisible: false,
      // 发布新公告窗口可见性
      addNewNoticePageVisible: false,
      // 新增的公告内容
      newNoticeInfo: {
        annDetail: '', // 公告富文本字符串
        annTitle: '', // 公告标题
        signature: '', // 信息laiyuan(发布者)
        status: 1, // 公告状态
        type: '' // 公告类型
      }
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
    // 将前端的更新传到后台(包括：编辑、删除)
    async updateNotice() {
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/announcement', this.currentNoticeInfo)
      if (res.meta.code !== 200) return this.$message.error('更新公告信息失败！')
      await this.getNotice()
    },
    // 将新增的公告发送到后端(发布公告)
    async submitNewNotice() {
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/announcement', this.newNoticeInfo)
      if (res.meta.code !== 200) return this.$message.error('操作失败!')
      this.$message.success('操作成功!')
      await this.getNotice()
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
    // 发布新公告
    addNotice() {
      this.addNewNoticePageVisible = true
    },
    // 查看公告详情
    viewNotice(row) {
      this.viewPageVisible = true
      this.currentNoticeInfo = row
    },
    // 编辑公告
    editNotice(row) {
      this.editPageVisible = true
      this.currentNoticeInfo = row
    },
    // 删除公告
    async deleteNotice(row) {
      this.currentNoticeInfo = row
      this.currentNoticeInfo.status = 3
      await this.updateNotice()
    },
    // ！！！！！！下面是发布新公告页面的方法
    // 提交并发布本次公告编辑结果
    async submitNotice() {
      this.newNoticeInfo.status = 2
      this.newNoticeInfo.annDetail = this.$refs.quillEditor.returnContent()
      await this.submitNewNotice()
      this.addNewNoticePageVisible = false
    },
    // 将本次编辑内容存入草稿箱
    async saveAsDraft() {
      this.newNoticeInfo.status = 1
      this.newNoticeInfo.annDetail = this.$refs.quillEditor.returnContent()
      await this.submitNewNotice()
      this.addNewNoticePageVisible = false
    },
    // 取消本次编辑
    cancelNotice() {
      this.$refs.quillEditor.reset()
      this.addNewNoticePageVisible = false
    },
    // !!!!!!!下面是编辑公告页面的操作
    // 提交公告编辑结果
    submitEdit() {
      this.updateNotice()
      this.editPageVisible = false
    },
    // 取消公告编辑结果
    cancelEdit() {
      this.editPageVisible = false
      this.getNotice()
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
.dialog_content::-webkit-scrollbar{
  width:0;
}
</style>
