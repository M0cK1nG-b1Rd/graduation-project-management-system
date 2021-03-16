<template>
  <div>
    <!--    学生人数-->
    <el-row>
      <el-col :span="2" :offset="2">
        <a-tag color="#CCFFFF" style="color: #000000; font-size: 14px">
          专家总数: {{tutorNum}}人
        </a-tag>
      </el-col>
    </el-row>
    <!--    表格-->
    <el-row>
      <el-table :data="tutorInfo"
                size="medium"
                stripe>
        <!--      老师姓名-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "姓名"
          width="100px"
          prop="realName">
        </el-table-column>
        <!--      职称-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "职称"
          width="140px"
          prop="title">
        </el-table-column>
        <!--      学院-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "学院"
          width="120px"
          prop="collegeName">
        </el-table-column>
        <!--      邮箱-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "邮箱"
          width="160px"
          prop="mail">
        </el-table-column>
        <!--      电话-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "电话"
          width="160px"
          prop="tel">
        </el-table-column>
        <!--      主页-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "主页"
          width="100px">
          <a-tag color="green">
            个人主页
          </a-tag>
        </el-table-column>
      </el-table>
    </el-row>
    <!--    分页-->
    <el-row type="flex" justify="center" style="margin-top: 10px">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="queryInfo.page"
        :page-sizes="[5, 10, 20, 50]"
        :page-size="queryInfo.size"
        layout="total, sizes, prev, pager, next, jumper"
        :total="tutorNum">
      </el-pagination>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'TutorInfo',
  mounted() {
    this.getTutorInfo()
  },
  data() {
    return {
      // 参加答辩的学生信息
      tutorInfo: [],
      // 查询参数
      queryInfo: {
        page: 1, // 当前页号
        size: 10 // 页面大小
      },
      // 总页数
      totalPageNum: 0,
      // 专家导师总数
      tutorNum: 0
    }
  },
  methods: {
    // 获取专家老师信息
    async getTutorInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/account/plea/teacher', { params: this.queryInfo })
      if (res.meta.code !== 200) return this.$notify.error('获取专家老师信息失败！')
      this.tutorInfo = res.data.records
      this.tutorNum = res.data.total
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.getStuInfo()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.page = newPage
      this.getStuInfo()
    }
  }
}
</script>

<style Lang="less" scoped>
.el-table{
  width: 100%;
  font-size: 14px;
  margin-left: 70px;
}
</style>
