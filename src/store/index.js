import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import router from '../router'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    loginStatus:JSON.parse(localStorage.getItem('loginStatus')) || 0,
    userInfo:JSON.parse(localStorage.getItem('userInfo'))||{}, //存储登录用户的相关信息
  },
  mutations: {
    // 登录后
    login(state,payload){
      state.loginStatus = 1;
      state.userInfo = payload;
      router.push('/');
    },
    // 注销
    logout_mutations(state){
      state.loginStatus = 0;
      state.userInfo = {};
      localStorage.clear()
    },
  },
  actions: {
    // router_push(){
    //   // router.push('/');
    // },
    // login_actions(context,payload){
    //   axios.post('/t_login',payload).then(res=>{
    //     if(res.data.code == 1){
    //       // console.log(state.userInfo)
    //       context.commit('login',res.data.results.email)
    //       // 将用户登录状态保存到webstorage中
    //       localStorage.setItem('loginStatus',1);
    //       localStorage.setItem('userInfo',JSON.stringify(res.data.results.email))
    //       // 页面跳转
    //       router.push('/')
    //     }else{
    //       // this.$messagebox('提示信息','用户名或者密码错误')
    //       // context.commit('topFailTips',true)
    //       console.log(12)
    //     }
    //   })
    // }
  },
  modules: {
  }
})
