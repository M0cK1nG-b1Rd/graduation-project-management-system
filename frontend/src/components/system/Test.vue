<template>
  <div>
    <quill-editor :btn-size="'mini'"></quill-editor>
  </div>
</template>

<script>
import quillEditor from '@/plugins/quill-editor/VueQuillEditor'
export default {
  name: 'Test',
  components: {
    quillEditor
  },
  data() {
  },
  methods: {
  }
}
</script>
<style Lang="less"></style>
