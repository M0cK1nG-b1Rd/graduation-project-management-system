<template>
<div>
  <!--    面包屑导航区域-->
  <el-breadcrumb separator-class="el-icon-arrow-right">
    <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item>出题管理</el-breadcrumb-item>
    <el-breadcrumb-item>教师出题</el-breadcrumb-item>
  </el-breadcrumb>
  <!--卡片视图区-->
  <el-card>
    <el-row type="flex" class="bg-gray">
      <el-col>
        <div class="bg-white">
          <div class="card_header">教师课题申报表</div>
          <el-row type="flex" justify="center">
            <el-col>
              <el-form ref="subject" :model="subject" label-width="80px">
                <el-row>
                  <el-col :span="10">
                    <el-form-item label="课题名称">
                      <el-input v-model="subject.subject_name"></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="7">
                    <el-form-item label="申报人">
                      <el-input v-model="subject.teacherName"></el-input>
                    </el-form-item>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10">
                    <el-form-item label="题目类型">
                      <el-select style="width: 100%;" v-model="subject.type" placeholder="请选择课题类型">
                        <el-option label="类型一" value="shanghai"></el-option>
                        <el-option label="类型二" value="beijing"></el-option>
                      </el-select>
                    </el-form-item>
                  </el-col>
                  <el-col :span="12">
                    <el-form-item label="申报时间">
                      <el-row>
                        <el-col :span="6">
                          <el-date-picker type="date" placeholder="选择日期" v-model="subject.date1" style="width: 100%;"></el-date-picker>
                        </el-col>
                        <el-col class="line" :span="0.5">---</el-col>
                        <el-col :span="6">
                          <el-time-picker placeholder="选择时间" v-model="subject.date2" style="width: 100%;"></el-time-picker>
                        </el-col>
                      </el-row>
                    </el-form-item>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="6">
                    <el-form-item label="指导教师">
                      <el-input v-model="subject.teacherName"></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="7">
                    <el-form-item label="导师电话">
                      <el-input v-model="subject.phone"></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="7">
                    <el-form-item label="导师邮箱">
                      <el-input v-model="subject.mail"></el-input>
                    </el-form-item>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="20">
                    <el-form-item label="课题内容">
                      <el-input type="textarea" v-model="subject.info"></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="20">
                    <el-form-item label="课题要求">
                      <el-input type="textarea" v-model="subject.require"></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="20">
                    <el-form-item label="审核意见">
                      <el-input type="textarea" v-model="subject.opinion" disabled></el-input>
                    </el-form-item>
                  </el-col>
                </el-row>
                <el-form-item>
                  <el-button type="primary" @click="dialogVisible=true">立即创建</el-button>
                  <el-button>取消</el-button>
                </el-form-item>
              </el-form>
            </el-col>
          </el-row>
        </div>
      </el-col>
    </el-row>
  </el-card>
  <!--    提示框-->
  <el-dialog
    title="温馨提示"
    :visible.sync="dialogVisible"
    width="30%">
    <span>提交后，阶段修改立即生效，请问您确认提交修改吗？</span>
    <span slot="footer" class="dialog-footer">
    <el-button @click="resetForm">取 消</el-button>
    <el-button type="primary" @click="subjectSubmit">确 定</el-button>
  </span>
  </el-dialog>
</div>
</template>

<script>
export default {
  name: 'teacherSubjects',
  data() {
    return {
      subject: {
        subject_name: '',
        teacherName: '',
        type: '',
        date1: '',
        date2: '',
        phone: 0,
        mail: '',
        info: '',
        require: '',
        opinion: ''
      },
      dialogVisible: false
    }
  },
  methods: {
    // 提交表单
    async subjectSubmit() {
      this.dialogVisible = false
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/subject', this.subject)
      if (res.meta.code !== 200) return this.$message.error('修改阶段信息失败！')
    },
    // 重置表单内容
    async resetForm() {
      this.dialogVisible = false
    }
  }
}
</script>

<style Lang="lang" scoped>
  .bg-gray {
    background-color: #f9fafc;
  }
  .bg-white {
    background-color: white;
  }
  .card_header{
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    align-items: center;
  }
</style>
