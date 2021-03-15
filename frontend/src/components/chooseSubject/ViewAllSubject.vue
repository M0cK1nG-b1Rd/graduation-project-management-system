<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>选题管理</el-breadcrumb-item>
      <el-breadcrumb-item>选题申请</el-breadcrumb-item>
    </el-breadcrumb>
    <!--    卡片区-->
    <el-card class="outtest_card">
<!--      搜索框筛选-->
      <el-row class="search_zone">
<!--        关键词搜索-->
        <el-col :span="8">
          <el-input style="padding-right: 0px" suffix-icon="el-icon-search"
            placeholder="请输入关键词进行筛选">
          </el-input>
        </el-col>
<!--        选择课题领域-->
        <el-col :span="5">
          <el-select placeholder="请选择课题领域">
            <el-option>
            </el-option>
          </el-select>
        </el-col>
<!--        选择老师-->
        <el-col :span="5">
          <el-select placeholder="请选择指导老师">
            <el-option>
            </el-option>
          </el-select>
        </el-col>
      </el-row>
<!--      分割线-->
      <el-divider></el-divider>
<!--      主要内容区(课题信息)-->
      <el-row class="subject_zone">
        <div class="card" v-for="item in items" :key="item">
<!--          卡片头--课题名称-->
          <div class="card_header">
            <el-tooltip class="item" effect="dark" :content="subjectTitle" placement="top-start">
              <div class="title_1">
                这是一个非常长的题目，一行显示不下。。。。。。。
              </div>
            </el-tooltip>
          </div>
<!--          卡片内分割线-->
          <el-divider class="card_divider"></el-divider>
<!--          卡片体-->
          <div class="card_body">
<!--            指导老师-->
            <el-row>
              <el-col>指导老师：<a-tag color="#87d068" size="mini">绕远</a-tag></el-col>
            </el-row>
<!--            课题领域-->
            <el-row>
              <el-col>课题领域：<a-tag size="mini" color="#2db7f5">神学研究及艺术修养</a-tag></el-col>
            </el-row>
<!--            课题简介-->
            <el-row>
              课题简介：<el-col class="subject_breif">佚名曾经提到过，感激每一佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战佚名曾经提到过，感激每一个新的挑战</el-col>
            </el-row>
<!--            卡片底部-->
            <el-row type="flex" align="middle" justify="space-between">
<!--              人数情况-->
              <el-col :span="8">
                <a-tag size="mini" color="green">已选2人/限选3人</a-tag>
              </el-col>
<!--              查看详情-->
              <el-col :span="6" offset="2">
                <a-tag color="#108ee9" size="mini" @click="viewSubjectDetail"
                        style="cursor: pointer;">
                查看详情
                </a-tag>
              </el-col>
<!--              选题操作-->
              <el-col :span="6">
                <a-tag color="cyan" size="mini" @click="chooseSubject"
                        style="cursor: pointer;">
                  选择此题
                </a-tag>
              </el-col>
            </el-row>
          </div>
        </div>
      </el-row>
      <!--          分页-->
      <div class="pagination">
        <el-pagination
                       @size-change="handleSizeChange"
                       @current-change="handleCurrentChange"
                       :current-page="currentPage4"
                       :page-sizes="[100, 200, 300, 400]"
                       :page-size="100"
                       layout="total, sizes, prev, pager, next, jumper"
                       :total="400">
        </el-pagination>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'ViewAllSubject',
  mounted() {
  },
  data() {
    return {
      currentSubjectInfo: {
        subId: '',
        subName: '',
        zone: '', // 课题领域
        description: '',
        majorName: '',
        teacherTitle: '',
        teacherName: '',
        teacherHomePage: '',
        capacity: '', // 课题容量
        chosen: '' // 已选人数
      },
      items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      subjectTitle: '这是一个超级超级长的课题，长到我一行显示不下！这是一个超级超级长的课题，长到我一行显示不下！这是一个超级超级长的课题，长到我一行显示不下！'
    }
  },
  methods: {
    viewSubjectDetail() {
      // 更新currentSubjectInfo为选中的卡片
      this.$router.push({ name: 'viewSubjectDetail', params: this.currentSubjectInfo })
    },
    chooseSubject() {
      this.$router.push({ name: 'chooseSubjectApplication', params: this.currentSubjectInfo })
    }
  }
}
</script>

<style Lang="less" scoped>
/*顶部搜索筛选区*/
.search_zone{
  z-index: 999;
}
/*课题展示区*/
.subject_zone{
  display: flex;
  flex-wrap: wrap;
}
/*课题卡片*/
.card{
  width: 310px;
  height: 240px;
  margin: 8px;
  border-radius: 20px;
  background: #ffffff;
  box-shadow:  20px 20px 60px #d9d9d9,
    -20px -20px 60px #ffffff;
}
/*卡片头, 设置标题太长自动省略，鼠标悬浮显示完整*/
.card_header{
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 10px;
  font-size: 16px;
  text-align: center;
  font-weight: bold;
  /*阴影*/
}
/*长度受限的标题*/
.title_1{
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.card_header:hover .title_2{
  display: block;
}
/*卡片内分割线*/
.card_divider{
  margin-top: 10px;
  margin-bottom: 10px;
}
/*卡片下方内容*/
.card_body{
  font-size: 16px;
  padding-left: 25px;
  padding-right: 25px;
  display: flex;
  flex-direction: column;
}
/*卡片内，课题简介*/
.subject_breif{
  font-size: 14px;
  margin-top: 5px;
  height: 65px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}
/*卡片脚*/
.card_footer{
}
/*分页区*/
.pagination{
  margin: 20px;
  display: flex;
  justify-content: center;
}
</style>
