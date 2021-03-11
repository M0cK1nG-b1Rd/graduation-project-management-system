<template>
  <div>
    <el-card v-for="item in currentStageInfo" :key="item.stageId">
      <el-row>
        <el-col :span="20" :offset="2">
          <el-form label-width="80px" disabled size="mini">
            <el-form-item label="阶段名称">
              <el-col :span="14">
                <el-select v-model="item.stageName" filterable clearable
                           :size="'small'" placeholder="请选择需要编辑的阶段">
                </el-select>
              </el-col>
            </el-form-item>
            <el-form-item label="开始时间">
              <el-col :span="8">
                <el-date-picker type="date" placeholder="选择日期" v-model="item.startTime" style="width: 100%;"></el-date-picker>
              </el-col>
              <el-col :span="8">
                <el-time-picker placeholder="选择时间" disabled style="width: 100%;"></el-time-picker>
              </el-col>
            </el-form-item>
            <el-form-item label="截止时间">
              <el-col :span="8">
                <el-date-picker type="date" placeholder="选择日期" v-model="item.endTime" style="width: 100%;"></el-date-picker>
              </el-col>
              <el-col :span="8">
                <el-time-picker placeholder="选择时间" disabled style="width: 100%;"></el-time-picker>
              </el-col>
            </el-form-item>
            <el-form-item label="阶段描述">
              <el-col :span="16">
                <el-input type="textarea" :rows="6" v-model="item.description"></el-input>
              </el-col>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'CurrentStage',
  data() {
    return {
      // 所有阶段的信息
      allStageInfo: [],
      // 当前阶段ID
      currentStageId: [],
      // 当前阶段信息
      currentStageInfo: []
    }
  },
  created() {
    this.getAllStageInfo()
  },
  methods: {
    // 获取所有阶段信息
    async getAllStageInfo() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/stage/system')
      // const { data: res } = await this.$http.get('/mock/current_stage.json')
      if (res.meta.code !== 200) return this.$message.error('请求阶段信息失败！')
      this.allStageInfo = res.data.allStage
      this.currentStageId = res.data.currentStageId
      for (let i = 0; i < this.currentStageId.length; i++) {
        this.currentStageInfo[i] = this.allStageInfo[this.currentStageId[i]]
      }
      console.log(this.currentStageInfo)
    }
  }
}
</script>

<style scoped>

</style>
