<template>
  <div id="model3">
    <Details class="details">
      <!-- ---------------------------------第一页----------------------------- -->
      <!-- 车型号 -->
      <slot slot="car_Type">{{data.car_Type}}</slot>
      

      <!-- 车简介 -->
      <slot slot="brief1.1Div"></slot>
      <slot slot="brief1.1P">
        <p>高性能版</p>
        <p>百公里加速</p>
      </slot>

      <slot slot="brief1.2Div">
        <div>668公里</div>
      </slot>
      <slot slot="brief1.2P">
        <p>长续航后轮驱动版</p>
        <p>续航里程</p>
      </slot>

      <slot slot="brief1.3Div">
        <div>全轮驱动</div>
      </slot>
      <slot slot="brief1.3P">
        <p>高性能版</p>
        <p>双电机</p>
      </slot>
      <!-- ---------------------------------第二页-------------------------------- -->
      <slot slot="Security_Title">{{data.Security_Title}}</slot>
      <slot slot="Security_content">{{data.Security_content}}</slot>
      <!-- ---------------------------------第三页-------------------------------- -->
      <!-- 背景视频 -->
      <slot slot='box3Video'>
        <video src="../assets/Model3/video/DBX5KW_hero.mp4-2000_G4N0AM.mp4" muted="muted"  loop='loop' ref="box3autoplay"></video>
      </slot>

      <slot slot="Performance_Title">{{data.Performance_Title}}</slot>
      <slot slot="Performance_content">{{data.Performance_content}}</slot>
      <!-- 车简介 -->
      <slot slot="brief3.1Div"></slot>
      <slot slot="brief3.1P">双电机全轮驱动实现对牵引力和扭矩的全天候精准控制</slot>

      <slot slot="brief3.2P">加速性能：0-100 公里/小时 加速仅需 3.4 秒</slot>

      <slot slot="brief3.3Div">261公里/小时</slot>
      <slot slot="brief3.3P">操控性和空气动力学表现极佳，时速可达 261 公里/小时</slot>
      <!-- ---------------------------------第四页---------------------------------- -->
      <slot slot="box4Video"><video class="" src="../assets/Model3/video/9H6YXX_hero_0.mp4-2000_8CKSBI.mp4" muted="muted"  loop='loop' ref="box4autoplay"></video></slot>

      <slot slot="mileage_Title">{{data.mileage_Title}}</slot>
      <slot slot="mileage_content">{{data.mileage_content}}</slot>

      <!-- 车简介 -->
      <slot slot="brief4.1Div">668公里</slot>
      <slot slot="brief4.1P">单次充电续航里程最高可达 668 公里</slot>

      <slot slot="brief4.2Div">15分钟</slot>
      <slot slot="brief4.2P">在超级充电站充电 15 分钟，即可补<br>充最多约 279 公里的续航电量</slot>

      <slot slot="brief4.3Div">20,000+</slot>
      <slot slot="brief4.3P">超级充电站遍布全球热门线路</slot>
      <!-- ---------------------------------第五页--------------------------------- -->
      <slot slot="Autopilot_Title">{{data.Autopilot_Title}}</slot>
      <slot slot="Autopilot_content">{{data.Autopilot_content}}</slot>
      <!-- ---------------------------------第六页------------------------------------ -->
      <!-- 第六屏视频 -->
      <slot slot="box6Video"><video src="../assets/Model3/video/4WWTZE_interior.mp4-2000_RVDFPJ.mp4" muted="muted"  loop='loop' ref="box6autoplay"></video></slot>

      <slot slot="Interior_Title">{{data.Interior_Title}}</slot>
      <slot slot="Interior_content">{{data.Interior_content}}</slot>

      <!-- 车简介 -->
      <slot slot="brief6.1Div">15英寸</slot>
      <slot slot="brief6.1P">触摸显示屏，操控一目了然</slot>

      <slot slot="brief6.2Div"></slot>
      <slot slot="brief6.2P">OTA 空中软件更新，不断引入新功能并提升性能</slot>

      <slot slot="brief6.3Div"><img src="../assets/Model3/model-3-interior-hero-roof-badge.png" alt=""></slot>
      <slot slot="brief6.3P">全景玻璃车顶，头部空间更充裕，并能有效阻隔紫外线</slot>
      <!-- ---------------------------------第七页------------------------------------- -->
      <slot slot="Appearance_Title">{{data.Driver_Title}}</slot>
      <slot slot="Appearance_content">{{data.Driver_content}}</slot>

      <!-- 车简介 -->
      <slot slot="brief7.1Div"><div class="box7">双电机</div></slot>
      <slot slot="brief7.1P">2个独立式电机，精准控制前后轮扭矩</slot>
      <slot slot="brief7.12P">独立式电机</slot>

      <slot slot="brief7.2Div">10毫秒</slot>
      <slot slot="brief7.2P">两个电机的扭矩切换响应时间仅需 10 毫秒</slot>
      <slot slot="brief7.22P">扭矩响应</slot>

      <slot slot="brief7.3Div"><img src="../assets/Model3/weather.png" alt="" class="img7"></slot>
      <slot slot="brief7.3P">全天候牵引力控制</slot>
      <slot slot="brief7.32P">全天候牵控制</slot>
      <!-- ---------------------------------第八页------------------------------------- -->
      <slot slot="modelName">{{data.car_Type}}</slot>
      <!-- ---------------------------------第九页------------------------------------- -->
      <slot slot="box9Btn">
          <router-link to="/design"><button>定制我的 {{data.car_Type}}</button></router-link>
          <router-link to="/drive"><button>预约驾驶</button></router-link>
      </slot>
    </Details>
  </div>
</template>


<script>
export default {
  components: {
      Details: resolve => {require(['@/components/Details.vue'], resolve)},//懒加载
  },
  data(){
    return{
      id:2,
      data:'',
      //设置百里加速
      num1:'--tcl-integral-as-percent: -30%;',
      num2:'--tcl-integral-as-percent: -70%;',
      // 背景图片
      box1Bgimg:require("../assets/Model3/CN_model-3-hero-desktop.jpg"),
      box2Bgimg:require("../assets/Model3/model-3-hero.png"),
      box7Bgimg:require("../assets/Model3/all-wheel-drive@2.jpg"),
      box8img:require('../assets/Model3/top@2.png'),
      box9img:require('../assets/Model3/order.jpg'),
    }
  },
  methods:{
    // 第三屏视频
    box3Video(bool){
      if(bool){   
          // 自动播放
          this.$refs.box3autoplay.play();
      }else{
          // 回到初始
          this.$refs.box3autoplay.currentTime=0
      }
    },

    // 第四屏视频
    box4Video(bool){
      if(bool){   
          // 自动播放
          this.$refs.box4autoplay.play();
      }else{
          // 回到初始
          this.$refs.box4autoplay.currentTime=0
      }
    },

    // 第六屏视频
    box6Video(bool){
      if(bool){   
          // 自动播放
          this.$refs.box6autoplay.play();
      }else{
          // 回到初始
          this.$refs.box6autoplay.currentTime=0
      }
    },
  },
  beforeMount(){ 
    if(window.innerWidth<420){
      this.box1Bgimg = require('../assets/Model3/CN_model-3-hero-mobile.jpg')
      this.box2Bgimg = require("../assets/Model3/model-3-hero-mobile.jpg");
    }
  },
  mounted(){
    //  axios请求
		this.axios.get('/t_details?id='+'2').then((results)=>{
			if(results.data.code == 1){
        this.data = results.data.results[0];
        // console.log(this.data)
				// this.$router.push("/login")
			}else if(results.data.code == 0){
			}
    })
  }
}
</script>


<style>
/* 第一屏 */
#model3 .details .modelsParameter ul li div,
#model3 .details .modelsParameter ul li i,
#model3 .details .modelsParameter ul li p{
  color:#fff;
}
#model3 .details .modelsParameter ul .shu,
#model3 .details .box7 .box7Img ul .shu{
  background-color: #fff;
}
#model3 .details .modelsParameter ul li:last-child button{
  color:#fff;
  border-color:#fff;
}
#model3 .details .modelsParameter ul li:last-child button:hover{
  color:#000;
  border-color:#fff;
  background-color: #fff;
}

/* 第三屏 */
#model3 .details video{
    width: 100%;
    height: 100%;
    object-fit: fill;
    position: absolute;
}
/* 第五屏 */
#model3 .details .box5 .box5Bottom{
  top:0 ;
}
/* 第六屏 */
#model3 .details  ul li img{
    width: 80px;
}



/* 第七屏 */
#model3 .details .box7 ul li div, 
#model3 .details .box7 ul li div i{
  font-size: 25px;
  color:#fff;
}
#model3 .details .box7 ul li p{
  color:#fff;
}
#model3 .details ul li div .img7{
  width: 38px;
}
#model3 .details  .box7 .box7Img ul{
  top:auto;
  bottom:60px;
}

/* 第九屏 */
#model3 .details  .box9{
  background-color: #000;
}

#model3 .details  .box9 .box9Left h4{
  color:#fff;
}
#model3 .details  .box9 .box9Left button{
  color:#fff;
  background-color: #000;
  border-color:#fff;
  margin-right:10px;
}
#model3 .details  .box9 .box9Left button:hover{
  color:#000;
  background-color: #fff;
}
#model3 .details #foot div a{
  color:#fff;
}
/* #model3 .details .box2 .rightBox .bgImg{
    background-size: 86%;
    background-position-x: left;
} */

/* @media(max-width:1200px){
  #model3 .details .box2 .rightBox .bgImg{
    background-size: 86%;
    background-position-x: left;
    background-position-y: top;
  }
} */
@media(max-width:420px){
  #model3 .details .box2 button{
    margin-top: 0;
  }
  #model3 .details .box2 p{
    font-size: 13px;
  }
  #model3 .details .box5 video{
    position: relative;
  }
  #model3 .details .box7 .box7Img >div:last-child{
    padding-top:0px;
  }
}
</style>