<template>
  <div>
<!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>过程监督</el-breadcrumb-item>
      <el-breadcrumb-item>发布任务</el-breadcrumb-item>
    </el-breadcrumb>
<!--    卡片内容区-->
    <el-card>
<!--      页面标题-->
      <el-row type="flex" justify="center" class="page_title">发布阶段任务</el-row>
<!--      该老师所有课题信息-->
      <el-row class="subject_zone">
        <div class="subject_card" v-for="(item, index) in allSubjectInfo"
             :key="index">
<!--        卡片头部--课题名称-->
          <el-tooltip class="item" effect="dark" :content="item.subName" placement="top">
            <div class="subject_title">
              {{ item.subName}}</div>
          </el-tooltip>
          <el-divider class="card_divider"></el-divider>
<!--        课题概要信息-->
          <el-row>
<!--            课题领域-->
            <el-row style="font-size: 15px">
              <a-tag color="blue" style="font-size: 15px; color: #393e46">课题领域：</a-tag>
              {{item.zone}}
            </el-row>
<!--            课题内容概述-->
            <el-tooltip class="item" effect="light" :content="item.description" placement="top">
              <el-row style="font-size: 15px" class="subject_breif">
                <a-tag style="font-size: 15px" color="cyan">课题描述：</a-tag>
                <br>
                {{item.description}}
              </el-row>
            </el-tooltip>
<!--            选择该题学生-->
            <el-row type="flex" justify="center" style="margin-top: 8px">
              <a-tag color="red"
                     @click="viewStudentInfo(item.subId, item.subName)"
                     style="font-size: 15px; color: #393e46">
                选择该题学生名单
              </a-tag>
            </el-row>
          </el-row>
        </div>
      </el-row>
    </el-card>
  </div>
</template>

<script>
import dataDict from '@/assets/js/dataDict'

export default {
  name: 'ManageTask',
  async mounted() {
    await this.getDict()
    await this.getAllSubjectInfo()
  },
  data() {
    return {
      // 该教师所有课题信息
      allSubjectInfo: [],
      // 课题领域数据字典
      zoneDict: [],
      // 选中课题的学生信息
      stuInfo: []
    }
  },
  methods: {
    // 获取数据字典
    async getDict() {
      const fullDict = JSON.parse(window.sessionStorage.getItem('dict'))
      this.zoneDict = dataDict.getDict(fullDict, 6)
    },
    // 获取所有课题信息
    async getAllSubjectInfo() {
      const { data: res } = await this.$http.get('/subject/teacher/my')
      if (res.meta.code === 200) {
        this.allSubjectInfo = res.data
        for (let i = 0; i < this.allSubjectInfo.length; i++) {
          this.allSubjectInfo[i].zone = dataDict.getValueByKey(this.zoneDict, this.allSubjectInfo[i].zone)
        }
      } else {
        this.$message.error('获取课题信息失败!')
      }
    },
    // 获取该课题学生信息
    async getStuInfo(subId) {
      const { data: res } = await this.$http.get('/subject/students/', { params: { subId: subId } })
      if (res.meta.code === 200) {
        this.stuInfo = res.data
      } else {
        this.$message.error('获取该课题学生信息失败！')
      }
    },
    // 查看选中课题的所有选择此题学生信息
    async viewStudentInfo(subId, subName) {
      await this.getStuInfo(subId)
      const para = {
        stuInfo: this.stuInfo,
        subName: subName,
        subId: subId
      }
      await this.$router.push({ name: 'processStuInfo', params: para })
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
.subject_zone{
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
/*课题信息卡片*/
.subject_card{
  width: 400px;
  height: 260px;
  margin: 8px;
  padding: 15px;
  border-radius: 20px;
  background: #ffffff;
  box-shadow: 20px 20px 60px #d9d9d9,
    -20px -20px 60px #ffffff;
}
/*课题名称*/
.subject_title{
  font-size: 16px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 10px;
  text-align: center;
  font-weight: bold;
  /*过长自动隐藏*/
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
/*卡片内分割线*/
.card_divider {
  margin-top: 10px;
  margin-bottom: 10px;
}
/*卡片内，课题简介*/
.subject_breif {
  font-size: 14px;
  margin-top: 5px;
  height: 112px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 5;
  -webkit-box-orient: vertical;
}
</style>
