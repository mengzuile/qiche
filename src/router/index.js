import Vue from 'vue'
import VueRouter from 'vue-router'
// import Index from '../views/Index.vue'
// import Login from '../views/Login.vue'  //登录页面
// import Register from '../views/Register.vue'  //注册页面
// import Helloworld from '../views/HelloWorld.vue'//测试用
// import Drive from '../views/Drive.vue'//预约试驾
// import MODEL3 from '../views/MODEL3.vue'
// import MODELS from '../views/MODELS.vue'
// import MODELX from '../views/MODELX.vue'
// import MODELY from '../views/MODELY.vue'
// import Cybertruck from '../views/Cybertruck.vue'
// import Design from '../views/Design.vue'


Vue.use(VueRouter)

const routes = [
  // {path: '/',name: 'Index',meta:{index:1,title:'特斯拉 | 中国'},component: Index},
  {
    path: '/',
    name: 'Index',
    meta:{index:1,title:'特斯拉 | 中国'},
    component:()=>import(/* webpackChunkName: "Index" */ '@/views/Index.vue')
  },
  //登录页面
  {
    path:'/login',
    name:'Login',
    meta:{index:1,title:'特斯拉 | 登录'},
    component:()=>import(/* webpackChunkName: "Login" */ '@/views/Login.vue')
  },   
   //注册页面
  { 
    path:'/register',
    name:'Register',
    meta:{index:1,title:'特斯拉 | 注册'},
    component:()=>import(/* webpackChunkName: "Register" */ '@/views/Register.vue')
  }, 
  // model3
  {
    path: '/model3',
    name: 'MODEL3',
    meta:{index:1,title:'Model 3 | 特斯拉中国'},
    component:()=>import(/* webpackChunkName: "MODEL3" */ '@/views/MODEL3.vue')
  },
  // models
  {
    path:'/models',
    name:'MODELS',
    meta:{index:1,title:'Model S | 特斯拉中国'},
    component:()=>import(/* webpackChunkName: "MODELS" */ '@/views/MODELS.vue')
  },
  // modelx
  {
    path:'/modelx',
    name:'MODELX',
    meta:{index:1,title:'Model X | 特斯拉中国'},
    component:()=>import(/* webpackChunkName: "MODELX" */ '@/views/MODELX.vue')
  },
  // modely
  {
    path:'/modely',
    name:'MODELY',
    meta:{index:1,title:'Model Y | 特斯拉中国'},
    component:()=>import(/* webpackChunkName: "MODELY" */ '@/views/MODELY.vue')
  },
  {
    path:'/cybertruck',
    name:'Cybertruck',
    meta:{index:1,title:'Cybertruck | 特斯拉中国'},
    component:()=>import(/* webpackChunkName: "Cybertruck" */ '@/views/Cybertruck.vue')
  },
  //预约试驾页
  {
    path:'/drive',
    name:'Drive',
    meta:{index:1,title:'Schedule a Test Drive | Tesla'},
    component:()=>import(/* webpackChunkName: "Drive" */ '@/views/Drive.vue')
  },
  //定制页
  {
    path:'/design',
    name:'Design',
    meta:{index:1,title:'设计您的专属特斯拉 | Tesla'},
    component:()=>import(/* webpackChunkName: "Design" */ '@/views/Design.vue')
  },
   //商品页
  {
    path:'/shopping',
    name:'Shopping',
    meta:{index:1,title:'设计您的专属特斯拉 | Tesla'},
    component:()=>import(/* webpackChunkName: "Shopping" */ '@/views/Shopping.vue')
  },
]


const router = new VueRouter({
  mode: 'history',
  routes
})

export default router
