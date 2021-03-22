<template>
  <div>
    <el-card>
    <el-collapse v-model="activeNames" @change="handleChange">
      <el-collapse-item>
        <template slot="title">
          <a-tag color="#FFFFCC" class="collapse_title_tag">
            <i class="el-icon-user"></i>
            查看评审人名单
          </a-tag>
        </template>
        <div class="tutor_info">
          <tutor-info></tutor-info>
        </div>
      </el-collapse-item>
      <el-collapse-item>
        <template slot="title">
          <a-tag color="#FFFFCC" class="collapse_title_tag">
            <i class="el-icon-user"></i>
            设置交叉评审安排
          </a-tag>
        </template>
        <div>简化流程：设计简洁直观的操作流程；</div>
        <div>清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；</div>
        <div>帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。</div>
      </el-collapse-item>
    </el-collapse>
    </el-card>
  </div>
</template>

<script>
import tutorInfo from '@/components/startSubject/arrangePlea/TutorInfo'
export default {
  name: 'CrossJudgeArrange',
  components: { tutorInfo },
  data() {
    return {
    }
  }
}
</script>

<style Lang="less" scoped>
/*折叠面板标题中的Tag*/
.collapse_title_tag {
  font-size: 16px;
  color: #343232;
}
</style>
