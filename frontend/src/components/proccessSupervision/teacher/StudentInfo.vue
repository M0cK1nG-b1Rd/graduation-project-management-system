<template>
  <div>{{subId}}</div>
</template>

<script>
export default {
  name: 'StudentInfo',
  mounted() {
    // 获取路由参数
    this.subId = this.$route.params.subId
    // 获取学生信息
  },
  data() {
    return {
      subId: ''
    }
  }
}
</script>

<style Lang="less" scoped>

</style>
