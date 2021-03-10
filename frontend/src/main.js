import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './plugins/element.js'
import './assets/css/global.css' // 导入全局样式
import './assets/fonts/iconfont.css' // 导入字体图标
import axios from 'axios' // 把axios挂载到Vue原型对象上
// 导入Ant-Design-Vue
import Antd from 'ant-design-vue'
import 'ant-design-vue/dist/antd.css'
// 导入可视化组件库DataV
import dataV from '@jiaminghi/data-view'
Vue.use(Antd)
Vue.use(dataV)

// TODO 这里可以替换为后端的API根路径
// axios.defaults.baseURL = '127.0.0.1' // 配置请求的根路径
// 设置axios请求拦截器(请求头中加一个token进行认证)
axios.interceptors.request.use(config => {
  config.headers.Authorization = window.sessionStorage.getItem('token')
  return config
})
Vue.prototype.$http = axios
Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
