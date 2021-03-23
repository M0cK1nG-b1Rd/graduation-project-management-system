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
    <!--    页面内容-->
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
                <a-icon type="team"/>
                查看答辩专家名单
              </a-tag>
            </template>
            <div class="tutor_info">
              <tutor-info></tutor-info>
            </div>
          </el-collapse-item>
          <!--          折叠框3--设置分组信息并分组（组数）-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#f4f4f2" class="collapse_title_tag">
                <i class="el-icon-help"></i>
                设置分组信息及分组管理
              </a-tag>
            </template>
<!--            已有分组时，可以撤回分组-->
            <el-row class="group_arrange" v-if="hasDivideArranged">
              <a-result
                status="success"
                title="当前已有分组安排，可以在此进行撤回">
                <template #extra>
                  <el-popconfirm
                    title="您确定要撤回已有的答辩安排吗？"
                    @confirm="deleteArrangeResult"
                  >
                    <el-button type="success" slot="reference">撤销现有分组结果</el-button>
                  </el-popconfirm>
                </template>
              </a-result>
            </el-row>
<!--            暂未分组时，进行分组-->
            <el-row class="group_arrange" v-else>
              <a-result title="当前暂无分组结果，请先进行分组设置！">
                <template #icon>
                  <a-icon type="smile" theme="twoTone" />
                </template>
                <template #extra>
                  <el-row>
                    <el-col>
                      <el-input v-model="arrangeInfo.teamNum" placeholder="请输入答辩小组个数"></el-input>
                    </el-col>
                    <el-col>
                      <el-button type="primary" @click="startRandomDivide">开始随机分组</el-button>
                    </el-col>
                  </el-row>
                </template>
              </a-result>
            </el-row>
            <el-row></el-row>
          </el-collapse-item>
          <!--          折叠框4--查看分组结果并设置答辩信息-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#CCFFFF" class="collapse_title_tag">
                <i class="el-icon-files"></i>
                查看分组结果并设置答辩信息
              </a-tag>
            </template>
            <!--            已有答辩安排，在此可以撤回-->
            <a-result v-if="hasPleaArranged"
              status="success"
              title="已有答辩安排，请前往查看，在此可以删除或撤回已有安排">
              <template #extra>
                <el-popconfirm @confirm="withdrawAllArrange"
                  title="撤回后，已有的答辩可以重新发布，确定撤回已有答辩安排吗？">
                  <a-button slot="reference" type="primary">撤回已有答辩安排</a-button>
                </el-popconfirm>
                <el-popconfirm @confirm="deleteAllArrange"
                  title="删除后，已有的答辩安排不可再找回，确定删除已有答辩安排吗？">
                  <a-button slot="reference" type="danger" style="margin-left: 20px">删除已有答辩安排</a-button>
                </el-popconfirm>
              </template>
            </a-result>
            <!--            暂无答辩安排，查看分组情况并设置答辩信息-->
            <div v-else>
              <el-card class="team_info_card"
                       v-for="(item, index) in studentPleaTeams" :key="index">
                <el-row class="group_info">
                  <!--                小组编号-->
                  <el-col :span="6">
                    组号：
                    <a-tag color="#f6f6f4" class="inner_tag">{{ item.groupId + 1 }}</a-tag>
                  </el-col>
                  <!--                学生、老师信息-->
                  <el-col :span="6">
                    <!--                查看该组学生-->
                    <el-row>
                      <a-tag color="cyan" class="inner_tag" @click="viewChosenStudentGroupInfo(item.students)">学生信息</a-tag>
                    </el-row>
                    <!--                查看该组专家-->
                    <el-row>
                      <a-tag color="blue" class="inner_tag" @click="viewChosenTutorGroupInfo(tutorPleaTeams[index].teachers)">专家信息</a-tag>
                    </el-row>
                    <!--                查看该组答辩秘书-->
                    <el-row>
                      <a-tag color="green" class="inner_tag" @click="viewChosenSecretaryGroupInfo(tutorPleaTeams[index].secretary)">答辩秘书</a-tag>
                    </el-row>
                  </el-col>
                  <!--                时间、场地设置-->
                  <el-col>
                    <!--                设置答辩时间-->
                    <el-row>
                      <a-tag color="#f6f6f4" class="inner_tag">答辩时间</a-tag>
                      <el-date-picker
                        @blur="timeOrSpaceChanged"
                        v-model="item.time"
                        type="datetimerange"
                        range-separator="至"
                        start-placeholder="开始日期"
                        end-placeholder="结束日期"
                        value-format="yyyy-MM-dd HH:mm:ss">
                      </el-date-picker>
                    </el-row>
                    <!--                设置答辩场地-->
                    <el-row>
                      <a-tag color="#ffd4d4" class="inner_tag">答辩场地</a-tag>
                      <el-select placeholder="请选择答辩场地"
                                 v-model="item.classroomId"
                                 @change="timeOrSpaceChanged"
                                 style="width: 400px">
                        <el-option
                          v-for="(it, idx) in classroomInfo"
                          :key=idx
                          :label="it.classroomName"
                          :value="it.classroomId">
                        </el-option>
                      </el-select>
                    </el-row>
                  </el-col>
                  <!--                保存、更新按钮-->
                  <el-col :span="4">
                    <el-row>
                      <el-button type="primary" size="mini" @click="submitCurrentGroupArrange(index)">保存</el-button>
                    </el-row>
                    <el-row style="margin-top: 10px">
                      <el-button type="success" size="mini" @click="updateCurrentGroupArrange(index)">更新</el-button>
                    </el-row>
                  </el-col>
                </el-row>
              </el-card>
              <!--            发布或撤回分组结果-->
              <el-row type="flex" justify="center" style="margin-top: 20px">
                <el-popconfirm
                  title="确定要发布当前答辩安排吗？"
                  @confirm="releaseAllArrange"
                >
                  <el-button type="primary" slot="reference">发布安排</el-button>
                </el-popconfirm>
                <el-popconfirm
                  title="确定要撤回已发布的安排吗？"
                  @confirm="withdrawAllArrange"
                >
                  <el-button type="success" slot="reference">撤回安排</el-button>
                </el-popconfirm>
              </el-row>
            </div>
          </el-collapse-item>
          <!--          折叠框5--查看已发布的答辩安排-->
          <el-collapse-item>
            <template slot="title">
              <a-tag color="#e6e5ea" class="collapse_title_tag">
                <i class="el-icon-files"></i>
                查看已发布的答辩安排
              </a-tag>
            </template>
            <!--            答辩安排已发布，在此可以查看-->
            <div v-if="hasPleaArranged">
              <el-card class="team_info_card"
                       v-for="(item, index) in pleaArrangeInfo" :key="index">
                <el-row class="group_info">
                  <!--                小组编号-->
                  <el-col :span="6">
                    组号：
                    <a-tag color="#f6f6f4" class="inner_tag">{{ index + 1 }}</a-tag>
                  </el-col>
                  <!--                学生、老师信息-->
                  <el-col :span="6">
                    <!--                查看该组学生-->
                    <el-row>
                      <a-tag color="cyan" class="inner_tag" @click="viewChosenStudentGroupInfo(item.stuGroup.students)">学生信息</a-tag>
                    </el-row>
                    <!--                查看该组专家-->
                    <el-row>
                      <a-tag color="blue" class="inner_tag" @click="viewChosenTutorGroupInfo(item.teacherTeam.teachers)">专家信息</a-tag>
                    </el-row>
                    <!--                查看该组答辩秘书-->
                    <el-row>
                      <a-tag color="green" class="inner_tag" @click="viewChosenSecretaryGroupInfo(item.teacherTeam.secretary)">答辩秘书</a-tag>
                    </el-row>
                  </el-col>
                  <!--                时间、场地设置-->
                  <el-col>
                    <!--                设置答辩时间-->
                    <el-row>
                      <a-tag color="#f6f6f4" class="inner_tag">答辩时间</a-tag>
                      <el-date-picker
                        @blur="timeOrSpaceChanged"
                        v-model="item.time"
                        type="datetimerange"
                        range-separator="至"
                        start-placeholder="开始日期"
                        end-placeholder="结束日期"
                        value-format="yyyy-MM-dd HH:mm:ss">
                      </el-date-picker>
                    </el-row>
                    <!--                设置答辩场地-->
                    <el-row>
                      <a-tag color="#ffd4d4" class="inner_tag">答辩场地</a-tag>
                      {{item.classroomName}}
                    </el-row>
                  </el-col>
                </el-row>
              </el-card>
            </div>
            <!--            答辩安排暂未发布-->
            <a-result v-else
                      status="warning"
              title="答辩安排尚未发布哦！">
              <template #extra>
              </template>
            </a-result>
          </el-collapse-item>
        </el-collapse>
      </el-card>
    </el-row>
    <!--    查看选择中小组学生信息对话框-->
    <el-dialog title="学生小组信息"
               width="65%" center
               :visible.sync="stuGroupInfoVisible">
      <!--    表格-->
      <el-table :data="currentStuInfo"
                  size="medium"
                  style="font-size: 15px"
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
    </el-dialog>
    <!--    查看选择中小组教师信息对话框-->
    <el-dialog title="专家小组信息"
               width="65%" center
               :visible.sync="tutorGroupInfoVisible">
      <!--    表格-->
      <el-table :data="currentTutorInfo"
                size="medium"
                style="font-size: 15px"
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
    </el-dialog>
    <!--    查看选择中小组答辩秘书信息对话框-->
    <el-dialog title="答辩秘书信息"
               width="30%" center
               :visible.sync="secretaryGroupInfoVisible">
      <div style="font-size: 18px;">
        <el-row>
          <el-col :span="4">姓名：</el-col>
          <el-col :span="10">{{currentSecretaryInfo.realName}}</el-col>
        </el-row>
        <el-row>
          <el-col :span="4">电话：</el-col>
          <el-col :span="10">{{currentSecretaryInfo.tel}}</el-col>
        </el-row>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import stuInfo from '@/components/startSubject/arrangePlea/StudentInfo'
import tutorInfo from '@/components/startSubject/arrangePlea/TutorInfo'

export default {
  name: 'ArrangePlea',
  components: { stuInfo, tutorInfo },
  mounted() {
    this.getArrangeResult()
    this.getClassroomInfo()
    this.getPleaArrangeResult()
  },
  data() {
    return {
      // 是否已有分组的标识符
      hasDivideArranged: false,
      // 是否已有答辩安排
      hasPleaArranged: false,
      arrangeInfo: {
        teamNum: '', // 答辩小组个数
        stage: 'KT' // 答辩安排所属阶段--此处未开题
      },
      // 答辩安排结果
      pleaArrangeInfo: [],
      // 教室信息
      classroomInfo: [],
      // 查询分组结果参数
      queryInfo: {
        page: 1, // 当前页号
        size: 1000, // 页面大小
        stage: 'KT' // 阶段
      },
      // 学生答辩分组结果
      studentPleaTeams: [],
      // 老师答辩分组结果
      tutorPleaTeams: [],
      // 当前阶段
      stage: 'KT',
      // 学生小组信息对话框可见性
      stuGroupInfoVisible: false,
      // 导师小组信息对话框可见性
      tutorGroupInfoVisible: false,
      // 秘书小组信息对话框可见性
      secretaryGroupInfoVisible: false,
      // 选中学生小组信息
      currentStuInfo: {},
      // 选中导师小组信息
      currentTutorInfo: {},
      // 选中秘书小组信息
      currentSecretaryInfo: {},
      // 当前组安排信息
      currentGroupArrangeInfo: {
        stuGroupId: '',
        acceptanceTeamId: '',
        classroomId: '',
        stage: 'KT'
      }
    }
  },
  methods: {
    // 开始随机分组
    async startRandomDivide() {
      this.arrangeInfo.teamNum = parseInt(this.arrangeInfo.teamNum)
      const { data: res1 } = await this.$http.post('http://127.0.0.1:9528/account/plea/teacher', this.arrangeInfo)
      const { data: res2 } = await this.$http.post('http://127.0.0.1:9528/account/plea/student', this.arrangeInfo)
      if (res1.meta.code === 200) {
        this.$message.success('教师答辩分组安排成功！')
      } else {
        this.$message.warning('教师' + res1.meta.message)
        await this.deleteArrangeResult()
      }
      if (res2.meta.code === 200) {
        this.$message.success('学生答辩分组安排成功！')
      } else {
        this.$message.warning('学生' + res2.meta.message)
        await this.deleteArrangeResult()
      }
      await this.getArrangeResult()
    },
    // 获取分组安排结果
    async getArrangeResult() {
      const { data: teacherRes } = await this.$http.get('http://127.0.0.1:9528/account/plea/teacherTeam', { params: this.queryInfo })
      this.tutorPleaTeams = teacherRes.data.records
      const { data: studentRes } = await this.$http.get('http://127.0.0.1:9528/account/plea/studentGroup', { params: this.queryInfo })
      this.studentPleaTeams = studentRes.data.records
      if (undefined === teacherRes.data.records) {
        this.hasDivideArranged = false
      } else {
        this.hasDivideArranged = true
        for (let i = 0; i < this.tutorPleaTeams.length; i++) {
          this.tutorPleaTeams[i].time = null
          this.tutorPleaTeams[i].classroomId = null
        }
        for (let i = 0; i < this.studentPleaTeams.length; i++) {
          this.studentPleaTeams[i].time = null
          this.studentPleaTeams[i].classroomId = null
        }
      }
    },
    // 获取答辩安排结果
    async getPleaArrangeResult() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/plea', { params: this.queryInfo })
      if (res.meta.code === 200) {
        if (res.data.total === 0 || !res.data.records[0].isRelease) {
          this.hasPleaArranged = false
        } else {
          this.pleaArrangeInfo = res.data.records
          this.hasPleaArranged = true
          for (let i = 0; i < this.pleaArrangeInfo.length; i++) {
            this.pleaArrangeInfo[i].time = [this.pleaArrangeInfo[i].startTime, this.pleaArrangeInfo[i].endTime]
          }
        }
      } else {
        this.$notify.error('获取答辩安排失败！')
      }
    },
    // 删除已分组信息
    async deleteArrangeResult() {
      const { data: res } = await this.$http.delete('http://127.0.0.1:9528/account/plea/delete', { params: { stage: this.stage } })
      if (res.meta.code === 200) {
        this.$message.success('成功撤销答辩分组结果！')
      } else {
        this.$message.warning('删除分组结果失败！')
      }
      await this.getArrangeResult()
    },
    // 获取教室信息
    async getClassroomInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/account/plea/classroom')
      if (res.meta.code === 200) {
        this.classroomInfo = res.data
      } else {
        this.$message.warning(res.meta.message)
      }
    },
    // 提交当前小组时间、地点安排
    async submitCurrentGroupArrange(index) {
      this.currentGroupArrangeInfo.acceptanceTeamId = this.tutorPleaTeams[index].teamId
      this.currentGroupArrangeInfo.stuGroupId = this.studentPleaTeams[index].groupId
      this.currentGroupArrangeInfo.classroomId = this.studentPleaTeams[index].classroomId
      this.currentGroupArrangeInfo.startTime = this.studentPleaTeams[index].time[0]
      this.currentGroupArrangeInfo.endTime = this.studentPleaTeams[index].time[1]
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/plea', this.currentGroupArrangeInfo)
      if (res.meta.code !== 200) this.$message.error(res.meta.message)
      else {
        this.$message.success(res.meta.message)
      }
    },
    // 更新当前小组时间、地点安排
    async updateCurrentGroupArrange(index) {
      this.currentGroupArrangeInfo.acceptanceTeamId = this.tutorPleaTeams[index].teamId
      this.currentGroupArrangeInfo.stuGroupId = this.studentPleaTeams[index].groupId
      this.currentGroupArrangeInfo.classroomId = this.studentPleaTeams[index].classroomId
      this.currentGroupArrangeInfo.startTime = this.studentPleaTeams[index].time[0]
      this.currentGroupArrangeInfo.endTime = this.studentPleaTeams[index].time[1]
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/plea', this.currentGroupArrangeInfo)
      if (res.meta.code !== 200) this.$message.error(res.meta.message)
      else {
        this.$message.success(res.meta.message)
      }
    },
    // 发布所有小组的答辩安排
    async releaseAllArrange() {
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/plea/true', { stage: 'KT' })
      if (res.meta.code === 200) {
        this.$message.success(res.meta.message)
      } else {
        this.$message.error(res.meta.message)
      }
      await this.getPleaArrangeResult()
    },
    // 撤回所有小组的答辩安排
    async withdrawAllArrange() {
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/plea/false', { stage: 'KT' })
      if (res.meta.code === 200) {
        this.$message.success(res.meta.message)
      } else {
        this.$message.error(res.meta.message)
      }
      await this.getPleaArrangeResult()
    },
    // 删除所有已有的答辩安排
    async deleteAllArrange() {
      const { data: res } = await this.$http.delete('http://127.0.0.1:9528/plea', { params: { stage: 'KT' } })
      if (res.meta.code === 200) {
        this.$message.success(res.meta.message)
      } else {
        this.$message.error(res.meta.message)
      }
      await this.getPleaArrangeResult()
    },
    // 查看选中学生小组信息
    viewChosenStudentGroupInfo(stuInfo) {
      this.currentStuInfo = stuInfo
      this.stuGroupInfoVisible = true
    },
    // 查看选中导师小组信息
    viewChosenTutorGroupInfo(tutorInfo) {
      this.currentTutorInfo = tutorInfo
      this.tutorGroupInfoVisible = true
    },
    // 查看选中秘书小组信息
    viewChosenSecretaryGroupInfo(secretaryInfo) {
      this.currentSecretaryInfo = secretaryInfo
      this.secretaryGroupInfoVisible = true
    },
    // 强制页面更新
    timeOrSpaceChanged() {
      this.$forceUpdate()
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

/*最外层卡片*/
.outer_card {
  width: 100%;
  border-radius: 4px;
  background: #ffffff;
  box-shadow: 28px 28px 56px #bababa,
    -28px -28px 56px #ffffff;
}

/*折叠面板标题中的Tag*/
.collapse_title_tag {
  font-size: 16px;
  color: #343232;
}

/*分组安排折叠框*/
.group_arrange {
  display: flex;
  font-size: 18px;
  align-items: center;
  justify-content: center;
}

/*单个小组分组信息*/
.group_info {
  font-size: 15px;
  display: flex;
  align-items: center;
  justify-content: center;
}

/*Tag*/
.inner_tag {
  font-size: 15px;
  color: #393e46;
}
</style>
