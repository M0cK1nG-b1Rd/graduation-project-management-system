<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>开题管理</el-breadcrumb-item>
      <el-breadcrumb-item>答辩安排</el-breadcrumb-item>
    </el-breadcrumb>
<!--    页面标题-->
    <el-row class="page_header">
      开题答辩安排
    </el-row>
    <el-row type="flex" justify="center">
      <el-card class="outer_card">
<!--        折叠框-->
        <el-collapse>
<!--          折叠框1--查看答辩学生名单-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#FFFFCC" class="collapse_title_tag">
                <i class="el-icon-user"></i>
                查看答辩学生名单
              </a-tag>
            </template>
            <div class="stu_info">
              <stu-info></stu-info>
            </div>
          </el-collapse-item>
<!--          折叠框2--查看答辩专家名单-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#FFCCCC" class="collapse_title_tag">
                <a-icon type="team" />
                查看答辩专家名单
              </a-tag>
            </template>
            <div class="tutor_info">
              <tutor-info></tutor-info>
            </div>
          </el-collapse-item>
<!--          折叠框3--设置分组信息（组数）-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#f4f4f2" class="collapse_title_tag">
                <i class="el-icon-help"></i>
                设置分组信息
              </a-tag>
            </template>
            <el-row class="group_arrange">
              <el-col>
                <el-input v-model="teamNum" placeholder="请输入答辩小组个数"></el-input>
              </el-col>
              <el-col>
                <el-button type="primary" @click="startRandomDivide">开始随机分组</el-button>
              </el-col>
            </el-row>
          </el-collapse-item>
<!--          折叠框4--查看分组结果并设置答辩信息-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#CCFFFF" class="collapse_title_tag">
                <i class="el-icon-files"></i>
                查看分组结果并设置答辩信息
              </a-tag>
            </template>
            <el-card class="team_info_card"
                     v-for="(item, index) in studentPleaTeams" :key="index">
              <el-row class="group_info">
<!--                小组编号-->
                <el-col :span="7">
                  小组编号：<a-tag color="#f6f6f4" class="inner_tag">{{item.teamId}}</a-tag>
                </el-col>
<!--                学生、老师信息-->
                <el-col :span="7">
                  <!--                查看该组学生-->
                  <el-row>
                    <a-tag color="cyan" class="inner_tag">学生信息</a-tag>
                  </el-row>
                  <!--                查看该组专家-->
                  <el-row>
                    <a-tag color="blue" class="inner_tag">专家信息</a-tag>
                  </el-row>
                  <!--                查看该组答辩秘书-->
                  <el-row>
                    <a-tag color="green" class="inner_tag">答辩秘书</a-tag>
                  </el-row>
                </el-col>
<!--                时间、场地设置-->
                <el-col>
                  <!--                设置答辩时间-->
                  <el-row>
                    <a-tag color="#f6f6f4" class="inner_tag">答辩时间</a-tag>
                    <el-date-picker
                      type="datetimerange"
                      range-separator="至"
                      start-placeholder="开始日期"
                      end-placeholder="结束日期">
                    </el-date-picker>
                  </el-row>
                  <!--                设置答辩场地-->
                  <el-row>
                    <a-tag color="#ffd4d4" class="inner_tag">答辩场地</a-tag>
                    <el-select placeholder="请选择答辩场地" style="width: 400px"></el-select>
                  </el-row>
                </el-col>
              </el-row>
            </el-card>
          </el-collapse-item>
        </el-collapse>
      </el-card>
    </el-row>
  </div>
</template>

<script>
import stuInfo from '@/components/startSubject/arrangePlea/StudentInfo'
import tutorInfo from '@/components/startSubject/arrangePlea/TutorInfo'
export default {
  name: 'ArrangePlea',
  components: { stuInfo, tutorInfo },
  mounted() {
  },
  data() {
    return {
      // 答辩小组个数
      teamNum: '',
      // 学生答辩分组结果
      studentPleaTeams: [
        {
          teamId: 1
        },
        {
          teamId: 1
        },
        {
          teamId: 1
        },
        {
          teamId: 1
        }
      ],
      // 老师答辩分组结果
      teacherPleaTeams: []
    }
  },
  methods: {
    // 开始随机分组
    startRandomDivide() {}
    // 获取答辩安排结果
    // getArrangeResult()
  }
}
</script>

<style Lang="less" scoped>
/*页面标题*/
.page_header{
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 20px;
}
/*最外层卡片*/
.outer_card{
  width: 100%;
  border-radius: 4px;
  background: #ffffff;
  box-shadow:  28px 28px 56px #bababa,
    -28px -28px 56px #ffffff;
}
/*折叠面板标题中的Tag*/
.collapse_title_tag {
  font-size: 16px;
  color: #343232;
}
/*分组安排折叠框*/
.group_arrange{
  display: flex;
  font-size: 18px;
  align-items: center;
  justify-content: flex-start;
}
/*单个小组分组信息*/
.group_info{
  font-size: 15px;
  display: flex;
  align-items: center;
  justify-content: center;
}
/*Tag*/
.inner_tag{
  font-size: 15px;
  color: #393e46;
}
</style>
