<template>
  <div>
    <file-item v-for="(item, index) in fileInfo"
               :key="index"
               :file-name="item.fileName"
               :file-id="item.fileId"
               :doc-id="docId"></file-item>
  </div>
</template>

<script>
import fileItem from '@/plugins/upload-download/FileItem'
export default {
  name: 'Downloader',
  props: ['docId'],
  components: { fileItem },
  mounted() {
    this.getFileInfo()
  },
  data() {
    return {
      fileInfo: []
    }
  },
  methods: {
    // 根据docId获取文件信息列表
    async getFileInfo() {
      const { data: res } = await this.$http.get(`http://127.0.0.1:9528/file/files/${this.docId}`)
      if (res.meta.code === 200) {
        this.fileInfo = res.data
      } else {
        this.$message.error(res.meta.message)
      }
    }
  }
}
</script>

<style scoped>

</style>
