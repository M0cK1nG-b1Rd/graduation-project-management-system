<template>
  <div>
<!--    返回上一页按钮-->
    <el-row>
      <el-button icon="el-icon-caret-left" type="text" @click="returnPrevPage" style="font-size: 15px">
        返回上一页
      </el-button>
    </el-row>
<!--    学生信息-->
    <el-row></el-row>
  </div>
</template>

<script>
export default {
  name: 'StudentInfo',
  mounted() {
    // 获取路由参数
    this.subId = this.$route.params.subId
    // 获取学生信息
    this.getStuInfo()
  },
  data() {
    return {
      subId: '',
      stuInfo: []
    }
  },
  methods: {
    // 回到上一页
    returnPrevPage() {
      this.$router.push('/process/teacher/give')
    },
    // 获取该课题学生信息
    async getStuInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/', { params: { subId: this.subId } })
      if (res.meta.code === 200) {
      } else {
        this.$message.error('获取该课题学生信息失败！')
      }
    }
  }
}
</script>

<style Lang="less" scoped>

</style>
