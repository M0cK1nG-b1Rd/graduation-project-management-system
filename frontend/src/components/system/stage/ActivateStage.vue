<template>
  <div>
    <el-row>
      <el-col :span="7" :offset="1">
        <el-select v-model="activatingStageId" filterable
                   multiple
                   :size="'medium'" placeholder="请选择需要激活的阶段">
          <el-option
            v-for="item in allStageInfo"
            :key="item.stageId"
            :label="item.stageName"
            :value="item.stageId">
          </el-option>
        </el-select>
      </el-col>
      <el-col :span="6">
        <el-button type="primary" @click="dialogVisible = true">确认激活</el-button>
      </el-col>
    </el-row>
    <!--    提示框-->
    <el-dialog
      title="温馨提示"
      :visible.sync="dialogVisible"
      width="30%">
      <span>提交后，阶段激活立即生效，请问您确认激活吗？</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="quitAcitvate">取 消</el-button>
    <el-button type="primary" @click="submitActivateRequest">确 定</el-button>
  </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'ActivateStage',
  data() {
    return {
      // 选中需要激活的阶段ID
      activatingStageId: [],
      // 所有阶段的信息
      allStageInfo: [],
      // 提示框可见性
      dialogVisible: false
    }
  },
  created() {
    this.getAllStageInfo()
  },
  methods: {
    // 获取所有阶段信息
    async getAllStageInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/stage/system')
      if (res.meta.code !== 200) return this.$message.error('请求阶段信息失败！')
      this.allStageInfo = res.data.allStage
      this.currentStageId = res.data.currentStageId
      this.totalStageNum = res.data.totalStageNum
    },
    // 提交激活请求
    async submitActivateRequest() {
      this.dialogVisible = false
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/stage/system/activate', this.activatingStageId)
      if (res.meta.code !== 200) return this.$message.error('激活请求失败！')
      this.$message.success('阶段激活成功！')
    },
    // 点击对话框取消激活时，清空选择框选中内容
    quitAcitvate() {
      this.dialogVisible = false
      this.activatingStageId = []
    }
  }
}
</script>

<style scoped>

</style>
