<template>
  <div>
    <el-row>
      <quill-editor ref="myTextEditor" v-model="content"
                    :options="editorOption" style="height:600px;">
      </quill-editor>
    </el-row>
    <el-row type="flex" justify="end">
      <el-button plain  type="info" @click="reset" :size="btnSize">清空</el-button>
      <el-button plain type="primary" @click="submit" :size="btnSize" style="margin-right: 10px">保存</el-button>
    </el-row>
  </div>
</template>
<script>
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import { quillEditor } from 'vue-quill-editor'

export default {
  created() {
    this.btnSize = ''
  },
  props: ['btnSize'],
  data() {
    return {
      // 富文本内容
      content: '',
      // 提示信息
      editorOption: {
        placeholder: '请在此编辑'
      }
    }
  },
  components: {
    quillEditor
  },
  methods: {
    // 当编辑时触发，更新显示
    onEditorChange({ editor, html, text }) {
      this.content = html
    },
    // 重置表单
    reset() {
      this.content = ''
    },
    // 提交表单内容, 触发自定义事件submit
    submit() {
      this.$emit('submit', this.content)
      this.$message.success('保存成功！')
    }
  }
}
</script>
