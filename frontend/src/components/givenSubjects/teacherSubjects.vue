<template>
<div>
  <!--    面包屑导航区域-->
  <el-breadcrumb separator-class="el-icon-arrow-right">
    <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item>出题管理</el-breadcrumb-item>
    <el-breadcrumb-item>教师出题</el-breadcrumb-item>
  </el-breadcrumb>
  <!--卡片视图区-->
  <el-card class="bg-card" style="padding-left: 10px">
    <el-row type="flex" class="bg-gray">

      <el-col>
        <div class="bg-white">
          <div class="card_header">教师课题申报表</div>
          <el-row type="flex" justify="center">
            <el-col class="formbox">
              <el-form ref="subject" :model="subject" :rules="addFormRules" label-width="80px">
                <el-row>
                  <el-col :span="10">
                    <el-form-item label="课题名称" prop="subName">
                      <el-input v-model="subject.subName"></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="7">
                    <el-form-item label="申报人" prop="teacherName">
                      <el-input v-model="subject.teacherName"></el-input>
                    </el-form-item>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10">
                    <el-form-item label="题目类型" prop="type">
                      <el-select style="width: 100%;" v-model="subject.zone" placeholder="请选择课题类型">
                        <el-option label="科学探索与技术创新" value="KXTS"></el-option>
                        <el-option label="生命名关怀与社会认知" value="SMGH"></el-option>
                        <el-option label="哲学智慧与创新思维" value="ZXZH"></el-option>
                      </el-select>
                    </el-form-item>
                  </el-col>
                  <el-col :span="12">
                    <el-form-item label="申报时间">
                      <el-row>
                        <el-col :span="6">
                          <el-date-picker type="date" placeholder="选择日期" v-model="subject.date1" style="width: 100%; " value-format="yyyy-MM-dd HH:mm:ss"></el-date-picker>
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
                    <el-form-item label="指导教师" prop="teacherName">
                      <el-input v-model="subject.teacherName"></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="7">
                    <el-form-item label="导师电话" prop="tel">
                      <el-input v-model="subject.tel"></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="7">
                    <el-form-item label="导师邮箱" prop="mail">
                      <el-input v-model="subject.mail"></el-input>
                    </el-form-item>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="20">
                    <el-form-item label="课题内容" prop="description">
                      <el-input type="textarea" v-model="subject.description"></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="20">
                    <el-form-item label="课题要求" prop="requirement">
                      <el-input type="textarea" v-model="subject.requirement"></el-input>
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
    <span>请问您确认提交课题申请吗？</span>
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
        subName: '',
        teacherName: '',
        zone: '',
        date1: '',
        date2: '',
        tel: '',
        mail: '',
        description: '',
        requirement: '',
        opinion: ''
      },
      dialogVisible: false,
      // 添加表单的验证规则对象
      addFormRules: {
        subName: [{ required: true, message: '请输入课题名称', trigger: 'blur' }, { min: 1, max: 20, message: '名字的长度在1~10个字符之间', trigger: 'blur' }],
        teacherName: [{ required: true, message: '请输入申报人姓名', trigger: 'blur' }],
        type: [{ required: true, message: '请选择课题类型', trigger: 'blur' }],
        tel: [{ required: true, message: '请输入您的电话号码', trigger: 'blur' }, { min: 1, max: 20, message: '名字的长度在1~10个字符之间', trigger: 'blur' }],
        mail: [{ required: true, message: '请输入您的邮箱', trigger: 'blur' }],
        description: [{ required: true, message: '请输入课题描述', trigger: 'blur' }],
        requirement: [{ required: true, message: '请输入课题要求', trigger: 'blur' }]
      }
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
  .bg-card{
    border-radius: 50px;
    background: linear-gradient(145deg, #adadad, #cdcdcd);
    box-shadow:  20px 20px 60px #9a9a9a,
    -20px -20px 60px #e6e6e6;
  }
  .bg-gray {
    /*background-color:lightgrey;*/
  }
  .bg-white {
    border-radius: 50px;
    background: #ffffff;
    box-shadow:  20px 20px 60px #cccccc,
    -20px -20px 60px #ffffff;
  }
  .card_header{
    margin-bottom: 50px;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    align-items: center;
  }
  .formbox {
    /*background-color: #a71d5d;*/
    padding-left: 80px;
  }
</style>
