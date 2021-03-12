<template>
  <div>
    <quill-editor :btn-size="'mini'"></quill-editor>
  </div>
</template>

<script>
import quillEditor from '@/plugins/VueQuillEditor'
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
