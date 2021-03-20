<template>
  <div>
    <el-link icon="el-icon-caret-right" type="success" @click="submitDownload">{{fileName}}</el-link>
  </div>
</template>
<script>
const token = window.sessionStorage.getItem('token')
export default {
  name: 'FileItem',
  props: ['docId', 'fileId', 'fileName'],
  mounted() {
  },
  data() {
    return {
      myHeaders: { Authentication: token },
      fileInfo: []
    }
  },
  methods: {
    // 下载请求
    async submitDownload() {
      // eslint-disable-next-line no-unused-vars
      const { data: res } = await this.$http.get(`http://127.0.0.1:9528/file/download/${this.docId}/${this.fileId}`, {
        responseType: 'blob',
        headers: { Authentication: token }
      }).then(res => {
        if (res) {
          const blob = new Blob([res.data])
          if ('download' in document.createElement('a')) {
            const link = document.createElement('a')
            link.download = this.fileName // 文件名，从后端获取
            link.style.display = 'none'
            link.href = URL.createObjectURL(blob)
            document.body.appendChild(link)
            link.click()// 执行下载
            URL.revokeObjectURL(link.href) // 释放url
            document.body.removeChild(link)// 释放标签
          } else {
            navigator.msSaveBlob(blob, this.fileName)
          }
        }
      })
        .catch(() => {
          this.$message.error('下载出错！')
        })
    }
  }
}
</script>
