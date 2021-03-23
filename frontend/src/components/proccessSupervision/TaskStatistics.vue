<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>过程监督</el-breadcrumb-item>
      <el-breadcrumb-item>我的任务</el-breadcrumb-item>
    </el-breadcrumb>
    <!--    外层卡片区-->
    <el-card class="outer_card">
      <!--      页面标题-->
      <el-row type="flex" justify="center" class="page_title">统计数据</el-row>
      <el-divider></el-divider>
<!--      任务总数-->
<!--      任务通过率-->
      <dv-decoration-9
          style="width:150px;height:150px;font-size: 25px">
          {{statisticsInfo.passRatio}}%
    </dv-decoration-9>
<!--      任务通过次数-->
<!--      任务驳回次数-->
<!--      平均得分-->
      <dv-water-level-pond :config="swtconfig" style="width:150px;height:200px" />
      <dv-percent-pond :config="jdcconfig" style="width:200px;height:100px;" />
      <dv-capsule-chart :config="jnztconfig" style="width:300px;height:200px;color: #393e46" />
      <dv-conical-column-chart :config="zxztconfig" style="width:400px;height:200px;"/>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'TaskStatistics',
  mounted() {
    this.getStatistics()
  },
  data() {
    return {
      statisticsInfo: {
        avgScore: Number, // 所有任务的平均分
        totalTask: Number, // 总共的任务数量
        passedTask: Number, // 通过的任务数
        rejectTimes: Number, // 被驳回的次数
        passRatio: Number // 通过率
      },
      // 水位图
      swtconfig: {
        data: [55],
        shape: 'round'
      },
      // 进度池
      jdcconfig: {
        value: 66,
        borderWidth: 5,
        borderRadius: 10,
        borderGap: 5
      },
      // 胶囊柱图
      jnztconfig: {
        data: [
          {
            name: '南阳',
            value: 167
          },
          {
            name: '周口',
            value: 67
          },
          {
            name: '漯河',
            value: 123
          },
          {
            name: '郑州',
            value: 55
          },
          {
            name: '西峡',
            value: 98
          }
        ]
      },
      // 锥型柱图
      zxztconfig: {
        data: [
          {
            name: '周口',
            value: 55
          },
          {
            name: '南阳',
            value: 120
          },
          {
            name: '西峡',
            value: 71
          },
          {
            name: '驻马店',
            value: 66
          },
          {
            name: '新乡',
            value: 80
          },
          {
            name: '信阳',
            value: 35
          },
          {
            name: '漯河',
            value: 15
          }
        ],
        showValue: true,
        textColor: '#000',
        fontSize: 15
      }
    }
  },
  methods: {
    async getStatistics() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/statistics/stageTask')
      if (res.meta.code === 200) {
        this.statisticsInfo = res.data
        this.statisticsInfo.passRatio = this.statisticsInfo.passedTask / (this.statisticsInfo.rejectTimes + this.statisticsInfo.passedTask)
        this.statisticsInfo.passRatio *= 100
      } else {
        this.$message.error(res.meta.message)
      }
    }
  }
}
</script>

<style Lang="less" scoped>
/*外层卡片*/
.outer_card{
  padding: 50px;
}
/*页面标题*/
.page_title{
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}
/*自定义分割线*/
.divider{
  height: 12px;
}
</style>
