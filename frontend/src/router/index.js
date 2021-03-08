import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../components/Login'
import Home from '../components/Home'

Vue.use(VueRouter)

const routes = [
  // 根路径重定向到登陆界面
  {
    path: '/',
    redirect: '/login'
  },
  // 登陆界面
  {
    path: '/login',
    component: Login
  },
  // 主页
  {
    path: '/home',
    component: Home
  }
]

const router = new VueRouter({
  routes
})

// TODO 挂载路由导航守卫，当后端实现登录接口并返回token后，取消下面注释，挂载路由导航守卫
// router.beforeEach((to, from, next) => {
//   // to 将要访问的路径
//   // from 代表从哪个路径跳转而来
//   // next 是一个函数，表示放行
//   if (to.path === '/login') return next() // 如果要去login则直接放行
//   // 获取token
//   const tokenStr = window.sessionStorage.getItem('token')
//   if (!tokenStr) return next('/login') // 如果token为空，则强制跳转到/login
//   next() // 如果token不为空，则放行
// })
export default router
