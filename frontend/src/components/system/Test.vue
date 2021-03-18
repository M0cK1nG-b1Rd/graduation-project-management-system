<template>
  <div>
    <div>
      <downloader :tip="'文件格式无限制，单个文件大小不超过50Mb'"></downloader>
    </div>
  </div>
</template>
<script>
import Downloader from '@/plugins/upload-download/Downloader'
export default {
  components: { Downloader },
  data() {
    return {
      docId: 89894554
    }
  },
  methods: {}
}
</script>
