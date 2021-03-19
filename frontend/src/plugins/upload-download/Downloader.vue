<template>
  <div>
    <el-upload
      :headers="myHeaders"
      class="upload-demo"
      multiple
      ref="upload"
      :action="'http://127.0.0.1:9528/file/upload/' + docId"
      :file-list="fileList"
      :auto-upload="false">
      <!--      提示文字-->
      <div slot="tip" class="el-upload__tip tips">{{ tip }}</div>
      <div class="body">
        <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
        <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到系统</el-button>
      </div>
    </el-upload>
    <!--下载调试-->
    <el-button style="margin-left: 10px;" size="small" type="success" @click="submitDownload">下载到系统</el-button>
  </div>
</template>
<script>
const token = window.sessionStorage.getItem('token')
export default {
  name: 'Downloader',
  props: ['tip', 'docId'],
  mounted() {
    if (this.docId === undefined) this.docId = ''
  },
  data() {
    return {
      myHeaders: { Authentication: token },
      fileList: []
    }
  },
  methods: {
    submitUpload() {
      this.$refs.upload.submit()
    },
    async submitDownload() {
      // eslint-disable-next-line no-unused-vars
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/file/download/test/34', {
        responseType: 'blob',
        headers: { Authentication: token }
      }).then(res => {
        if (res) {
          const blob = new Blob([res.data])
          if ('download' in document.createElement('a')) {
            const link = document.createElement('a')
            link.download = 'wallhaven-zxv71g_3840x2160.png' // 文件名，从后端获取
            link.style.display = 'none'
            link.href = URL.createObjectURL(blob)
            document.body.appendChild(link)
            link.click()// 执行下载
            URL.revokeObjectURL(link.href) // 释放url
            document.body.removeChild(link)// 释放标签
          } else {
            navigator.msSaveBlob(blob, 'wallhaven-zxv71g_3840x2160.png')
          }
        }
      })
        .catch((err) => {
          console.log(err)
        })
    }
  }
}
</script>

<style Lang="less" scoped>
/*提示信息*/
.tips {
  font-size: 15px;
}

.body {
  display: flex;
  justify-content: center;
}
</style>
