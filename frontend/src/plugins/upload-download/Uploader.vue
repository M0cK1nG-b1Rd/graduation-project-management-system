<template>
  <div>
    <el-upload
      class="upload-demo"
      :headers="myHeaders"
      ref="upload"
      multiple
      :action="'http://127.0.0.1:9528/file/upload/' + docId"
      :file-list="fileList"
      :auto-upload="false">
      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
    </el-upload>
  </div>
</template>
<script>
// const token = window.sessionStorage.getItem('token')
export default {
  name: 'Uploader',
  props: ['docId'],
  mounted() {
  },
  computed: {
    myHeaders() {
      return {
        Authentication: window.sessionStorage.getItem('token')
      }
    }
  },

  data() {
    return {
      // myHeaders: { Authentication: token },
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
