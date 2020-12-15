<template>
  <div>
    <Details>
      <!-- ---------------------第一页--------------------------- -->
      <!-- 车型号 -->
      <slot slot="car_Type">{{data.car_Type}}</slot>
      <slot slot="car_Type_sm">{{data.car_Type_sm}}</slot>
      <!-- ---------------------第二页----------------------------- -->
      <slot slot="Security_Title">{{data.Security_Title}}</slot>
      <slot slot="Security_content">{{data.Security_content}}</slot>
      <!-- ---------------------第三页----------------------------- -->
      <slot slot="Performance_Title">{{data.Performance_Title}}</slot>
      <slot slot="Performance_content">{{data.Performance_content}}</slot>
      <!-- ---------------------第四页------------------------------ -->
      <slot slot="box4Video"><video src="../assets/MODELS/video/119ZLJ_range.mp4-2000_TSMBHB.mp4" muted="muted"  loop='loop' ref="box4autoplay"></video></slot>
      <slot slot="mileage_Title">{{data.mileage_Title}}</slot>
      <slot slot="mileage_content">{{data.mileage_content}}</slot>
      <!-- ---------------------第五页----------------------------- -->
      <slot slot="Autopilot_Title">{{data.Autopilot_Title}}</slot>
      <slot slot="Autopilot_content">{{data.Autopilot_content}}</slot>
      <!-- ---------------------第六页----------------------------- -->
      <slot slot="Interior_Title">{{data.Interior_Title}}</slot>
      <slot slot="Interior_content">{{data.Interior_content}}</slot>
      <!-- ---------------------第七页------------------------------- -->
      <slot slot="Appearance_Title">{{data.Appearance_Title}}</slot>
      <slot slot="Appearance_content">{{data.Appearance_content}}</slot>
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
      id:1,
      data:'',
      //设置百里加速
      num1:'--tcl-integral-as-percent: -20%;',
      num2:'--tcl-integral-as-percent: -75%;',

      
      box1Bgimg:require("../assets/MODELS/model-s@2x.jpg"),
      box2Bgimg:require("../assets/MODELS/safety-model-s-hero.png"),
      box3Bgimg:require("../assets/MODELS/model-s-performance.jpg"),
      box6Bgimg:require("../assets/MODELS/hero@2_1.jpg"),
      box7BigBgimg:require("../assets/MODELS/hero-high-viewport.jpg"),
      box8img:require('../assets/MODELS/MS-specs-desktop.jpg'),
      box9img:require('../assets/MODELS/models@2.jpg'),
    }
  },
  beforeMount(){ 
    if(window.innerWidth<420){
      this.box7BigBgimg = require('../assets/MODELS/hero-mobile@2_2.jpg')
      this.box1Bgimg = require("../assets/MODELS/model-s-mobile@2x.jpg")
      this.box2Bgimg = require("../assets/MODELS/model-s-hero-v2-mobile.jpg")
      this.box3Bgimg = require("../assets/MODELS/model-s-performance-mobile.jpg")
    }
  },
  methods:{  
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
		this.axios.get('/t_details?id='+'1').then((results)=>{
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