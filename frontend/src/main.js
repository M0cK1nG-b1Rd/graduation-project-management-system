import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './plugins/element.js'
import './assets/css/global.css' // 导入全局样式
import './assets/fonts/iconfont.css' // 导入字体图标
import axios from 'axios'
// TODO 这里可以替换为后端的API根路径
// axios.defaults.baseURL = '' // 配置请求的根路径
Vue.prototype.$http = axios // 把axios挂载到Vue原型对象上

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
