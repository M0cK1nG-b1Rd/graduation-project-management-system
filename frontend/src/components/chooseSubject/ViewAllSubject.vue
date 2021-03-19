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
          <el-input style="padding-right: 0px"
                    @change="getAllSubjectInfo"
                    v-model="queryInfo.keyWord"
                    suffix-icon="el-icon-search"
                    placeholder="请输入关键词进行筛选">
          </el-input>
        </el-col>
        <!--        选择课题领域-->
        <el-col :span="5">
          <el-select
            @change="getAllSubjectInfo"
            v-model="queryInfo.zone"
            placeholder="请选择课题领域">
            <el-option v-for="item in zoneDict" :key="item.dictKey"
                       :label="item.dictValue" :value="item.dictKey">
            </el-option>
          </el-select>
        </el-col>
        <!--        选择老师-->
        <el-col :span="5">
          <el-select placeholder="请选择指导老师"
                     @change="getAllSubjectInfo"
                     v-model="queryInfo.teacherName">
            <el-option v-for="(item, index) in teacherInfo" :key="index"
                       :value="item.realName" :label="item.realName">
            </el-option>
          </el-select>
        </el-col>
      </el-row>
      <!--      分割线-->
      <el-divider></el-divider>
      <!--      主要内容区(课题信息)-->
      <el-row class="subject_zone">
        <div class="card" v-for="(item, index) in allSubjectInfo" :key="item.subId">
          <!--          卡片头--课题名称-->
          <div class="card_header">
            <el-tooltip class="item" effect="dark" :content="item.subName" placement="top">
              <div class="title_1">
                {{ item.subName }}
              </div>
            </el-tooltip>
          </div>
          <!--          卡片内分割线-->
          <el-divider class="card_divider"></el-divider>
          <!--          卡片体-->
          <div class="card_body">
            <!--            指导老师-->
            <el-row>
              <el-col>指导老师：
                <a-tag color="#87d068" size="mini">{{ item.teacherName }}</a-tag>
              </el-col>
            </el-row>
            <!--            课题领域-->
            <el-row>
              <el-col>课题领域：
                <a-tag size="mini" color="#2db7f5"> {{ item.zone }} </a-tag>
              </el-col>
            </el-row>
            <!--            课题简介-->
            <el-row>
              课题简介：
              <el-col class="subject_breif">{{item.description}}</el-col>
            </el-row>
            <!--            卡片底部-->
            <el-row type="flex" align="middle" justify="space-between">
              <!--              人数情况-->
              <el-col :span="8">
                <a-tag size="mini" color="orange">已选{{item.chosen}}人/限选{{item.capacity}}人</a-tag>
              </el-col>
              <!--              查看详情-->
              <el-col :span="6" :offset="2">
                <a-tag color="green" size="mini" @click="viewSubjectDetail(index)"
                       style="cursor: pointer;">
                  查看详情
                </a-tag>
              </el-col>
              <!--              选题操作-->
              <el-col :span="6">
                <a-tag color="cyan" size="mini" @click="chooseSubject(index)"
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
          :current-page="queryInfo.current"
          :page-sizes="[5, 10, 20, 50]"
          :page-size="queryInfo.size"
          layout="sizes, prev, pager, next, jumper">
        </el-pagination>
      </div>
    </el-card>
  </div>
</template>

<script>
import dataDict from '@/assets/js/dataDict'
export default {
  name: 'ViewAllSubject',
  async mounted() {
    const fullDict = JSON.parse(window.sessionStorage.getItem('dict'))
    this.zoneDict = dataDict.getDict(fullDict, 6)
    const { data: teachers } = await this.$http.get('http://127.0.0.1:9528/account/plea/teacher', { params: { page: 1, size: 10000 } })
    if (teachers.meta.code !== 200) return this.$message.error('获取教师信息失败！')
    this.teacherInfo = teachers.data.records
    await this.getAllSubjectInfo()
  },
  data() {
    return {
      // 所有课题信息
      allSubjectInfo: [],
      // 课题领域数据字典
      zoneDict: [],
      // 所有页数
      pageNums: 0,
      // 查询参数（给后端）
      queryInfo: {
        keyWord: '', // 关键词
        current: 1, // 当前页号
        size: 10, // 页面大小
        zone: '', // 课题领域
        teacherName: '' // 指导老师姓名
      },
      // 符合条件的所有
      // 当前选中的课题信息
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
      // 老师信息
      teacherInfo: []
    }
  },
  methods: {
    // 获取所有课题信息
    async getAllSubjectInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/subject', { params: this.queryInfo })
      if (res.meta.code === 200) {
        this.allSubjectInfo = res.data.records
        for (let i = 0; i < this.allSubjectInfo.length; i++) {
          this.allSubjectInfo[i].zone = dataDict.getValueByKey(this.zoneDict, this.allSubjectInfo[i].zone)
        }
      } else {
        this.$message.error('获取课题信息失败!')
      }
    },
    // 查看选中课题详情
    viewSubjectDetail(index) {
      this.currentSubjectInfo = this.allSubjectInfo[index]
      this.$router.push({ name: 'viewSubjectDetail', params: this.currentSubjectInfo })
    },
    // 跳到选题申请页面
    chooseSubject(index) {
      this.currentSubjectInfo = this.allSubjectInfo[index]
      this.$router.push({ name: 'chooseSubjectApplication', params: this.currentSubjectInfo })
    },
    // 当页面大小变化时触发
    handleSizeChange(newSize) {
      this.queryInfo.size = newSize
      this.getAllSubjectInfo()
    },
    // 当页面编号变化时触发
    handleCurrentChange(newPage) {
      this.queryInfo.current = newPage
      this.getAllSubjectInfo()
    }
  }
}
</script>

<style Lang="less" scoped>
/*顶部搜索筛选区*/
.search_zone {
  z-index: 999;
}

/*课题展示区*/
.subject_zone {
  display: flex;
  flex-wrap: wrap;
}

/*课题卡片*/
.card {
  width: 310px;
  height: 240px;
  margin: 8px;
  border-radius: 20px;
  background: #ffffff;
  box-shadow: 20px 20px 60px #d9d9d9,
    -20px -20px 60px #ffffff;
}

/*卡片头, 设置标题太长自动省略，鼠标悬浮显示完整*/
.card_header {
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 10px;
  font-size: 16px;
  text-align: center;
  font-weight: bold;
  /*阴影*/
}

/*长度受限的标题*/
.title_1 {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.card_header:hover .title_2 {
  display: block;
}

/*卡片内分割线*/
.card_divider {
  margin-top: 10px;
  margin-bottom: 10px;
}

/*卡片下方内容*/
.card_body {
  font-size: 16px;
  padding-left: 25px;
  padding-right: 25px;
  display: flex;
  flex-direction: column;
}

/*卡片内，课题简介*/
.subject_breif {
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
.card_footer {
}

/*分页区*/
.pagination {
  margin: 20px;
  display: flex;
  justify-content: center;
}
</style>
