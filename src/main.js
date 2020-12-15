import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import qs from 'qs'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
// 自定义组件
import LoginNav from './components/LoginNav.vue'       //登录注册头部
import LoginFooter from './components/LoginFooter.vue' //登录注册底部
import myInput from './components/Input.vue' //登录注册底部
import MyHeader from './components/MyHeader.vue' //头部导航栏
import MyFoot from './components/MyFoot.vue' //底部水平导航栏
import navTotop from './components/navTotop.vue' //回到顶部导航栏
import Models_right from './components/Models_right.vue' //Models右边
import Models_centent from './components/Models_centent.vue' //Models中间
import Models_bottom from './components/Models_bottom.vue' //Models下边
// import Details from './components/Details.vue' //详情页
import Calculator from './components/Calculator.vue' //计算车分期价格
 
// 页面滚动插件
import 'fullpage.js/vendors/scrolloverflow';
import VueFullPage from 'vue-fullpage.js';

Vue.use(ElementUI);
Vue.use(VueFullPage);

Vue.config.productionTip = false

axios.defaults.baseURL = 'http://127.0.0.1:5050'
Vue.prototype.axios = axios;
Vue.config.productionTip = false

Vue.prototype.qs = qs;

Vue.component('login-nav',LoginNav)
Vue.component('login-footer',LoginFooter)
Vue.component('my-input',myInput)
Vue.component('my-header',MyHeader)
Vue.component('my-foot',MyFoot)
Vue.component('Models-right',Models_right)
Vue.component('Models-centent',Models_centent)
Vue.component('Models-bottom',Models_bottom)
// Vue.component('Details',Details)
Vue.component('Calculator',Calculator)
Vue.component('NavTotop',navTotop)

/* 路由发生变化修改页面title */
router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title
  }
  next()
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
