<template>
    <div>
        <div class="daohanglan">
            <router-link to="/"><img class="daohanglanimg" src="../assets/powereall/tesla01.png" alt=""></router-link>
            <span class="daohanglanzi01">|</span>
            <span class="daohanglanzi01">商店</span>
            <router-link class="daohanglanzi01 daohanglancenterzi" to="#">店铺活动</router-link>
            <router-link class="daohanglanzi01 daohanglancenterzi" to="#">充电产品</router-link>
            <router-link class="daohanglanzi01 daohanglancenterzi" to="#">优选配件</router-link>
            <router-link class="daohanglanzi01 daohanglancenterzi" to="#">精选服饰</router-link>
            <span class="daohanglanzi01" >登录</span>
            <i class="iconfont">&#xe628;</i>
            <i class="iconfont">&#xe602;</i>
        </div>
          <!--身体-->
        <div>
            <h1 class="bigheadzi0">点击购买 家庭充电服务包</h1>
            <h3 class="bigheadzi1">随时在家为特斯拉充电</h3>
            <img class="bighead" src="../assets/powereall/wall-connector.jpg" alt="">
        </div>
        <div>
              <div class="mk">
                 <span class="bodyheadsize1">畅 销 商品</span>
                 <span class="bodyheadsize2" to="">查看全部</span>
              </div>
              <div class="body00">
                  <div class="bodyimg0" >
                      <img class="imgzuo" src="../assets/powereall/20201114162659.png" alt="">
                  </div>
                  <div class="bodyimg1">
                      <img class="imglb" src="../assets/powereall/7528845-00-A--mens-t-embroidery-tee-grey.jpg" alt="">
                      <div class="imgzi">
                             <span class="imgzi_zi">男装 T标 短袖T恤</span>
                      </div>
                  </div>
                  <div class="bodyimg1">
                      <img class="imglb" src="../assets/powereall/1133634-00-A.jpg" alt="">
                      <div class="imgzi">
                          <span class="imgzi_zi">
                              MODELS 1:18 汽车模型
                          </span>
                      </div>
                  </div>
                  <div class="bodyimg1">              
                      <img class="imglb" src="../assets/powereall/1103026-00-A.jpg" alt="">
                      <div class="imgzi">
                          <span class="imgzi_zi">
                              MODELS X 全天后地垫
                          </span>
                      </div>
                  </div>
                  <div class="bodyimg2" >
                      <img class="imgyou" src="../assets/powereall/20201114162716.png" alt="">
                  </div>
             </div>
             <div class="imgfu">
                 <div class="imgkk">
                  <img class="imgkk2" src="../assets/powereall/img3.png" alt="">
                 </div>
                 <div class="imgkk">
                  <img class="imgkk2" src="../assets/powereall/img1.png" alt="">
                 </div>
             </div>
             <div class="imgkk3">
                 <img class="imgkk4" src="../assets/powereall/img2.png" alt="">
             </div>
             <div class="mmmkk6">
                 <div class="mmmkk7">
                  <img src="../assets/powereall/charging-gen3@2x.jpg" alt="" class="mmmkk9">
                 </div>
                 <div class="mmmkk7"> 
                  <div class="mmmkk8">
                    <img src="../assets/powereall/mens@2x.jpg" alt="" class="mmmkk10">
                  </div>
                  <div class="mmmkk8 mmmkk11">
                    <img src="../assets/powereall/womens@2x.jpg" alt="" class="mmmkk10 " >
                  </div>
                 </div>
             </div>
        </div>
    </div>
</template>



<style scoped>
    .daohanglan{
        float: left;
        height: 47px;
        width: 100%;
    }
    .daohanglanimg{
        width: 5%;
        height: 25%;
        margin: 15px;
    }
    .daohanglanzi01{
        font-size: 12px;
        margin-left: 12px;
    }
     .bighead{
         width: 100%;
     }
     .bigheadzi0{
         position: absolute;
         top: 24%;
         left: 44%;
         color: rgb(245, 245, 245);
         font-weight: 700;
         font-size: 18px;
        letter-spacing: 1px;
     }
     .bigheadzi1{
         position: absolute;
         top: 28%;
         left: 43%;
         color: rgb(245, 245, 245);
         font-size: 26px;
     }
    .bodyheadsize1{
         float: left;
    }
    .bodyheadsize1, .bodyheadsize2{
         padding:25px;
         font-size: 13px;
         font-weight: 900;
    }
     .bodyheadsize2{
         float: right;
     }
     .bodyheadsize3{
         clear: both;
     }
     .body00{
       width: 100%; 
       display: flex;
     }
     .bodyimg0,.bodyimg1{
        float: left;
         border: 1px solid black;
     }
     .bodyimg2,.bodyimg0{
         width: 7%;
         
     }
     .bodyimg2{
         float: right;
     }
     .bodyimg1{
        flex: 1;
        
         border: 1px solid black;
         height:500px ;
         margin:0px 1%;
     }
     .imglb{
         width: 100%;
         height:80%;
     }
     .imgzuo,.imgyou{
         width: 100%;
         height: 500px;
     }
     .mk{
         height: 100px;
         width: 100%;
         
     }
     .imgzi{
         width: 100%;
         height: 20%;
         margin-top: 20px;
     }
     .imgzi_zi{
         text-align: center;
         width: 100%;
         display: inline-block;
     }
     .imgfu{
         height: 450px;
         width: 100%;
         display: flex;
     }
     .imgkk{
         margin: 2%;
         flex: 1;
     }
     .imgkk2{
         width: 100%;
         height: 100%;
     }
     .imagekk3{
        margin:20px ;
        width: 100%;
        height: 450px;
     }
     .imgkk4{
         width: 96%;
         height: 100%;
         margin-left: 2%;
     }
     .mmmkk6{
         height:920px;
         width: 100%;
         display: flex;
         margin-top: 20px;
     }
    
     
     .mmmkk7{
         height: 100%;
         flex :1;
         margin:0px 2%;
     }
     .mmmkk9{
         height: 100%;
         width: 100%;
     }
     .mmmkk8{
         width: 100%;
         height: 49%;
     }
     .mmmkk10{
         width: 100%;
         height: 100%;
     }
     .mmmkk11{
         margin-top: 2%;
     }
     .mmmkk12{
         width: 100%;
         height: 100px;

     }
     .mmmkk13{
         width:52%;
         margin: 0 auto;
         margin-top: 55px;
        
     }
    #navbarNav{
        width: 500px !important;
        margin: 0 auto ;
    }
</style>