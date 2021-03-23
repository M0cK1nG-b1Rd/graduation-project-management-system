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
import teacherSubjects from '../components/givenSubjects/teacherSubjects'
import checkMySubjects from '../components/givenSubjects/checkMySubjects'
import judgeSubjects from '../components/givenSubjects/judgeSubjects'
import ViewAllSubject from '@/components/chooseSubject/ViewAllSubject'
import ViewSujectDetail from '@/components/chooseSubject/ViewSujectDetail'
import ChooseSubjectApplication from '@/components/chooseSubject/ChooseSubjectApplication'
import JudgeApplication from '@/components/chooseSubject/JudgeApplication'
import ApplicationRecords from '@/components/chooseSubject/ApplicationRecords'
import StartReport from '@/components/startSubject/StartReport'
import MyRecord from '@/components/startSubject/MyRecord'
import CheckStartSubjects from '@/components/startSubject/CheckStartSubjects'
import MidReport from '@/components/midSubject/MidReport'
import MidRecord from '@/components/midSubject/MidRecord'
import CheckMidSubjects from '@/components/midSubject/CheckMidSubjects'
import StartPreScore from '@/components/startSubject/StartPreScore'
import InitialArrangePlea from '@/components/startSubject/arrangePlea/ArrangePlea'
import GiveTask from '@/components/proccessSupervision/teacher/ManageTask'
import StudentInfo from '@/components/proccessSupervision/teacher/StudentInfo'
import SetWeight from '@/components/scoreManage/SetWeight'
import MyTask from '@/components/proccessSupervision/student/MyTask'
import SubmitRecord from '@/components/proccessSupervision/student/SubmitRecord'
import JudgeTaskSubmit from '@/components/proccessSupervision/teacher/JudgeTaskSubmit'
import TaskStatistics from '@/components/proccessSupervision/TaskStatistics'
import Message from '@/components/message/Message'
import applyClosing from '@/components/finishSubject/applyClosing'
import MyScore from '@/components/scoreManage/MyScore'
import StuScoreList from '@/components/scoreManage/StuScoreList'
import CheckFinishSubjects from '@/components/finishSubject/CheckFinishSubjects'
import FinishPreScore from '@/components/finishSubject/FinishPreScore'
import MidPreScore from '@/components/midSubject/MidPreScore'
import CrossJudgeList from '@/components/finishSubject/CrossJudgeList'
import CrossJudgeArrange from '@/components/finishSubject/CrossJudgeArrange'
import MiddleArrangePlea from '@/components/midSubject/arrangePlea/ArrangePlea'
import FinishArrangePlea from '@/components/finishSubject/arrangePlea/ArrangePlea'
import MyInitialPleaArrange from '@/components/startSubject/arrangePlea/MyInitialPleaArrange'
import MyMiddlePleaArrange from '@/components/midSubject/arrangePlea/MyMiddlePleaArrange'
import MyFinishPleaArrange from '@/components/finishSubject/arrangePlea/MyFinishPleaArrange'

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
      // 欢迎页--主页
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
      // 通知箱
      {
        path: '/message',
        component: Message
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
      // 出题管理-教师出题
      {
        path: '/subject/apply/teacher',
        component: teacherSubjects
      },
      // 出题管理-审核查询界面
      {
        path: '/subject/apply/result',
        component: checkMySubjects
      },
      // 出题管理-教研室审核课题界面
      {
        path: '/subject/judge/final',
        component: judgeSubjects
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
      },
      // 教师审核学生选题申请
      {
        path: '/subject/select/judge/teacher',
        component: JudgeApplication
      },
      // 教师、教研办、学生查看选题记录
      {
        path: '/subject/select/result',
        component: ApplicationRecords
      },
      // 开题--学生上传开题报告
      {
        path: '/initial/myReport',
        component: StartReport
      },
      // 开题--学生查看开题记录
      {
        path: '/initial/myList',
        component: MyRecord
      },
      // 开题--教师审核开题信息
      {
        path: '/initial/startCheck',
        component: CheckStartSubjects
      },
      // 开题--答辩秘书进行评分
      {
        path: '/initial/score',
        component: StartPreScore
      },
      // 开题--教研室进行答辩安排
      {
        path: '/initial/arrange',
        component: InitialArrangePlea
      },
      // 开题--学生、老师、答辩秘书查看自己的答辩安排
      {
        path: '/initial/arrange/my',
        component: MyInitialPleaArrange
      },
      // 中期--学生上传中期报告
      {
        path: '/middle/myReport',
        component: MidReport
      },
      // 中期--学生查看中期记录
      {
        path: '/middle/myList',
        component: MidRecord
      },
      // 中期--教师审核中期报告
      {
        path: '/middle/midCheck',
        component: CheckMidSubjects
      },
      // 中期--教研室进行答辩安排
      {
        path: '/middle/arrange',
        component: MiddleArrangePlea
      },
      // 中期--学生、老师、答辩秘书查看自己的答辩安排
      {
        path: '/middle/arrange/my',
        component: MyMiddlePleaArrange
      },
      // 中期--秘书中期答辩评分
      {
        path: '/middle/score',
        component: MidPreScore
      },
      // 结题--学生结题申请
      {
        path: '/finish/apply',
        component: applyClosing
      },
      // 结题--教师审核结题申请
      {
        path: '/finish/finishCheck',
        component: CheckFinishSubjects
      },
      // 结题--学生查看结题状态
      {
        path: '/finish/myApplyList',
        component: MyRecord
      },
      // 结题--教研室进行答辩安排
      {
        path: '/finish/arrange',
        component: FinishArrangePlea
      },
      // 结题--学生、老师、答辩秘书查看自己的答辩安排
      {
        path: '/finish/arrange/my',
        component: MyFinishPleaArrange
      },
      // 结题--秘书结题答辩评分
      {
        path: '/finish/score',
        component: FinishPreScore
      },
      // 结题--教办安排论文交叉评审
      {
        path: '/finish/crossJudgeArrange',
        component: CrossJudgeArrange
      },
      // 结题--教师查看交叉评审名单
      {
        path: '/finish/crossJudge',
        component: CrossJudgeList
      },
      // 过程监督--教师布置任务
      {
        path: '/process/teacher/manage',
        component: GiveTask
      },
      // 过程监督--教师查看选某一课题的学生名单信息
      {
        path: '/process/teacher/stuInfo',
        name: 'processStuInfo',
        component: StudentInfo
      },
      // 教师审核学生提交的阶段任务
      {
        path: '/process/teacher/judge',
        component: JudgeTaskSubmit
      },
      // 过程监督--学生查看自己的任务
      {
        path: '/process/student/my',
        component: MyTask
      },
      // 过程监督--学生查看自己的提交记录
      {
        path: '/process/student/records',
        component: SubmitRecord
      },
      // 过程监督统计报表
      {
        path: '/process/statistics',
        component: TaskStatistics,
        name: TaskStatistics
      },
      // 成绩管理--权重配置
      {
        path: '/score/weight',
        component: SetWeight
      },
      // 成绩管理--学生查看自己各个阶段成绩
      {
        path: '/scoreManage/myScoreList',
        component: MyScore
      },
      // 成绩管理--老师查看所有学生详细成绩
      {
        path: '/scoreManage/totalList',
        component: StuScoreList
      }
    ]
  }
]

const router = new VueRouter({
  routes
})

// TODO 挂载路由导航守卫，当后端实现登录接口并返回token后，取消下面注释，挂载路由导航守卫
router.beforeEach((to, from, next) => {
  // to 将要访问的路径
  // from 代表从哪个路径跳转而来
  // next 是一个函数，表示放行
  if (to.path === '/login') return next() // 如果要去login则直接放行
  // 获取token
  const tokenStr = window.sessionStorage.getItem('token')
  if (!tokenStr) return next('/login') // 如果token为空，则强制跳转到/login
  next() // 如果token不为空，则放行
})
export default router
