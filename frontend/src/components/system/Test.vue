<template>
  <div>
    <el-steps :active="active" finish-status="success">
      <el-step title="步骤 1"></el-step>
      <el-step title="步骤 2"></el-step>
      <el-step title="步骤 3"></el-step>
    </el-steps>
    <el-button style="margin-top: 12px;" @click="startArrange">开始评审安排</el-button>
<!--    对话框1-->
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible1"
      width="30%"
      >
      <span>获取安排信息成功！</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible1 = false">取 消</el-button>
    <el-button type="primary" @click="viewArrangeInfo">查看安排</el-button>
  </span>
    </el-dialog>
<!--    对话框2-->
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible2"
      width="30%"
      >
      <span>这是安排结果</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible2 = false">取 消</el-button>
    <el-button type="primary" @click="publishArrange">发布安排</el-button>
  </span>
    </el-dialog>
<!--    对话框3-->
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible3"
      width="30%"
    >
      <span>评审安排已发布，请通知教师及时查看</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible3 = false">取 消</el-button>
    <el-button type="primary" @click="finishArrange">完成安排</el-button>
  </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      active: 0,
      dialogVisible1: false,
      dialogVisible2: false,
      dialogVisible3: false
    }
  },
  methods: {
    next() {
      if (this.active++ > 2) this.active = 0
    },
    async startArrange() {
      this.dialogVisible1 = true
      // 获取安排信息，提示安排成功，成功则跳转下一界面
      const { data: res } = await this.$http.post('http://127.0.0.1:9528/thesisGroup')
      if (res.meta.code === 200) {
        this.$message.success('评审安排成功！')
      } else {
        this.$message.error('获取答辩安排信息失败！')
      }
      this.next()
    },
    viewArrangeInfo() {
      this.dialogVisible1 = false
      this.dialogVisible2 = true
    },
    publishArrange() {
      this.dialogVisible2 = false
      this.next()
      this.dialogVisible3 = true
    },
    finishArrange() {
      this.dialogVisible3 = false
      this.next()
    }
  }
}
</script>
