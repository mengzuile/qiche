<template>
  <div id="home">
    <my-header></my-header>
    <!-- 车基本页 -->
    <div class="base-desc" :style="{opacity}">
      <div class="carTitle">
        <h1 v-text="title"></h1>
        <span><router-link :class="aChange" to="/drive" v-text='drive'></router-link></span>
      </div>
      <div class="carbtn">
        <!-- 定制/了解栏 -->
        <div class="link d-flex justify-content-center align-items-center;">
          <div :class="btn6"><router-link :to="url1" v-text="design"></router-link></div>
          <div :class="none"><router-link :to="url" v-text="details" ></router-link></div>
        </div>
        <!-- 页面底部指引图标 -->
        <div class="down d-flex justify-content-center align-items-center" >
          <span class="iconfont" v-show="show">&#xe6cc;</span>
        </div>
      </div>  
    </div>
    <full-page :options="options" id="fullpage" ref="fullpage" class="gooddetail-info">
      <!--********** 第一屏************** -->
      <div class="section " ref="scrollOne">
        <div class="box1"></div>
      </div>
      <!--********** 第二屏************** -->
      <div class="section" ref="scrollTwo">
        <div class="box2"></div>
      </div>
      <!--********** 第三屏************** -->
      <div class="section" ref="scrollThree">
        <div class="box3"></div>
      </div>
      <!--********** 第四屏************** -->
      <div class="section">
        <div class="box4"></div>
      </div>
      <!--********** 第五屏************** -->
      <div class="section">
        <div class="box5"></div>
      </div>
      <!--********** 第六屏************** -->
      <div class="section">
        <div class="box6"></div>
      </div>
    </full-page>
    <my-foot v-show="show4" :style="{opacity}"></my-foot>
  </div>
</template>
<script>
import MyFoot from '../components/MyFoot.vue';
export default {
  components: { MyFoot },

  data() {
    return {
      title:"",
      //文本动画
      opacity:"1",
      show:"true",
      design:"",
      details:"",
      url:'',
      url1:'/design',
      drive:"预约试驾",
      options: {
        licenseKey: 'OPEN-SOURCE-GPLV3-LICENSE',
        afterLoad: this.afterLoad,
        scrollBar: true, 
        menu: '#menu',
        navigation: true,
        slidesNavigation:true,
        anchors: ['page1', 'page2', 'page3','page4','page5','page6'],
        lockAnchors: true,
        afterLoad: this.afterLoad,
      },
      btn6:{btn6:false},
      //控制了解栏在页面隐藏
      none:{none:false},
      //控制预约栏样式修改
      aChange:{aChang:false},
      change:{change:false},
      show4:false
    };
  },
  mounted() {//监听页面滚动事件
    window.addEventListener("scroll",this.handleScroll); 
  },
  methods:{
    _stop(){
      this.$refs.fullpage.api.setAllowScrolling(false)
    },
    _can(){
      this.$refs.fullpage.api.setAllowScrolling(true)
    },
    abc(){ 
      this.opacity = "0";
      setTimeout(()=>{this.opacity = "1"},800)
    },    
    afterLoad(anchors,item){
      if(item.index == 0){   //第一屏
        this.change.change = true;
        this.title="Model 3";
        this.design="定制我的 MODEL 3"
        this.details="了解 MODEL 3"
        this.url='/model3'
        this.show=true;
        this.none.none=false;
        this.drive="预约试驾";
        this.show4=false
        this.aChange.aChange=false
      }else if(item.index == 1){
        this.change.change = false;
        this.title="Model S";
        this.design="定制我的 MODEL S"
        this.details="了解 MODEL S"
        this.url='/models'
        this.drive="预约试驾"
        this.none.none=false;
        this.aChange.aChange=false
        this.show4=false
      }else if(item.index == 2){
        this.change.change = false;
        this.title="Model X";
        this.design="定制我的 MODEL X"
        this.details="了解 MODEL X"
        this.url='/modeLx'
        this.drive="预约试驾"
        this.none.none=false;
        this.aChange.aChange=false
        this.show4=false
      }else if(item.index == 3){
        this.change.change = false;
        this.title="Model Y";
        this.design="定制我的 MODEL Y"
        this.details="了解 MODEL Y"
        this.url='/modeLy'
        this.drive="预约试驾"
        this.none.none=false;
        this.aChange.aChange=false
        this.show4=false
      }else if(item.index == 4){
        this.change.change = false;
        this.title="太阳能设备和 Powerwall";
        this.drive="全方位能源供应"
        this.design="了解更多"
        this.none.none=true
        this.aChange.aChange=true
        this.show4=false
      }else if(item.index == 5){
        this.change.change = false;
        this.title="充电产品和精品配件";
        this.drive=""
        this.design="立即购买"
        this.none.none=true
        this.aChange.aChange=true
        this.show4=true
      }
      if(item.index == 5){
        this.btn6.btn6 = true;
        this.url1='/powereall';
      }else{
        this.btn6.btn6 = false;
        this.url1='/design';
      }
    },
    handleScroll(e) {
      
      //获取滚动时的高度
      let scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
      
     if (scrollTop > 0) {  
      //滚动大于0的时候要做的操作
        this.abc(),
        this.show=false
      }
    },
  },
  
  destroyed() {//销毁该事件，避免用于其他页面冲突
    document.removeEventListener('scroll', this.handleScroll)
  }
};
</script>
<style>
/* 隐藏滚动条 ，但不影响监听滚动*/
::-webkit-scrollbar {width: 0 !important;}
::-webkit-scrollbar {width: 0 !important;height: 0;}

#home .section{position:relative}
/* 各屏的统一格式 */
#home [class^=box]{
  width:100%;
  height:100%;
  background-size:cover;
  background-position:center;
  background-repeat: no-repeat;
}
/* 各个背景图 */
#home .box1{background-image:url('../assets/home/CN-D-3.jpg');}
#home .box2{background-image:url('../assets/home/Desktop-ModelS.jpg');}
#home .box3{background-image:url('../assets/home/Desktop-ModelX.jpg');}
#home .box4{background-image:url('../assets/home/Desktop-ModelY.jpg');}
#home .box5{background-image:url('../assets/home/Desktop-SolarPanels.jpg');}
#home .box6{background-image:url('../assets/home/Desktop-Accessories.jpg');}

/* 各页面底部跳转项 */
#home .link div{ 
  width:256px;height:40px;
  font-size: 14px;
  margin:8px;
  padding:5px 40px;
  outline: none;
  text-align: center;
  line-height: 30px;
  border-radius: 30px;
}
#home .link div:first-child{background:#171A20CC;}
#home .link div:first-child a{color:#fff}
#home .link div:last-child{background:#FFFFFFA6;}
#home .link div:last-child a{color:#000}

#home .down span{ 
  font-size:28px;font-weight:1000;
  animation:animate 2s ease-out infinite;
  margin-top:3px;
  cursor:default
}

#home .base-desc{
  width:100%;
  height:100%;
  position:fixed;
  z-index:10;
  transition: 0.3s
} 
#home .carTitle{
  width:100%;
  position: fixed;
  text-align: center;
  padding-top: calc(13vh + 20px);

}
#home .carTitle a{
  color:#393C41; 
  display: inline-block;
  margin-top:5px;
  padding-bottom:1px;
  border-bottom:1px solid #393C41
}
#home .carbtn{padding-top: calc(80vh + 20px);}

/* page5 隐藏了解选项栏 */
#home .none{display:none}

#home .carTitle .aChange{ 
  display:inline-block;
  font-size:17px; 
  margin-top:8px;
  pointer-events:none;
  border-bottom:0px;
}

@keyframes animate {
  0%{transform:translateY(0)}
  15%{transform:translateY(6px)}
  30%{transform:translateY(-3px)}
  45%{transform:translateY(3px)}
  60%{transform:translateY(-2px)}
  75%{transform:translateY(1px)}
  90%{transform:translateY(0px)}
}

@media(max-width:420px) {
  /* 标题 */
  #home .carTitle h1{
    font-size: 30px;
  }
  /* 按钮 */
  #home .carbtn .link{
    flex-direction: column;
  }
  #home .carbtn .link div{
    margin: 8px 50%;
    transform: translate(-50%,-50%);
  }
  /* 最后一页按钮 */
  #home .carbtn .link .btn6{
    transform: translate(-50%,-245%);
  }
}
</style>