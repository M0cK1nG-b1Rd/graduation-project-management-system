<template>
  <div>
<!--    学生人数-->
    <el-row>
      <el-col :span="2" :offset="2">
        <a-tag color="#CCFFFF" style="color: #000000; font-size: 14px">
          学生总数: {{stuNum}}人
        </a-tag>
      </el-col>
    </el-row>
<!--    表格-->
    <el-row>
      <el-table :data="stuInfo"
                size="medium"
                stripe>
        <!--      学生姓名-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "姓名"
          width="100px"
          prop="realName">
        </el-table-column>
        <!--      专业-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "专业"
          width="120px"
          prop="majorName">
        </el-table-column>
        <!--      班级-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "班级"
          width="120px"
          prop="className">
        </el-table-column>
        <!--      学院-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "学院"
          width="120px"
          prop="collegeName">
        </el-table-column>
        <!--      联系邮箱-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "联系邮箱"
          width="160px"
          prop="mail">
        </el-table-column>
        <!--      联系电话-->
        <el-table-column
          :show-overflow-tooltip="true"
          label = "联系电话"
          width="120px"
          prop="tel">
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
        :page-size="100"
        layout="total, sizes, prev, pager, next, jumper"
        :total="totalPageNum">
      </el-pagination>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'StudentInfo',
  mounted() {
    this.getStuInfo()
  },
  data() {
    return {
      // 参加答辩的学生信息
      stuInfo: [],
      // 查询参数
      queryInfo: {
        page: 1, // 当前页号
        size: 10, // 页面大小
        // TODO 后期改为KT阶段
        stage: 'JT' // 阶段
      },
      // 总页数
      totalPageNum: 0,
      // 学生总数
      stuNum: 0
    }
  },
  methods: {
    // 获取学生信息
    async getStuInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/account/plea/student', { params: this.queryInfo })
      if (res.meta.code !== 200) return this.$notify.error('获取答辩学生信息失败！')
      this.stuInfo = res.data.records
      this.stuNum = res.data.total
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
