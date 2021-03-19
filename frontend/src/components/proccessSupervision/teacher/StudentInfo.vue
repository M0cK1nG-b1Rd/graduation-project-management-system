<template>
  <div>
<!--    返回上一页按钮-->
    <el-row>
      <el-button icon="el-icon-caret-left" type="text" @click="returnPrevPage" style="font-size: 15px">
        返回上一页
      </el-button>
    </el-row>
<!--    课题名称-->
    <el-row type="flex" justify="center" style="font-weight: bold; font-size: 24px; margin: 20px">
      课题：{{subName}}
    </el-row>
<!--    学生信息-->
    <el-row type="flex" justify="center">
      <el-card>
        <el-row type="flex"
                justify="center"
                style="padding-left: 50px">
          <el-table
            style="font-size: 15px"
            :data="stuInfo"
            stripe>
            <!--        姓名-->
            <el-table-column
              prop="realName"
              label="姓名"
              width="150">
            </el-table-column>
            <!--        专业-->
            <el-table-column
              prop="majorName"
              label="专业"
              width="150">
            </el-table-column>
            <!--        班级-->
            <el-table-column
              prop="className"
              width="150"
              label="班级">
            </el-table-column>
            <!--        邮箱-->
            <el-table-column
              prop="mail"
              show-overflow-tooltip
              width="180"
              label="邮箱">
            </el-table-column>
            <!--        操作-->
            <el-table-column
              width="180"
              label="操作">
              <template slot-scope="scope">
                <!--            发布新阶段任务-->
                <el-tooltip class="item" effect="dark" :enterable="false" content="给该学生布置新的阶段任务" placement="top">
                  <el-button type="danger" icon="el-icon-edit"
                             circle size="mini" @click="viewNewTaskDrawer(scope.row)"></el-button>
                </el-tooltip>
                <!--            查看该学生所有阶段任务-->
                <el-tooltip class="item" effect="dark" :enterable="false" content="查看该学生的所有阶段任务" placement="top">
                  <el-button type="primary" icon="el-icon-view"
                             circle size="mini" @click="viewAllTask(scope.row)"></el-button>
                </el-tooltip>
                <!--            查看该学生统计信息-->
                <el-tooltip class="item" effect="dark" :enterable="false" content="查看该学生完成情况" placement="top">
                  <el-button type="warning" icon="el-icon-star-off" circle size="mini"></el-button>
                </el-tooltip>
              </template>
            </el-table-column>
          </el-table>
        </el-row>
      </el-card>
    </el-row>
<!--    布置新任务抽屉-->
    <el-drawer
      size="50%"
      :visible.sync="newTaskDrawerVisible"
      :direction="'rtl'">
      <div class="drawer_title" slot="title">
        布置新任务
      </div>
      <div style="margin-left: 20px">
<!--        任务名称-->
        <el-row type="flex" align="middle">
          <el-col :span="4" class="form_label">任务名称：</el-col>
          <el-col :span="16">
            <el-input size="medium" v-model="newTaskInfo.taskName"></el-input>
          </el-col>
        </el-row>
        <div class="divider"></div>
<!--        所属阶段-->
        <el-row type="flex" align="middle">
          <el-col :span="4" class="form_label">所属阶段：</el-col>
          <el-col :span="20">
            <el-select
              size="medium"
              style="width: 80%"
              v-model="newTaskInfo.stage"
              placeholder="请选择所属阶段">
              <el-option
                v-for="item in stageDict"
                :key="item.dictKey"
                :label="item.dictValue"
                :value="item.dictKey">
              </el-option>
            </el-select>
          </el-col>
        </el-row>
        <div class="divider"></div>
<!--        起止时间-->
        <el-row type="flex" align="middle">
          <el-col :span="4" class="form_label">起止时间：</el-col>
          <el-col :span="20">
            <el-date-picker
              style="width: 80%"
              size="medium"
              type="datetimerange"
              v-model="newTaskInfo.time"
              range-separator="-"
              start-placeholder="开始时间"
              end-placeholder="截止时间"
              value-format="yyyy-MM-dd HH:mm:ss">
            </el-date-picker>
          </el-col>
        </el-row>
        <div class="divider"></div>
<!--        任务要求及描述-->
        <el-row type="flex" align="middle">
          <el-col :span="4" class="form_label">任务描述：</el-col>
          <el-col :span="16">
            <el-input
              type="textarea"
              :autosize="{ minRows: 4}"
              placeholder="请输入对任务的描述及要求"
              v-model="newTaskInfo.description">
            </el-input>
          </el-col>
        </el-row>
        <div class="divider"></div>
<!--        发布任务表单-->
        <el-row type="flex" align="middle" justify="center">
          <el-popconfirm
            @confirm="submitNewTask"
            title="确定要发布该任务吗？">
            <el-button type="primary" slot="reference" plain>发布任务</el-button>
          </el-popconfirm>
        </el-row>
        <el-divider></el-divider>
<!--        上传附件-->
        <el-row type="flex" justify="center" style="font-weight: bold; font-size: 20px">上传附件</el-row>
        <div class="divider"></div>
        <el-row type="flex" justify="center">
          <el-popconfirm
            @confirm="uploaderVisible=true"
            title="上传附件前请确认已发布阶段任务！">
            <el-button slot="reference" type="success" plain>上传附件</el-button>
          </el-popconfirm>
        </el-row>
      </div>
    </el-drawer>
<!--    上传附件对话框-->
    <el-dialog
      title="上传附件"
      :visible.sync="uploaderVisible"
      width="30%">
      <uploader :doc-id="newTaskDocId"></uploader>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" plain @click="uploaderVisible = false">确 定</el-button>
      </span>
    </el-dialog>
<!--    查看某学生所有任务窗口-->
    <el-dialog
      title="该学生所有阶段任务"
      :visible.sync="viewAllTaskVisible"
      width="50%">
      <el-table
        :data="allTaskInfo"
        stripe
        style="width: 100%; font-size: 15px">
        <el-table-column
          prop="taskName"
          label="任务名称"
          width="180">
        </el-table-column>
        <el-table-column
          prop="stage"
          label="所属阶段"
          width="80">
        </el-table-column>
        <el-table-column
          prop="startTime"
          label="开始时间"
          width="80">
        </el-table-column>
        <el-table-column
          prop="endTime"
          label="截止时间"
          width="80">
        </el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script>
import dataDict from '@/assets/js/dataDict'
import Uploader from '@/plugins/upload-download/Uploader'

export default {
  name: 'StudentInfo',
  components: { Uploader },
  mounted() {
    // 通过路由参数获取学生信息,并存储到sessionStorage
    window.sessionStorage.setItem('subId', JSON.stringify(this.$route.params.subId))
    window.sessionStorage.setItem('stuInfo', JSON.stringify(this.$route.params.stuInfo))
    window.sessionStorage.setItem('subName', JSON.stringify(this.$route.params.subName))
    // 从数据字典获得参数
    this.subId = JSON.parse(window.sessionStorage.getItem('subId'))
    this.stuInfo = JSON.parse(window.sessionStorage.getItem('stuInfo'))
    this.subName = JSON.parse(window.sessionStorage.getItem('subName'))
    // 获取数据字典
    const fullDict = JSON.parse(window.sessionStorage.getItem('dict'))
    this.stageDict = dataDict.getDict(fullDict, 1).splice(2, 5)
  },
  // 实例销毁前，删除相应的sessionStorage
  beforeDestroy() {
    window.sessionStorage.removeItem('subId')
    window.sessionStorage.removeItem('stuInfo')
    window.sessionStorage.removeItem('subName')
  },
  data() {
    return {
      // 阶段字典
      stageDict: [],
      // 课题ID
      subId: '',
      // 选题学生信息
      stuInfo: [],
      // 所属课题名称
      subName: '',
      // 布置新任务抽屉可见性
      newTaskDrawerVisible: false,
      // 上传文件窗口可见性
      uploaderVisible: false,
      // 查看某学生所有任务详情窗口可见性
      viewAllTaskVisible: false,
      // 某学生所有任务信息
      allTaskInfo: [],
      // 新增任务信息
      newTaskInfo: {
        subId: '',
        stuId: '',
        taskName: '',
        stage: '',
        time: '',
        startTime: '',
        endTime: '',
        description: ''
      },
      // 新任务的docID
      newTaskDocId: ''
    }
  },
  methods: {
    // 回到上一页
    returnPrevPage() {
      this.$router.push('/process/teacher/give')
    },
    // 布置新任务
    viewNewTaskDrawer(row) {
      this.newTaskInfo.stuId = row.stuId
      this.newTaskInfo.subId = this.subId
      this.newTaskDrawerVisible = true
    },
    // 发布新任务（提交）
    async submitNewTask() {
      // 转换日期
      this.newTaskInfo.startTime = this.newTaskInfo.time[0]
      this.newTaskInfo.endTime = this.newTaskInfo.time[1]
      // 删除多余时间属性
      delete this.newTaskInfo.time
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/stage/task', this.newTaskInfo)
      if (res.meta.code === 200) {
        this.$notify.success(res.meta.message)
        this.newTaskDocId = res.data
        // 恢复时间属性
        this.newTaskInfo.time = ''
      } else {
        this.$notify.error(res.meta.message)
        // 恢复时间属性
        this.newTaskInfo.time = ''
      }
    },
    // 上传附件
    async uploadFile(docId) {},
    // 查看所有某学生阶段任务
    async viewAllTask(row) {
      this.newTaskInfo.stuId = row.stuId
      this.newTaskInfo.subId = this.subId
      this.viewAllTaskVisible = true
      await this.getAllTaskInfo(this.subId, row.stuId)
    },
    // 获得某学生所有任务信息
    async getAllTaskInfo(subId, stuId) {
      const queryInfo = {
        subId: subId,
        stuId: stuId
      }
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/stage/task', { params: queryInfo })
      if (res.meta.code === 200) {
      } else {
        this.$message.error('获取该学生阶段任务信息失败！')
      }
    }
  }
}
</script>

<style Lang="less" scoped>
/*卡片*/
.el-card{
  width: 90%;
  border-radius: 18px;
  background: #ffffff;
  box-shadow:  5px 5px 10px #ededed,
    -5px -5px 10px #ffffff;
}
/*抽屉标题*/
.drawer_title{
  font-size: 20px;
  font-weight: bold;
  text-align: center;
}
/*自定义表单的标题*/
.form_label{
  padding-left: 20px;
  font-size: 16px;
  text-align: start;
}
/*自定义分割线*/
.divider{
  height: 12px;
}
</style>
