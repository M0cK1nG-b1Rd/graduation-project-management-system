<template>
  <!--  登陆界面最外层容器-->
  <div class="login_container">
    <!--    半透明盒子，达到背景透明-->
    <div class="login_container_alpha">
      <!--    登录表框-->
      <div class="login_box">
        <!--      登陆表框头像Logo区域-->
        <div class="avatar_box">
          <img src="../../assets/imgs/login_logo.jpg" alt="">
        </div>
        <!--        登陆表单系统名称-->
        <div class="login_title">
          快乐毕设管理系统
        </div>
        <!--      登陆表单区域-->
        <el-form label-width="0px" class="login_form"
                 ref="loginFormRef"
                 :model="loginForm" :rules="loginFormRules">
          <!--          用户名-->
          <el-form-item prop="username">
            <el-input
              v-model="loginForm.username"
              placeholder="请输入账号"
              prefix-icon="iconfont icon-user">
            </el-input>
          </el-form-item>
          <!--          密码-->
          <el-form-item prop="password">
            <el-input
              v-model="loginForm.password"
              show-password
              placeholder="请输入密码"
              @keyup.enter.native="login"
              prefix-icon="iconfont icon-3702mima">
            </el-input>
          </el-form-item>
          <!--          按钮-->
          <el-form-item class="btns">
            <el-button type="primary" @click="login">登录</el-button>
            <el-button type="info" @click="restLoginForm">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
      <!--      &lt;!&ndash;    底部动态特效&ndash;&gt;-->
      <!--      <div class="decoration">-->
      <!--        <dv-decoration-6 />-->
      <!--      </div>-->
    </div>
  </div>
</template>

<script>
import aesEncrypt from '@/assets/js/aesEncrypt'
import qs from 'qs'
export default {
  name: 'Login',
  data () {
    return {
      // 登陆表单的数据绑定对象
      loginForm: {
        username: '',
        password: ''
      },
      // 登陆表单验证规则
      loginFormRules: {
        username: [
          { required: true, message: '请输入您的账号', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入您的密码', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    // 重置表单内容
    restLoginForm () {
      this.$refs.loginFormRef.resetFields()
    },
    // 点击登陆按钮时触发
    login() {
      this.$refs.loginFormRef.validate(async (valid) => {
        if (!valid) return // 如果表单验证未通过，则直接返回
        // TODO 下面这一段在后端写好之后应该取消注释， 现在为了能够成功跳转到/home所以注释了
        // // TODO 此处需要修改为后端的API接口
        const EntropyForm = { username: '', password: '' }
        EntropyForm.password = aesEncrypt.encrypt(this.loginForm.password)
        EntropyForm.username = this.loginForm.username
        const { data: res } = await this.$http.post('http://127.0.0.1:9528/login', qs.stringify(EntropyForm))
        if (res.meta.code !== 200) return this.$message.error('登录失败, 请重试！')
        this.$message.success('欢迎登录“快乐毕设系统“ 祝您顺利毕业！')
        // 1. 将登录成功之后的token保存到客户端的sessionStorage中
        //    1.1 项目中除了登录之外的其他API接口，必须在登录成功之后才能访问
        //    1.2 token只应该在当前网站打开期间生效，所以需要将token存到sessionStorage而不是localStorage中
        window.sessionStorage.setItem('token', res.data.token)
        // 存用户信息
        const userInfo = res.data.user
        userInfo.roles = res.data.roles
        window.sessionStorage.setItem('userInfo', JSON.stringify(userInfo))
        // 存数据字典
        const { data: resp } = await this.$http.get('http://127.0.0.1:9528/dict/all')
        if (resp.meta.code !== 200) return this.$message.error('获取数据字典失败！')
        window.sessionStorage.setItem('dict', JSON.stringify(resp.data))
        // 2. 通过编程式导航跳转到后台主页， 路由地址是 /home
        await this.$router.push('/home')
      })
    }
  }
}
</script>

<style Lang="less" scoped>
.login_container {
  /* 设置背景图片，并铺满整个页面*/
  /* 参看网址： https://www.php.cn/css-tutorial-410405.html*/
  background-image: url("../../assets/imgs/login_backgrond_01.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  -webkit-background-size: cover;
  -o-background-size: cover;
  background-position: center 0;
  height: 100%;
}

/* 在背景图片上加一层半透明盒子，达到背景图片透明*/
/* 参看网址： https://www.php.cn/css-tutorial-410405.html*/
.login_container_alpha {
  width: 100%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.5);
}

.login_box {
  width: 450px;
  height: 300px;
  background-color: #fff;
  border-radius: 3px;
  position: absolute;
  border-radius: 5px;
  box-shadow: 0 0 20px;
  left: 50%;
  top: 50%;
  /*实现登录框半透明*/
  background-color: rgba(255, 255, 255, 0.5);
  transform: translate(-50%, -50%);
}

.avatar_box {
  height: 110px;
  width: 110px;
  border: 1px solid #eee;
  border-radius: 50%;
  padding: 10px;
  box-shadow: 0 0 10px;
  position: absolute;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fff;
}

img {
  width: 100%;
  height: 100%;
  border-radius: 50%;
}
/*登录表单上方系统名称*/
.login_title{
  position: absolute;
  left: 25%;
  top: 22%;
  font-size: 28px;
  font-weight: bold;
  font-family: Microsoft YaHei;
  text-shadow: 1px 1px 0 #E4FFFF;
}

.login_form {
  position: absolute;
  bottom: 0;
  width: 100%;
  padding: 0 20px;
  box-sizing: border-box;
}
/*底部按钮，右侧对齐*/
.btns {
  display: flex;
  justify-content: flex-end;
}
/*底部特效*/
decoration{
  width:100px;
  height:30px;
  left: 50%;
  transform: translate(-50%);
}
</style>
