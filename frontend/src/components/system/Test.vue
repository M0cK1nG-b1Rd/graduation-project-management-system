<template>
  <div>
    <quill-editor ref="editor"></quill-editor>
  </div>
</template>
<script>
import quillEditor from '@/plugins/quill-editor/VueQuillEditor'
export default {
  components: { quillEditor },
  data() {
    return {
      content: ''
    }
  }
}
</script>
