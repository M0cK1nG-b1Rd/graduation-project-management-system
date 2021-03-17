<template>
  <div>
    <el-upload
      :headers="myHeaders"
      class="upload-demo"
      multiple
      drag
      ref="upload"
      :action="'http://127.0.0.1:9528/file/upload/' + docId"
      :on-preview="handlePreview"
      :on-remove="handleRemove"
      :file-list="fileList"
      :auto-upload="false">
      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
      <div slot="tip" class="el-upload__tip">文件格式无限制，单个文件大小不超过50Mb</div>
    </el-upload>
    <div class="download">
      <el-button @click="down">下载</el-button>
    </div>
  </div>
</template>
<script>
const token = window.sessionStorage.getItem('token')
export default {
  async mounted() {
    const { data: res } = await this.$http('http://127.0.0.1:9528/file/files/89894554')
    if (res.meta.code === 200) return this.$notify.success('文件信息拉取成功！')
    else {
      this.$notify.error('文件信息拉取失败！')
    }
  },
  data() {
    return {
      docId: 89894554,
      myHeaders: { Authentication: token },
      fileList: []
    }
  },
  methods: {
    submitUpload() {
      this.$refs.upload.submit()
    },
    handleRemove(file, fileList) {
      console.log(file, fileList)
    },
    handlePreview(file) {
      console.log(file)
    },
    async down() {
      const { data: res } = await this.$http.get('http://127.0.0.1:9528/file/download/89894554/19')
      if (res.status === 200) this.$notify.success('文件下载成功！')
      else this.$notify.error('失败了！')
    }
  }
}
</script>
