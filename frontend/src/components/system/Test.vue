<template>
  <div>
    <div class="wrap">
      <div class="title1">
        Google 的免费翻译服务可提供简体中文和另外
      </div>
      <div class="title2">
        Google 的免费翻译服务可提供简体中文和另外 100 多种语言之间的互译功能
      </div>
    </div>
  </div>
</template>

<script>
// import quillEditor from '@/plugins/quill-editor/VueQuillEditor'
export default {
  name: 'Test',
  components: {
  },
  data() {
  },
  methods: {
  }
}
</script>
<style Lang="less">
.wrap{
  width: 100px;
  position: relative;
}
.title1{
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.title2{
  position: absolute;
  top: 20px;
  width: 300px;
  background: red;
  display: none;
}
.wrap:hover .title2{
  display: block;
}
</style>
