<template>
  <div id="modely">
    <Details class="details">
      <!-- ==================================第一页================================== -->
      <slot slot="car_Type">{{data.car_Type}}</slot>

      <!-- 车简介 -->
      <slot slot="brief1.1Div">
        <div>1.9立方米</div>
      </slot>
      <slot slot="brief1.1P">
        <p>储物空间</p>
      </slot>

      <slot slot="brief1.2Div">
        <div>505公里</div>
      </slot>
      <slot slot="brief1.2P">
        <p>续航里程（WLTP<br> 测算标准）</p>
      </slot>

      <slot slot="brief1.3Div">
        <div>全轮驱动</div>
      </slot>
      <slot slot="brief1.3P">
        <p>双电机</p>
      </slot>
      <!-- ============================================第二页============================================ -->
      <slot slot="Security_Title">{{data.Security_Title}}</slot>
      <slot slot="Security_content">{{data.Security_content}}</slot>
      <!-- ============================================第三页============================================ -->
      <slot slot="Performance_Title">{{data.Practical_Title}}</slot>
      <slot slot="Performance_content">{{data.Practical_content}}</slot>

      <!-- 背景视频 -->
      <slot slot='box3Video'>
        <video src="../assets/Modely/video/M93JEP_utility_desktop.mp4-2000_HJDOVQ.mp4" muted="muted"  loop='loop' ref="box3autoplay"></video>
      </slot>

      <!-- 车简介 -->
      <slot slot="brief3.1Div"><img src="../assets/Modely/MX_room-for-7-white.png" alt="">7</slot>
      <slot slot="brief3.1P">选配第三排座椅后，最多可容纳<br> 7 名成年人乘坐。</slot>
      <slot slot="brief3.12P">可容纳 7 人。</slot>
      
      <slot slot="brief3.2Div"><img src="../assets/Modely/MY_versatile-seating.png" alt=""></slot>
      <slot slot="brief3.2P">客货两用，多功能乘坐、载货</slot>
      <slot slot="brief3.22P">多功能乘坐、载货</slot>

      <slot slot="brief3.3Div"><img src="../assets/Modely/MY_trunk.png" alt=""></slot>
      <slot slot="brief3.3P">行李箱装卸货方便</slot>
      <slot slot="brief3.32P">行李箱装方便使用</slot>
      <!-- ============================================第四页============================================ -->
      <slot slot="mileage_Title">{{data.mileage_Title}}</slot>
      <slot slot="mileage_content">{{data.mileage_content}}</slot>

      <slot slot="box4Video"><video class="" src="../assets/Modely/video/WVNSU3_Range_Desktop.mp4-2000_WJLESL.mp4" muted="muted"  loop='loop' ref="box4autoplay"></video></slot>
      <!-- 车简介 -->
      <slot slot="brief4.1Div">505公里</slot>
      <slot slot="brief4.1P">单次充电续航里程最高可达 505 公里</slot>

      <slot slot="brief4.2Div">15分钟</slot>
      <slot slot="brief4.2P">在超级充电站充电 15 分钟，即可补充<br> 270 公里里程的电量</slot>

      <slot slot="brief4.3Div">20,000+</slot>
      <slot slot="brief4.3P">超级充电站遍布全球热门线路</slot>
      <!-- ============================================第五页============================================ -->
      <slot slot="Autopilot_Title">{{data.Autopilot_Title}}</slot>
      <slot slot="Autopilot_content">{{data.Autopilot_content}}</slot>
      <!-- ============================================第六页============================================ -->
      <slot slot="Interior_Title">{{data.Interior_Title}}</slot>
      <slot slot="Interior_content">{{data.Interior_content}}</slot>

      <!-- 车简介 -->
      <slot slot="brief6.1Div">15英寸</slot>
      <slot slot="brief6.1P">触摸显示屏，操控一目了然</slot>

      <slot slot="brief6.2Div"></slot>
      <slot slot="brief6.2P">OTA 空中软件更新，不断引入新功能并提升性能</slot>

      <slot slot="brief6.3Div"><img src="../assets/Model3/model-3-interior-hero-roof-badge.png" alt=""></slot>
      <slot slot="brief6.3P">全景玻璃车顶，头部空间更充裕，并能有效阻隔紫外线</slot>
      <!-- ============================================第七页============================================ -->
      <slot slot="Appearance_Title">{{data.Driver_Title}}</slot>
      <slot slot="Appearance_content">{{data.Driver_content}}</slot>

      <!-- 车简介 -->
      <slot slot="brief7.1Div"><div class="box7Div1">2</div></slot>
      <slot slot="brief7.1P">2个独立式电机，精准控制前后轮扭矩</slot>
      <slot slot="brief7.12P">独立式电机</slot>

      <slot slot="brief7.2Div">
        <div class="miao">
            <div><i class="iconfont">&#xe603;</i></div>
            <div class="num1" :style='num11'>
                0<br>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9
            </div>
            <div>.</div>
            <div class="num2" :style='num22'>
                0<br>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9<br>0<br>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9
            </div>
            <div>秒</div>
        </div>
      </slot>
      <slot slot="brief7.2P">杰出的加速表现 — 百公里加速最快仅需<br> 3.7 秒</slot>

      <slot slot="brief7.3Div"><img src="../assets/Model3/weather.png" alt="" class="img7"></slot>
      <slot slot="brief7.3P">能够在雨天、雪天、泥泞和越野环境中实<br>现卓越的牵引力控制</slot>
      <slot slot="brief7.32P">全天候控制</slot>

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
      id:4,
      data:'',
      //设置百里加速
      num11:'',
      num22:'',
      // 背景图片
      box1Bgimg:require("../assets/Modely/model-y_R1@2.jpg"),
      box2Bgimg:require("../assets/Modely/safety-model-y-hero.png"),
      box6Bgimg:require("../assets/Modely/interior_hero@2.jpg"),
      box7Bgimg:require("../assets/Modely/AWD_hero@2.jpg"),

      box8img:require('../assets/Modely/ModelYSilhouette.png'),
      box9img:require('../assets/Modely/ModelY_Order_Hero.jpg'),
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
  },
  mounted(){
    //  axios请求
		this.axios.get('/t_details?id='+'4').then((results)=>{
			if(results.data.code == 1){
        this.data = results.data.results[0];
        // console.log(this.data)
				// this.$router.push("/login")
			}else if(results.data.code == 0){
			}
		})
  },
  beforeMount(){ 
    if(window.innerWidth<420){
      this.box1Bgimg = require('../assets/Modely/model-y-mobile_R1@2.jpg')
      this.box2Bgimg = require('../assets/Modely/model-y-hero-safety-mobile.png')
    }
  },
}
</script>


<style>
/* 第一屏 */
#modely .details .modelsParameter ul li div,
#modely .details .modelsParameter ul li p,
#modely .details .box7 .box7Img ul li div,
#modely .details .box7 .box7Img ul li p{
  color:#fff;
}
#modely .details .modelsParameter ul li div{
  font-size: 22px;
}
#modely .details .modelsParameter ul .shu,
#modely.details .box7 .box7Img ul .shu,
#modely .details .box7 .box7Img ul .shu{
  background-color: #fff;
}
#modely .details .modelsParameter ul li:last-child button{
  color:#fff;
  border-color:#fff;
}
#modely .details .modelsParameter ul li:last-child button:hover{
  color:#000;
  border-color:#fff;
  background-color: #fff;
}

/* 第三屏 */
#modely .details video{
    width: 100%;
    height: 100%;
    object-fit: fill;
    position: absolute;
}
#modely .details ul img{
  /* width: 50px; */
  height: 32px;
}

/* 第五屏 */
#modely .details .box5 .box5Bottom{
  top:0 ;
}
/* 第七屏 */
#modely .details .box7 .box7Img ul{
  top:auto;
}
#modely .details .box7 .box7Img ul .box7Div1{
  font-size: 25px;
}
#modely .details .box7 .box7Img ul img{
  height: 40px;
}



#modely .details ul li:nth-child(3) .miao{
    height: 37px;
    overflow: hidden;
}
#modely .details ul li:nth-child(3) .miao div{
    float: left;
}
/* 设置字体大小 */
#modely .details .ul .num1{
    /* --tcl-integral-as-percent: -20%; */
    transition: 1.5s ease-in-out;
}
#modely .details .ul .num2{
    /* --tcl-integral-as-percent: -75%; */
    transition: 1.7s ease-in-out;
}
/* 进入第三页动画 */
#modely .details .num1,
#modely .details .num2{
    transform: translateY(var(--tcl-integral-as-percent)) translateZ(0);
}


/* 第九屏 */
#modely .details  .box9{
  background-color: #000;
}

#modely .details  .box9 .box9Left h4{
  color:#fff;
}
#modely .details  .box9 .box9Left button{
  color:#fff;
  background-color: #000;
  border-color:#fff;
  margin-right:10px;
}
#modely .details  .box9 .box9Left button:hover{
  color:#000;
  background-color: #fff;
}
#modely .details #foot div a{
  color:#fff;
}

@media(max-width:420px){
  /* #modely .details .box2 button{
    margin-top: 0;
  }
  #modely .details .box2 p{
    font-size: 13px;
  } */
  #modely .details .box5 video{
    position: relative;
  }
  #modely .details .box7 .box7Img >div:last-child{
    padding-top:0px;
  }
  #modely .details .box7 .box7Img ul img{
    height: 37px;
  }
}
</style>
