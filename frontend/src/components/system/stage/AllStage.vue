<template>
  <a-drawer
    title="系统阶段状态"
    :width="420"
    :visible="visibility"
    :body-style="{ paddingBottom: '80px', paddingLeft: '40px' }"
    @close="visibility = false"
  >
    <!--      步骤条-->
    <el-steps :space="100"
              direction="vertical"
              :active="3"
              finish-status="success">
      <el-step title="已完成"></el-step>
      <el-step title="进行中"></el-step>
      <el-step title="进行中"></el-step>
      <el-step title="进行中"></el-step>
      <el-step title="进行中"></el-step>
      <el-step title="进行中"></el-step>
      <el-step title="进行中"></el-step>
      <el-step title="进行中"></el-step>
      <el-step title="进行中"></el-step>
      <el-step title="进行中"></el-step>
      <el-step title="步骤 3"></el-step>
    </el-steps>
  </a-drawer>
</template>

<script>
export default {
  props: ['visibility'],
  name: 'AllStage'
}
</script>

<style scoped>

</style>
