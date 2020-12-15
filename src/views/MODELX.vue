<template>
  <div id="modelx">
    <Details class="details">
      <!-- ======================================第一页=============================== -->
      <!-- 视频 -->
      <slot slot='box1Video'>
        <video :src="box1BgVideo" muted="muted" ref="box1autoplay"></video>
      </slot>

      <!-- 车简介 -->
      <slot slot="brief1.1Div">
        <div>★★★★★</div>
      </slot>
      <slot slot="brief1.1P">
        <p>五星安全评级</p>
      </slot>

      <slot slot="brief1.2Div">
        <div><img src="../assets/Modelx/MX_room-for-7-white.png" alt="">7</div>
      </slot>
      <slot slot="brief1.2P">
        <p>宽敞七座</p>
      </slot>

      <slot slot="brief1.3Div">
        <div>605公里</div>
      </slot>
      <slot slot="brief1.3P">
        <p>续航里程</p>
        <p>国标工况法</p>
      </slot>


      <slot slot="car_Type">{{data.car_Type}}</slot>
      <slot slot="car_Type_sm">{{data.car_Type_sm}}</slot>
      <!-- ======================================第二页========================================= -->
      <slot slot="Security_Title">{{data.Security_Title}}</slot>
      <slot slot="Security_content">{{data.Security_content}}</slot>
      <!-- =======================================第三页============================================== -->
      <slot slot="Performance_Title">{{data.Practical_Title}}</slot>
      <slot slot="Performance_content">{{data.Practical_content}}</slot>

      <!-- 车简介 -->
      <slot slot="brief3.1Div">2,487升</slot>
      <slot slot="brief3.1P">相比大部分同级别SUV车型拥有更多载物空间</slot>
      
      <slot slot="brief3.2Div"><img src="../assets/Modelx/MX_room-for-7.png" alt="">7</slot>
      <slot slot="brief3.2P">兼具载物和载人能力，最多可容纳七位成人</slot>

      <slot slot="brief3.3Div"><img src="../assets/Modelx/MX_falcon-wings.png" alt="">鹰翼门</slot>
      <slot slot="brief3.3P">后排乘客出入便捷，狭窄车位也可轻松开启车门</slot>
      <!-- =======================================第四页======================================== -->
      <slot slot="box4Video"><video src="../assets/Modelx/video/2IFNG3_range-hero-mobile.mp4-2000_5PUGGL.mp4" muted="muted"  loop='loop' ref="box4autoplay"></video></slot>

      <slot slot="mileage_Title">{{data.mileage_Title}}</slot>
      <slot slot="mileage_content">{{data.mileage_content}}</slot>

      <!-- 车简介 -->
      <slot slot="brief4.1Div">605公里</slot>
      <slot slot="brief4.1P">单次充电续航里程最高可达 605 公里</slot>

      <slot slot="brief4.2Div">15分钟</slot>
      <slot slot="brief4.2P">在超级充电站充电 15 分钟，即可补充<br>最多约 232 公里的续航电量</slot>

      <slot slot="brief4.3Div">20,000+</slot>
      <slot slot="brief4.3P">超级充电站遍布全球热门线路</slot>
      <!-- ========================================第五页================================= -->
      <slot slot="Autopilot_Title">{{data.Autopilot_Title}}</slot>
      <slot slot="Autopilot_content">{{data.Autopilot_content}}</slot>

      <!-- 车简介 -->
      <slot slot="brief6.1Div">17英寸</slot>
      <slot slot="brief6.1P">触摸显示屏，操控一目了然</slot>

      <slot slot="brief6.2Div"></slot>
      <slot slot="brief6.2P">OTA 空中软件更新，不断引入新功能并提升性能</slot>

      <slot slot="brief6.3Div"><img src="../assets/Modelx/MX_roof.png" alt=""></slot>
      <slot slot="brief6.3P">超大尺寸全景式挡风玻璃，有效隔绝紫外线</slot>
      <!-- ========================================第六页====================================== -->
      <slot slot="Interior_Title">{{data.Interior_Title}}</slot>
      <slot slot="Interior_content">{{data.Interior_content}}</slot>
      <!-- ========================================第七页 =======================================-->
      <slot slot="Appearance_Title">{{data.Appearance_Title}}</slot>
      <slot slot="Appearance_content">{{data.Appearance_content}}</slot>

      <!-- 车简介 -->
      <slot slot="brief7.1Div"></slot>
      <slot slot="brief7.1P">定制你的 Model X，多种车漆颜色供选择</slot>

      <slot slot="brief7.2Div"></slot>
      <slot slot="brief7.2P">作为一款 SUV，Model X 的空气动力学表现十分<br>出色，风阻系数极低</slot>

      <slot slot="brief7.3Div"><img src="../assets/Modelx/MX_falcon-wings.png" alt="" class="img7"><span>鹰翼门</span></slot>
      <slot slot="brief7.3P">第二、三排座椅出入更便捷</slot>
      <!-- ---------------------------------第八页------------------------------------- -->
      <slot slot="modelName">{{data.car_Type}}</slot>
      <!-- ---------------------------------第九页------------------------------------- -->
      
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
      box1BgVideo:require('../assets/Modelx/video/index.mp4'),
      id:3,
      data:'',
      //设置百里加速
      num1:'--tcl-integral-as-percent: -20%;',
      num2:'--tcl-integral-as-percent: -90%;',

      // 背景图片
      box1Bgimg:require("../assets/Modelx/hero-poster_1.png"),
      box2Bgimg:require("../assets/Modelx/safety-model-x-hero.png"),
      box3Bgimg:require("../assets/Modelx/hero@2_2.jpg"),
      box6Bgimg:require("../assets/Modelx/hero@2_3.jpg"),
      box7BigBgimg:require("../assets/Modelx/hero-high-viewport@2.jpg"),

      box8img:require('../assets/Modelx/MX-specs-desktop.jpg'),
      box9img:require('../assets/Modelx/modelx@2.jpg'),
    }
  },
  methods:{
    // 第一屏视频
    box1Video(bool){
      if(bool){   
          // 自动播放
          this.$refs.box1autoplay.play();
      }else{
          // 回到初始
          this.$refs.box1autoplay.currentTime=0
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
    
  },
  beforeMount(){ 
    if(window.innerWidth<420){
      this.box1BgVideo =  require('../assets/Modelx/video/RZIGNP_hero-mobile_1.mp4-2000_2RPOQI.mp4')
      this.box2Bgimg = require("../assets/Modelx/model-x-hero-mobile.jpg");
      this.box7BigBgimg = require('../assets/Modelx/hero-mobile@2_5.jpg')
    }
  },
  mounted(){
    //  axios请求
		this.axios.get('/t_details?id='+'3').then((results)=>{
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
#modelx .details .modelsParameter ul li div,
#modelx .details .modelsParameter ul li p{
  color:#fff;
}
#modelx .details .modelsParameter ul .shu,
#modelx .details .box7 .box7Img ul .shu{
  background-color: #fff;
}
#modelx .details .modelsParameter ul li:last-child button{
  color:#fff;
  border-color:#fff;
}
#modelx .details .modelsParameter ul li:last-child button:hover{
  color:#000;
  border-color:#fff;
  background-color: #fff;
}

#modelx .details ul img{
  /* width: 50px; */
  height: 32px;
}
/* 第三屏 */
#modelx .details .bgImg3 ul li{
  color: #000;
}
#modelx .details .bgImg3 ul .shu{
  background-color: #000;
}


#modelx .details .box7 .box7Img ul .shu{
  background-color: #000;
}

/* @media(max-width:1200px){
  #model3 .details .box2 .rightBox .bgImg div:nth-child(3){
    top:693px;
    left:446px;
  }
}
@media(max-width:900px){
  #model3 .details .box2 .rightBox .bgImg div:nth-child(3){
    top:693px;
    left:516px;
  }
} */
@media(max-width:420px){
  #modelx .details .box7 ul img{
    height: 40px;
  }
} 
</style>