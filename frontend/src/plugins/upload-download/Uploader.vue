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
        <el-button plain slot="trigger" size="small" type="primary">选取文件</el-button>
        <el-button plain style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到系统</el-button>
      </div>
    </el-upload>
  </div>
</template>
<script>
const token = window.sessionStorage.getItem('token')
export default {
  name: 'Uploader',
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
