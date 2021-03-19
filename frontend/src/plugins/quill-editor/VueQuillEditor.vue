<template>
  <div>
    <el-row>
      <quill-editor ref="myTextEditor" v-model="content"
                    :options="editorOption" style="height:600px;">
      </quill-editor>
    </el-row>
    {{content}}
  </div>
</template>
<script>
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import { quillEditor } from 'vue-quill-editor'

export default {
  props: ['initContent'],
  mounted() {
    this.content = this.initContent
  },
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
    // 向父组件返回表单内容
    returnContent() {
      return this.content
    }
  }
}
</script>
