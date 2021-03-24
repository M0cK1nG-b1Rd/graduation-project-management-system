<template>
<div>
  <!--    面包屑导航区域-->
  <el-breadcrumb separator-class="el-icon-arrow-right">
    <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item>出题管理</el-breadcrumb-item>
    <el-breadcrumb-item>审核课题</el-breadcrumb-item>
  </el-breadcrumb>
  <!--卡片视图区-->
  <el-card class="el-card">
    <!--搜索区-->
    <el-row :gutter="20">
      <el-col :span="7">
        <a-input
          @change="getSubjectList"
          placeholder="请输入关键词查询课题信息"
          v-model="queryInfo.keyWord">
          <el-button slot="append" icon="el-icon-search"></el-button>
        </a-input>
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
          width="200">
        </el-table-column>
        <!--          申请日期-->
        <el-table-column
          sortable
          :show-overflow-tooltip="true"
          prop="poseTime"
          label="申请日期"
          width="150">
        </el-table-column>
        <!--          申请人-->
        <el-table-column
          sortable
          :show-overflow-tooltip="true"
          prop="teacherName"
          label="申请人"
          width="100">
        </el-table-column>
        <!--        课题类型-->
        <el-table-column
          :show-overflow-tooltip="true"
          prop="zone"
          label="课题类型"
          width="170"
          :filters="[{ text: '科学探索与技术创新', value: 'KXTS' }, { text: '生命关怀与社会认知', value: 'SMGH' }, { text: '哲学智慧与创新思维', value: 'ZXZH' }]"
          :filter-method="filterType"
          filter-placement="bottom-end">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.zone=='KXTS'" type="info">科学探索与技术创新</el-tag>
            <el-tag v-if="scope.row.zone=='SMGH'" type="success">生命关怀与社会认知</el-tag>
            <el-tag v-if="scope.row.zone=='ZXZH'" type="primary">哲学智慧与创新思维</el-tag>
          </template>
        </el-table-column>
        <!--         课题状态-->
        <el-table-column
          :show-overflow-tooltip="true"
          prop="status"
          width="100"
          :filters="[{ text: '未审核', value: 'WSH' }, { text: '未通过', value: 'WTG' }, { text: '已通过', value: 'YTG' }]"
          :filter-method="filterStatus"
          filter-placement="bottom-end"
          label="课题状态">
          <template slot-scope="scope">
            <el-tag type="waring" v-if=" scope.row.status == 'WSH'">未审核</el-tag>
            <el-tag type="danger" v-if=" scope.row.status == 'WTG'">未通过</el-tag>
            <el-tag type="success" v-if=" scope.row.status == 'YTG'">已通过</el-tag>
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
            <!--审核课题按钮-->
            <el-tooltip class="item" effect="dark" content="填写审核意见" placement="top" :enterable="false">
            <el-button type="primary" icon="el-icon-edit" size="mini" circle @click="editSubject(scope.row)"></el-button>
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
  <!--    查看详情对话框-->
  <el-dialog
    :visible.sync="viewPageVisible"
    width="60%">
    <el-row type="flex" justify="center" style="font-size: 20px; font-weight: bold; margin-bottom: 20px">查看出题申请详情</el-row>
    <el-form ref="subject" :model="currentSubjectInfo" label-width="80px">
      <el-row>
        <el-col :span="10">
          <el-form-item label="课题名称">
            <a-input v-model="currentSubjectInfo.subName" disabled></a-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="申报人">
            <a-input v-model="currentSubjectInfo.teacherName" disabled></a-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="10">
          <el-form-item label="题目类型">
            <a-input v-model="currentSubjectInfo.zoneName" disabled></a-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="申报时间">
            <el-row>
              <a-input v-model="currentSubjectInfo.poseTime" disabled></a-input>
            </el-row>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="6">
          <el-form-item label="指导教师">
            <a-input v-model="currentSubjectInfo.teacherName" disabled></a-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="导师电话">
            <a-input v-model="currentSubjectInfo.tel" disabled></a-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="导师邮箱">
            <a-input v-model="currentSubjectInfo.mail" disabled></a-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="22">
          <el-form-item label="课题内容">
            <el-col :span="24">
              <div class="ql-container ql-snow">
                <div class="ql-editor" v-html="currentSubjectInfo.description"></div>
              </div>
            </el-col>
          </el-form-item>
        </el-col>
        <el-col :span="22">
          <el-form-item label="课题要求">
            <el-col :span="24">
              <div class="ql-container ql-snow">
                <div class="ql-editor" v-html="currentSubjectInfo.requirement"></div>
              </div>
            </el-col>
          </el-form-item>
        </el-col>
        <el-col :span="22">
          <el-form-item label="相关附件">
            <Downloader :doc-id="docId"></Downloader>
          </el-form-item>
        </el-col>
        <el-col :span="22">
          <el-form-item label="审核意见">
            <a-input type="textarea" v-model="currentSubjectInfo.feedback" disabled></a-input>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="viewPageVisible = false">退出查看</el-button>
      </span>
  </el-dialog>
  <!--审核意见对话框-->
  <el-dialog
    :visible.sync="viewEditVisible"
    width="60%">
    <el-row type="flex" justify="center" style="font-size: 20px; font-weight: bold; margin-bottom: 20px">审核出题申请</el-row>
    <el-form class="formbox" ref="subject" :model="currentSubjectInfo" label-width="80px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="课题名称">
            <a-input v-model="currentSubjectInfo.subName" disabled></a-input>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="申报人">
            <a-input v-model="currentSubjectInfo.teacherName" disabled></a-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="题目类型">
            <a-input v-model="currentSubjectInfo.zoneName" disabled></a-input>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="申报时间">
            <el-row>
              <a-input v-model="currentSubjectInfo.poseTime" disabled></a-input>
            </el-row>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="6">
          <el-form-item label="指导教师">
            <a-input v-model="currentSubjectInfo.teacherName" disabled></a-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="导师电话">
            <a-input v-model="currentSubjectInfo.tel" disabled></a-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="导师邮箱">
            <a-input v-model="currentSubjectInfo.mail" disabled></a-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="22">
          <el-form-item label="课题内容">
            <el-col :span="24">
              <div class="ql-container ql-snow">
                <div class="ql-editor" v-html="currentSubjectInfo.description"></div>
              </div>
            </el-col>
          </el-form-item>
        </el-col>
        <el-col :span="22">
          <el-form-item label="课题要求">
            <el-col :span="24">
              <div class="ql-container ql-snow">
                <div class="ql-editor" v-html="currentSubjectInfo.requirement"></div>
              </div>
            </el-col>
          </el-form-item>
        </el-col>
        <el-col :span="22">
          <el-form-item label="相关附件">
            <Downloader :doc-id="docId"></Downloader>
          </el-form-item>
        </el-col>
        <el-col :span="22">
          <el-form-item label="审核意见">
            <a-input type="textarea" v-model="currentSubjectInfo.feedback"></a-input>
          </el-form-item>
        </el-col>
      </el-row>
      <a-divider style="padding-right: 70px">审核结果</a-divider>
    </el-form>
    <!--审核提交按钮-->
    <span slot="footer" class="dialog-footer">
      <el-row type="flex" justify="center">
        <el-col :span="4">
          <el-popconfirm placement="top-start" title="确认提交审核意见吗？" @confirm="submitOpinion('YTG')">
            <el-button round type="success" slot="reference" style="margin-right: 200px">通过审核</el-button>
          </el-popconfirm>
        </el-col>
        <el-col :span="4">
          <el-popconfirm placement="top-start" title="确认提交审核意见吗？" @confirm="submitOpinion('WTG')">
            <el-button type="warning" round slot="reference" style="margin-right: 200px; margin-bottom: 50px">驳回申请</el-button>
          </el-popconfirm>
        </el-col>
        <el-col :span="4">
          <el-button round type="danger" @click="viewEditVisible = false" style="margin-right: 200px">退出审核</el-button>
        </el-col>
      </el-row>
      </span>
  </el-dialog>
</div>
</template>

<script>
import dataDict from '@/assets/js/dataDict'
import Downloader from '@/plugins/upload-download/Downloader'
export default {
  name: 'judgeSubjects',
  components: { Downloader },
  data() {
    return {
      // 查看详情的课题信息
      currentSubjectInfo: {
        status: ''
      },
      // （符合要求）公告总数
      totalPageNum: 0,
      docId: null,
      // 获取课题列表
      queryInfo: {
        keyWord: '', // 关键词
        page: 1, // 当前页号
        size: 5 // 页面大小
      },
      subjectlist: [],
      total: 0,
      // 查看详情对话框可见性
      viewPageVisible: false,
      viewEditVisible: false,
      radio1: '1', // 课题是否通过选择器
      zoneDict: ''
    }
  },
  created() {
    this.getSubjectList()
    const fullDict = JSON.parse(window.sessionStorage.getItem('dict'))
    this.zoneDict = dataDict.getDict(fullDict, 6)
  },
  methods: {
    async getSubjectList() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/subject/all', { params: this.queryInfo })
      if (res.meta.code !== 200) {
        this.$message.error('获取课题列表失败')
      } else {
        this.subjectlist = res.data.records
        this.totalPageNum = res.data.total
        for (let i = 0; i < this.subjectlist.length; i++) {
          this.subjectlist[i].zoneName = dataDict.getValueByKey(this.zoneDict, this.subjectlist[i].zone)
        }
      }
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
      return row.zone === value
    },
    // 筛选课题状态
    filterStatus(value, row) {
      return row.status === value
    },
    // 查看课题详情
    viewSubject(row) {
      this.viewPageVisible = true
      this.currentSubjectInfo = row
      this.docId = row.docId
    },
    editSubject(row) {
      this.viewEditVisible = true
      this.currentSubjectInfo = row
      this.docId = row.docId
    },
    async submitOpinion(status) {
      this.viewEditVisible = false
      this.currentSubjectInfo.status = status
      delete this.currentSubjectInfo.zoneName
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/subject/audit', this.currentSubjectInfo)
      if (res.meta.code !== 200) this.$message.error('提交审核意见失败！')
    }
  }
}
</script>

<style Lang="less" scoped>
  .formbox {
    /*background-color: #a71d5d;*/
    padding-left: 80px;
  }
</style>
