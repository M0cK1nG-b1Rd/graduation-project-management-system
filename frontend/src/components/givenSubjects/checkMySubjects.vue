<template>
    <div>
      <!--    面包屑导航区域-->
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>出题管理</el-breadcrumb-item>
        <el-breadcrumb-item>审核状态</el-breadcrumb-item>
      </el-breadcrumb>
  <!--卡片视图区-->
  <el-card class="el-card">
    <!--搜索区-->
    <el-row :gutter="20">
      <el-col :span="7">
        <el-input placeholder="请输入关键词查询课题信息">
          <el-button slot="append" icon="el-icon-search"></el-button>
        </el-input>
      </el-col>
      <el-col :span="4"></el-col>
    </el-row>
    <!--      表格区-->
    <el-row>
      <el-table
        :data="subjectlist"
        size="medium "
        :default-sort = "{prop: 'date', order: 'descending'}"
        style="width: 100%; font-size: 15px">
        <!--          课题名称-->
        <el-table-column
          :show-overflow-tooltip="true"
          prop="subName"
          label="课题名称"
          width="300">
        </el-table-column>
        <!--          申请日期-->
        <el-table-column
          sortable
          :show-overflow-tooltip="true"
          prop="poseTime"
          label="申请日期"
          width="110">
        </el-table-column>
        <!--          申请人-->
        <el-table-column
          sortable
          :show-overflow-tooltip="true"
          prop="teacherName"
          label="申请人"
          width="110">
        </el-table-column>
        <!--        课题类型-->
        <el-table-column
          :show-overflow-tooltip="true"
          prop="type"
          label="课题类型"
          width="100"
          :filters="[{ text: '学业通知', value: 1 }, { text: '答辩安排', value: 2 }, { text: '工作安排', value: 3 }]"
          :filter-method="filterType"
          filter-placement="bottom-end">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.type==1" type="info">类型一</el-tag>
            <el-tag v-if="scope.row.type==2" type="success">类型二</el-tag>
            <el-tag v-if="scope.row.type==3" type="primary">类型三</el-tag>
          </template>
        </el-table-column>
        <!--         课题状态-->
        <el-table-column
          :show-overflow-tooltip="true"
          prop="status"
          width="120"
          :filters="[{ text: '待审核', value: 1 }, { text: '已通过', value: 2 }, { text: '未通过', value: 3 }]"
          :filter-method="filterStatus"
          filter-placement="bottom-end"
          label="课题状态">
          <template slot-scope="scope">
            <el-tag type="success" v-if=" scope.row.status == '2'">已通过</el-tag>
            <el-tag type="warning" v-if=" scope.row.status == '0'">待审核</el-tag>
            <el-tag type="danger" v-if=" scope.row.status == '3'">未通过</el-tag>
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
              <el-button type="success" icon="el-icon-view" circle size="mini" @click="viewSubject(scope.row)"></el-button>
            </el-tooltip>
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
      <!--    查看课题详情对话框-->
      <el-dialog
        :visible.sync="viewPageVisible"
        width="60%">
        <el-form ref="subject" :model="currentSubjectInfo" label-width="80px">
          <el-row>
            <el-col :span="10">
              <el-form-item label="课题名称">
                <el-input v-model="currentSubjectInfo.subName"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="7">
              <el-form-item label="申报人">
                <el-input v-model="currentSubjectInfo.teacherName"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="10">
              <el-form-item label="题目类型">
                <el-input v-model="currentSubjectInfo.type"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="申报时间">
                <el-row>
                  <el-input v-model="currentSubjectInfo.poseTime"></el-input>
                </el-row>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="6">
              <el-form-item label="指导教师">
                <el-input v-model="currentSubjectInfo.teacherName"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="7">
              <el-form-item label="导师电话">
                <el-input v-model="currentSubjectInfo.tel"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="7">
              <el-form-item label="导师邮箱">
                <el-input v-model="currentSubjectInfo.mail"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="20">
              <el-form-item label="课题内容">
                <el-input type="textarea" v-model="currentSubjectInfo.description"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="20">
              <el-form-item label="课题要求">
                <el-input type="textarea" v-model="currentSubjectInfo.require"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="20">
              <el-form-item label="审核意见">
                <el-input type="textarea" v-model="currentSubjectInfo.opinion" disabled></el-input>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
        <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewPageVisible = false">退出查看</el-button>
      </span>
      </el-dialog>
    </div>
</template>

<script>
export default {
  name: 'checkSubjects',
  data() {
    return {
      // 查看详情的课题信息
      currentSubjectInfo: {},
      // （符合要求）课题总数
      totalPageNum: 0,
      // 获取课题列表
      queryInfo: {
        status: '', // 需要查询的通知记录状态（1-待审核，2-已通过，3-未通过）, 不发送则返回所有类型
        keyWord: '', // 关键词
        page: 1, // 当前页号
        size: 10, // 页面大小
        type: '' // 通知类型（1-学业通知， 2-答辩安排， 3-工作安排）
      },
      subjectlist: [],
      total: 0,
      // 查看详情对话框可见性
      viewPageVisible: false
    }
  },
  created() {
    this.getSubjectList()
  },
  methods: {
    async getSubjectList() {
      const { data: res } = await this.$http.get('http://localhost:9528/subject/teacher/my', { params: this.queryInfo })
      if (res.meta.code !== 200) {
        return this.$message.error('获取课题列表失败')
      }
      this.subjectlist = res.data
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.getSubjectList()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.page = newPage
      this.getSubjectList()
    },
    // 筛选课题类型
    filterType(value, row) {
      return row.type === value
    },
    // 筛选课题状态
    filterStatus(value, row) {
      return row.status === value
    },
    // 查看课题详情
    viewSubject(row) {
      this.viewPageVisible = true
      this.currentSubjectInfo = row
      console.log(this.currentSubjectInfo)
    }
  }
}
</script>

<style Lang="less" scoped>
  .el-card{
    box-shadow: 0 1px 1px rgba(0,0,0, 0.15) !important
  }
  /*表格状态颜色*/
  .el-table .warning-row {
    background: oldlace;
  }
  /*表格状态颜色*/
  .el-table .success-row {
    background: #f0f9eb;
  }

</style>
