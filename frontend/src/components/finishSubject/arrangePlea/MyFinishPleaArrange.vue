<template>
  <div>
<!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>结题管理</el-breadcrumb-item>
      <el-breadcrumb-item>我的答辩安排</el-breadcrumb-item>
    </el-breadcrumb>
<!--    页面标题-->
    <el-row class="page_header">
      结题答辩安排
    </el-row>
<!--      答辩安排信息展示区-->
    <el-row>
      <el-col>
        <!--    答辩详情卡片-->
        <el-row type="flex" justify="center">
          <el-card class="pre_detail" style="width: 80%">
            <!--        课题名称-->
            <el-row type="flex" align="middle">
              <el-col :span="8">
                <el-row>
                  开始时间：<a-tag color="blue" style="font-size: 15px">{{myPleaArrange.startTime}}</a-tag>
                </el-row>
                <div style="height: 5px"></div>
                <el-row>
                  结束时间：<a-tag color="red" style="font-size: 15px">{{myPleaArrange.endTime}}</a-tag>
                </el-row>
              </el-col>
              <el-col :span="8">
                答辩地点：<a-tag color="green">{{myPleaArrange.classroomName}}</a-tag>
              </el-col>
              <el-col :span="8">
                答辩秘书：<a-tag color="orange">{{myPleaArrange.teacherTeam.secretary.realName}}</a-tag>
              </el-col>
            </el-row>
            <el-divider></el-divider>
            <!--        参与学生名单、指导老师名单-->
            <el-row>
              <!--          答辩学生参与名单-->
              <el-col :span="10">
                <el-card class="box-student" style="margin-top: 5px" >
                  <el-table
                    :data="myPleaArrange.stuGroup.students"
                    style="width: 100%; font-size: 13px">
                    <el-table-column
                      prop="realName"
                      label="学生名单"
                      width="180">
                    </el-table-column>
                    <el-table-column
                      prop="collegeName"
                      label="所属学院"
                      width="100">
                    </el-table-column>
                  </el-table>
                </el-card>
              </el-col>
              <!--          答辩老师参与名单-->
              <el-col :span="14">
                <el-card class="box-teacher" style="margin-left: 20%; margin-top: 5px">
                  <el-table
                    :data="myPleaArrange.teacherTeam.teachers"
                    style="width: 100%; font-size: 13px">
                    <el-table-column
                      prop="realName"
                      label="教师名单"
                      width="130">
                    </el-table-column>
                    <el-table-column
                      prop="tel"
                      label="电话"
                      width="150">
                    </el-table-column>
                  </el-table>
                </el-card>
              </el-col>
            </el-row>
          </el-card>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'MyFinishPleaArrange',
  mounted() {
    this.getMyPleaArrange()
  },
  data() {
    return {
      // 当前所处阶段
      stage: 'JT',
      // 答辩安排信息
      myPleaArrange: {}
    }
  },
  methods: {
    // 获取我的答辩安排信息
    async getMyPleaArrange() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/plea/user', { params: { stage: this.stage } })
      if (res.meta.code === 200) {
        this.myPleaArrange = res.data[0]
      } else {
        this.$message.error(res.meta.message)
      }
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
.card_header{
  margin-bottom: 10px;
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
</style>
