<template>
  <div>
<!--    编辑表单框-->
    <el-row :gutter="20">
      <el-col :span="20" :offset="2">
        <el-form label-width="80px" size="mini">
          <el-form-item label="阶段名称">
            <el-col :span="14">
              <el-select v-model="editingStageId" filterable clearable @change="updateForm"
                         :size="'small'" placeholder="请选择需要编辑的阶段">
                <el-option
                  v-for="item in allStageInfo"
                  :key="item.stageId"
                  :label="item.stageName"
                  :value="item.stageId">
                </el-option>
              </el-select>
            </el-col>
          </el-form-item>
          <el-form-item label="开始时间">
            <el-col :span="8">
              <el-date-picker type="date" placeholder="选择日期" v-model="editingForm.startTime" style="width: 100%;"></el-date-picker>
            </el-col>
            <el-col :span="8">
              <el-time-picker placeholder="选择时间" disabled style="width: 100%;"></el-time-picker>
            </el-col>
          </el-form-item>
          <el-form-item label="截止时间">
            <el-col :span="8">
              <el-date-picker type="date" placeholder="选择日期" v-model="editingForm.endTime" style="width: 100%;"></el-date-picker>
            </el-col>
            <el-col :span="8">
              <el-time-picker placeholder="选择时间" disabled style="width: 100%;"></el-time-picker>
            </el-col>
          </el-form-item>
          <el-form-item label="阶段描述">
            <el-col :span="16">
              <el-input type="textarea" :rows="6" v-model="editingForm.description"></el-input>
            </el-col>
          </el-form-item>
          <el-form-item size="mini">
            <el-button type="primary" @click="dialogVisible=true">提交编辑</el-button>
            <el-button @click="resetForm">取消修改</el-button>
          </el-form-item>
        </el-form>
      </el-col>
    </el-row>

<!--    提示框-->
<el-dialog
  title="温馨提示"
  :visible.sync="dialogVisible"
  width="30%">
  <span>提交后，阶段修改立即生效，请问您确认提交修改吗？</span>
  <span slot="footer" class="dialog-footer">
    <el-button @click="resetForm">取 消</el-button>
    <el-button type="primary" @click="submitEdit">确 定</el-button>
  </span>
</el-dialog>
  </div>
</template>

<script>
export default {
  name: 'EditStage',
  data() {
    return {
      // 所有阶段的信息
      allStageInfo: [],
      // 当前正在编辑的阶段Id
      editingStageId: '',
      // 编辑表单信息
      editingForm: {
        stageId: 0,
        stageName: '',
        description: '',
        isCurrent: '',
        startTime: '',
        endTime: ''
      },
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
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/stage/system/')
      if (res.meta.code !== 200) return this.$message.error('请求阶段信息失败！')
      // console.log(res)
      this.allStageInfo = res.data.allStage
      this.currentStageId = res.data.currentStageId
      this.totalStageNum = res.data.totalStageNum
    },
    // 当选中阶段变化时，更新表单内容
    updateForm() {
      this.editingForm = this.allStageInfo[this.editingStageId]
    },
    // 提交表单修改结果
    async submitEdit() {
      this.dialogVisible = false
      const { data: res } = await this.$http.put('http://127.0.0.1:9528/stage/system', this.editingForm)
      if (res.meta.code !== 200) return this.$message.error('修改阶段信息失败！')
      this.$message.success('修改阶段信息成功！')
      await this.getAllStageInfo()
    },
    // 重置表单内容
    async resetForm() {
      this.dialogVisible = false
      await this.getAllStageInfo()
      this.editingForm = this.allStageInfo[this.editingStageId]
    }
  }
}
</script>

<style Lang="less" scoped>

</style>
