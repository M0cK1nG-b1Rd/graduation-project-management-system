import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../components/login/Login'
// import Home from '../components/common/Home'
import Welcome from '../components/common/Welcome'
import Users from '@/components/system/user/Users'
import Test from '@/components/system/Test'
import StageControl from '@/components/system/stage/StageControl'
import EditStage from '@/components/system/stage/EditStage'
import CurrentStage from '@/components/system/stage/CurrentStage'
import ActiveStage from '@/components/system/stage/ActivateStage'
import ViewNotice from '@/components/notice/ViewNotice'
import GlobalLayout from '@/components/common/GlobalLayout'
import ManageNotice from '@/components/notice/ManageNotice'
import ViewAllSubject from '@/components/chooseSubject/ViewAllSubject'
import ViewSujectDetail from '@/components/chooseSubject/ViewSujectDetail'
import ChooseSubjectApplication from '@/components/chooseSubject/ChooseSubjectApplication'

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
    component: GlobalLayout,
    redirect: '/welcome',
    children: [
      {
        path: '/welcome',
        component: Welcome
      },
      // 系统管理-用户管理
      {
        path: '/sys/user',
        component: Users
      },
      // 系统管理-测试组件
      {
        path: '/test',
        component: Test
      },
      // 系统管理-阶段控制
      {
        path: '/sys/stage',
        component: StageControl,
        children: [
          // 编辑并设置阶段
          {
            path: '/sys/stage/edit',
            component: EditStage
          },
          // 查看当前阶段详情
          {
            path: '/sys/stage/current',
            component: CurrentStage
          },
          // 所有==激活阶段
          {
            path: '/sys/stage/active',
            component: ActiveStage
          }
        ]
      },
      // 查看公告界面
      {
        path: '/notice/view',
        component: ViewNotice
      },
      // 公告增删改（管理）界面
      {
        path: '/notice/manage',
        component: ManageNotice
      },
      // 学生选题申请--查看所有课题信息
      {
        path: '/subject/all',
        component: ViewAllSubject
      },
      // 学生选题申请--查看选中（单个）课题详情
      {
        path: '/subject/detail',
        name: 'viewSubjectDetail',
        component: ViewSujectDetail
      },
      // 学生选题申请--提交选题申请
      {
        path: '/subject/application',
        name: 'chooseSubjectApplication',
        component: ChooseSubjectApplication
      }
    ]
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
