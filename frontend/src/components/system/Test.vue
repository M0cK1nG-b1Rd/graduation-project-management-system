<template>
  <div>
    <downloader :doc-id="'9f772ce77c484c7ba5d80a11e12c7821'"></downloader>
  </div>
</template>
<script>
import Downloader from '@/plugins/upload-download/Downloader'
export default {
  name: 'Test',
  components: { Downloader },
  mounted() {
  },
  data() {
    return {}
  }
}
</script>
