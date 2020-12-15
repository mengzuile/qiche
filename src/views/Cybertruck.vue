<template>
    <div id="cybertruck">
        <my-header v-show="y<760?true:false"></my-header>
        <NavTotop v-show="y>760?true:false">
                <slot slot="img" class=""><img src="../assets/logo1.gif" alt=""></slot>
            <slot slot="btn">
                <div class="dgou_hander">
                    <p class="box_hander">
                    <span class="lamp_hander">立即订购</span>
                    </p>
                </div>
              </slot>
        </NavTotop>
        <!-- ********** 页面一 *********** -->
        <div class="cybertruck_one">
            <div class="gui">
                    <img src="../assets/gui.png" alt="">
            </div>
            <div class="propaganda">
              <span class="txt">比卡车更实用&nbsp;&nbsp;比跑车更性能</span>
                <p class="box">
                    <span class="lamp">立即订购</span>
                </p>
            </div>
        </div>
        <!-- ************* 第二页 ********* -->
        <div class="cybertruck_two">
            <div class='decline' :class='y>133?rise:""'>
                <img src="../assets/02_Desktop.jpg" alt="">
            </div>
            <div class="introduce_1 decline" :class='y>833?rise:""'>
                <h4>超强外骨骼结构</h4>
                <p>Cybertruck 的车身外壳具有极高的耐用性和乘客保护能力。从几乎不可穿透的外骨骼结构开始，该车型的每个组件都拥有超高的强度和耐用性，从超硬30倍冷轧不锈钢结构车身表面，到特斯拉装甲玻璃，该车型的每个组件都拥有卓越的强度和耐用性。</p>
           </div>
        </div>

        <!-- ************** 第三页 ************** -->
        <div class="cybertruck_three">
            <div class="decline" :class='y>1001?rise:""'>
                <img src="../assets/03_Desktop.jpg" alt="">
            </div>
            <div class="introduce_2 decline" :class='y>1663?rise:""'>
                <p class="left">超硬30倍冷轧不锈钢</p>
                <p class="right">这是我们用过的最好车身材料。光滑的单色车身骨架外敷超硬外壳，有助于凹痕、损坏和长期腐蚀的消除，且能为驾乘者提供最大的安全保护。</p>
            </div>
        </div>
        <!-- *************** 第四页 ****************** -->
        <div class="cybertruck_four">
            <div class="decline" :class='y>2000?rise:""'>
                <img src="../assets/04_Desktop.jpg" alt="">
            </div>
            <div class="introduce_3 decline" :class='y>2400?rise:""'>
                <p class="left">特斯拉装甲玻璃</p>
                <p class="right">超强玻璃和聚合物层状复合材料可以吸收并对冲击力重新定向，从而提高性能和耐受力。</p>
            </div>
        </div>
         <!-- *************** 第五页 ****************** -->
         <div class="cybertruck_five">
            <div class="lunb">
             <el-carousel :interval="4000" type="card" height="360px" >
                <el-carousel-item v-for="item in Rotation" :key="item.id">
                    <img :src="item.idView"  class="image" alt="">
                </el-carousel-item>
             </el-carousel>
            </div>
        </div>
        <!-- ***************第六页*************** -->
        <div class="cybertruck_six">
            <video muted='true' autoplay='true' loop="true">
                <source src="../assets/performance_video_desktop.mp4" > 
            </video>
            <div class=" xiaolv decline"  :class='y>4200?rise:""'      >
                <h3>性能与效率</h3>
                <span>现在我们正进入一种全新的强度、速度和多功能级别，这只有纯电设计才有可能实现。强大的动力传动系统和低重心提供了非凡的牵引力控制和扭矩，0至60英里/小时加速只需短短2.9秒以及续航里程高达500英里.</span>
            </div>
        </div>
        <!--********************* 第七页 ***********************  -->
        <div class="cybertruck_seven">
            <div class="Specifications_right">
                <img src="../assets/12_Desktop.png" alt="">
            </div>
            <div class="Specifications_left">
                <h3>规格*</h3>
                <span>
                    <input type="radio" name="1" class="checkbox_style" checked="checked">单电机后轮驱动
                    <label for="checkbox_meihua"></label>
                </span>
                <span>
                    <input type="radio" name="1" class="checkbox_style" >双电机全轮驱动
                    <label for="checkbox_meihua"></label>                                        
                </span>
                <span>
                    <input type="radio" name="1" class="checkbox_style" >三电机全轮驱动                                        
                    <label for="checkbox_meihua"></label>                    
                </span>
                <ul>
                    <li>
                        <div>
                            <span>0-60 英里/小时</span>
                            <span class='right_x'>&lt;6.5秒</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>里程</span>
                            <span class='right_x'>250+ 英里（EPA 预估）</span>
                        </div>
                    </li>      
                    <li>
                        <div>
                            <span>动力系统</span>
                            <span class='right_x'>后轮驱动</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>储存容量</span>
                            <span class='right_x'>100 立方英尺</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>货箱长度</span>
                            <span class='right_x'>6.5英尺</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>牵引力</span>
                            <span class='right_x'>7,500+ 磅</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>AUTOPILOT 自动辅助驾驶</span>
                            <span class='right_x'>标配</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>自适应空气悬架</span>
                            <span class='right_x'>标配</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>离地间隙</span>
                            <span class='right_x'>高达16英寸</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>接近角度</span>
                            <span class='right_x'>35度</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>离去角度</span>
                            <span class='right_x'>28度</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>*所有配置仅限美国规格。全球规格将根据需求日后制定</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- ******************** 尾页 ******************** -->
        <div class="cybertruck_bot">
            <div class="english">
                <h3>CYBERTRUCK</h3>
                <p class="box_1">
                    <span class="lamp_1">立即订购</span>
                </p>
            </div>
            <div class="bot_image">
                <img src="../assets/13_Desktop_Order.png" alt="">
            </div>
        </div>
    <!-- <my-foot v-show="y>5000?true:false"></my-foot> -->
    </div>
</template>


<style>
    #cybertruck{
        width: 100%;
        height: 100;
        background: #000;
    }
    /* ---------------------- 头部---------------------- */
    #cybertruck  .box_hander{
        color: #fff;
        width: 208px;
        height: 40px;
        border:2.5px solid transparent;
        border-color: #fff;
        text-align: center;
        line-height: 40px;
    }
    #cybertruck  .box_hander:hover{
        animation: pulsate 0.5s forwards;
    }
    @keyframes pulsate{
        0% {
		border-color: gray;
        background: transparent;
	}
	10% {
		border-color:#fff;
        background: transparent;
	}
	20% {
        border-color: gray;
        background: transparent;
	}
    30% {
        border-color: #fff;
        background: transparent;
    }
    40% {
        border-color: gray;
        background: transparent;
    }
    50% {
        border-color: #fff;
        background: transparent;
    }
    60% {
        border-color: gray;
        background: transparent;
    }
    70% {
        border-color: #fff;
        background: transparent;
    }
    80% {
        border-color: gray;
        background: transparent;
    }
    90% {
        border-color: #fff;
        background: transparent;
    }
    100% {
        border-color:#fff;
        background: #fff;
        color: #000;
    }
    }
    /* ------------------ 第一页------------------../assets/cybertruck1.jpg  */
    #cybertruck .cybertruck_one{
        background: url('../assets/cybertruck1.jpg') no-repeat center;
        background-size: cover;
        -webkit-background-size: cover;
        -o-background-size: cover;
        background-position: center 0;
    }
    #cybertruck .propaganda{
         text-align: center;
         color: #fff;
         text-shadow:0rem 0rem .5rem #fff;
        padding-bottom:5%; 
    }
    #cybertruck .gui{
        padding:5%;
        margin: 0 auto; 
        text-align: center;
        padding-bottom:27%; 
    }
    #cybertruck .propaganda .txt{
        letter-spacing:5px;
        font-size: 14px;
    }
    #cybertruck .propaganda .box{
        width: 208px;
        height: 40px;
        margin:0 auto;
        margin-top:20px;
        position: relative;
        border:2.5px solid transparent;
        border-color: #fff;
        text-align: center;
        line-height: 40px;
    }
    #cybertruck .propaganda .box:hover{
        animation: pulsate 0.5s forwards;
    }
    @keyframes pulsate{
        0% {
		border-color: gray;
        background: transparent;
	}
	10% {
		border-color:#fff;
        background: transparent;
	}
	20% {
        border-color: gray;
        background: transparent;
	}
    30% {
        border-color: #fff;
        background: transparent;
    }
    40% {
        border-color: gray;
        background: transparent;
    }
    50% {
        border-color: #fff;
        background: transparent;
    }
    60% {
        border-color: gray;
        background: transparent;
    }
    70% {
        border-color: #fff;
        background: transparent;
    }
    80% {
        border-color: gray;
        background: transparent;
    }
    90% {
        border-color: #fff;
        background: transparent;
    }
    100% {
        border-color:#fff;
        background: #fff;
        color: #000;
    }
    }
        /*屏幕宽度在500-800之间*/
    @media screen and (min-width: 500px) and (max-width: 800px){
             #cybertruck  .box_hander{
                    width: 150px;
                    height: 40px;
                }
                #cybertruck .cybertruck_one{
                    width:100%;
                    height:60%;
                }
                #cybertruck .gui{
                    width: 40%;
                }
                #cybertruck .propaganda .txt{
                    font-size: 12px;
                }
                #cybertruck .propaganda .box{
                    width: 20%;
                    height: 40px;
                    font-size: 12px;
                }
        }
        /*屏幕宽度小于500之间*/
        @media screen and (max-width: 500px){
             #cybertruck  .box_hander{
                    width: 100px;
                    height: 40px;
                }
                #cybertruck .cybertruck_one{
                    width:100%;
                    height:30%;
                }
               #cybertruck .gui{
                    width: 40%;
                }
                #cybertruck .propaganda{
                    padding-top: 18%;
                }
                #cybertruck .propaganda .txt{
                    font-size: 10px;
                }
                #cybertruck .propaganda .box{
                    width: 20%;
                    height: 30px;
                    line-height: 30px;
                    font-size: 8px;
                }
        }
        /* ---------------- 第二页------------------  */
    #cybertruck .banner{
        width: 100%;
        background: #000;
    }
    #cybertruck .cybertruck_two{
        width: 100%;
        height: 100%;
        background:black;
        padding: 5%;
    }
    /* 图片 */
    
    #cybertruck .cybertruck_two img{
        display: block;
        margin: 0 auto;
    }
    /* 介绍 */
    #cybertruck .cybertruck_two .introduce_1 {
        width:80%;
        color: #fff;
        margin: 0 auto;
        padding-top:5%; 
    }
    #cybertruck .cybertruck_two .introduce_1 h4{
        text-shadow:0rem 0rem .1rem #fff;
        letter-spacing:3px;
    }
    #cybertruck .cybertruck_two .introduce_1 p{
        margin-top:20px;
    }

    @media screen and (min-width: 500px) and (max-width: 800px){
        #cybertruck .cybertruck_two .introduce_1 {
            width: 70%;
         }
        #cybertruck .cybertruck_two .introduce_1 h4{
            font-size:20px;
        }
        #cybertruck .cybertruck_two .introduce_1 p{
            font-size: 12px;
        }
        }
        /*屏幕宽度小于500之间*/
    @media screen and (max-width: 500px){
        #cybertruck .cybertruck_two .introduce_1 h4{
            font-size:16px;
        }
        #cybertruck .cybertruck_two .introduce_1 p{
            font-size: 8px;
        }
        }
        /* -------------- 第三页 --------------- */
    #cybertruck .cybertruck_three{
        padding: 5%;
    }
    #cybertruck .cybertruck_three img{
        display: block;
        margin: 0 auto;
    }
    #cybertruck .cybertruck_three .introduce_2{
        padding: 0% 8%;         
    }
    #cybertruck .cybertruck_three .left {
        display: inline-block;
        color: #fff;
    }
    #cybertruck .cybertruck_three .right {
        color: #fff;
        float: right;
    }
   @media screen and (min-width: 500px) and (max-width: 800px){
 
    #cybertruck .cybertruck_three .left{
        font-size: 12px;
    }
    #cybertruck .cybertruck_three .right{
        font-size: 12px;
    }
        }
        /*屏幕宽度小于500之间*/
    @media screen and (max-width: 500px){
        #cybertruck .cybertruck_three .left{
            font-size: 14px;
            width: 100%;
        }
        #cybertruck .cybertruck_three .right{
            width: 100%;
            font-size: 8px;            
        }
        }
        /* ************  第四页 **************** */
    #cybertruck .cybertruck_four{
        padding: 5%;
        
    }
    #cybertruck .cybertruck_four img{
        display: block;
        margin: 0 auto;
    }
    #cybertruck .cybertruck_four .introduce_3{
        width: 100%;
        height: 100%;
        padding: 3% 8%;
    }
    #cybertruck .cybertruck_four .left {
        display: inline;
        color: #fff;
        text-align: left;
        padding: 12px;
    }
    #cybertruck .cybertruck_four .right {
        color: #fff;
        width: 60%;
        float: right;
    }
    @media screen and (min-width: 500px) and (max-width: 800px){
    #cybertruck .cybertruck_four .left{
        padding: 0% 0% 0% 0%;
        font-size: 12px;
    }
    #cybertruck .cybertruck_four .right{
        font-size: 12px;
    }
    }
    @media screen and (max-width: 500px){
        #cybertruck .cybertruck_four{
            padding-top:20%; 
        }
        #cybertruck .cybertruck_four .left{
        padding: 5% 0% 0% 0%;
        width: 100%;
        font-size: 12px;
        }   
        #cybertruck .cybertruck_four .right{
        width: 100%;
        font-size: 12px;
        }
        }
        /* 第五页---------------------轮播 */
    .el-carousel__item h3 {
        color: #475669;
        font-size: 14px;
        opacity: 0.75;
        line-height: 200px;
        margin: 0;
    }
    #cybertruck .cybertruck_five{
        margin:0 auto;
        background-color:none; 
    }
   
    #cybertruck .cybertruck_five img{
        width: 100%;        
        height: 100%;
    }
    @media screen and (max-width: 500px){
        #cybertruck .cybertruck_five{
            display: none;
        }
        }
    /* --------------------- 第六页 ---------------*/
    #cybertruck .cybertruck_six{
        margin: 5% 0%;
        padding: 5%;
    }
    #cybertruck .cybertruck_six video{
        width: 100%;
        text-align: center;
    }

    #cybertruck .cybertruck_six h3{
         text-shadow:0rem 0rem .2rem #fff;
         text-align: left;
    }
    #cybertruck .cybertruck_six .xiaolv{
        color: #fff;
        
    }
    @media screen and (max-width: 500px){
        #cybertruck .cybertruck_six .xiaolv{
            margin-top:-3px; 
        }
        #cybertruck .cybertruck_six h3{
            font-size:18px; 
        }
        #cybertruck .cybertruck_six .xiaolv span{
            font-size: 8px;
        }
    }
    /* ---------------------- 第七页 ------------------ */
    #cybertruck .cybertruck_seven{
        color: #fff;
        padding: 10%;
    }
    #cybertruck .cybertruck_seven .Specifications_right{
        width: 60%;
        height: 100%;
        float: right;
    }
    #cybertruck .cybertruck_seven .Specifications_left{
        width: 40%;
        height: 50%;
    }
    #cybertruck .cybertruck_seven .Specifications_left h3{
        text-shadow:0rem 0rem .2rem #fff;        
    }
    #cybertruck .cybertruck_seven .Specifications_left input{
       margin:10px 5px;
    }
    #cybertruck .cybertruck_seven .Specifications_left ul li{
        padding: 20px 0px;
        border-bottom: 1px solid  gray;
    }
    #cybertruck .cybertruck_seven .Specifications_left ul li div .right_x{
        float:right;
    }
     @media screen and (min-width: 500px) and (max-width: 800px){
        #cybertruck .cybertruck_seven .Specifications_left{
            width: 100%;
            height: 50%;
            font-size: 12px;
        }
        #cybertruck .cybertruck_seven .Specifications_right{
            width: 100%;
        }
    }
    @media screen and (max-width: 500px){
         #cybertruck .cybertruck_seven .Specifications_right{
             width: 100%;
             height: 60%; 
         }
         #cybertruck .cybertruck_seven .Specifications_left{
             width: 100%;
             height: 100%;
             font-size: 12px;
         }
    }
    /* ************************** 尾页 ************************* */
#cybertruck .cybertruck_bot{
        display: flex;
        padding-top: 10%;
        padding-bottom:15%; 
        margin: 0 auto;

    }
    #cybertruck .cybertruck_bot .english{
        flex:1;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    #cybertruck .cybertruck_bot .english h3{
        text-align: center;
        color: #fff;
        text-shadow: 0rem 0rem .2rem #fff;
    }
    #cybertruck .cybertruck_bot .bot_image{
        flex: 2;

        
    }
    #cybertruck .english .box_1{
        width: 208px;
        height: 40px;
        margin:0 auto;
        margin-top:72px;
        position: relative;
        border:2.5px solid transparent;
        border-color: #fff;
        color: #fff;
        line-height: 40px;
        text-align: center;
        
    }
    #cybertruck .english .box_1:hover{
        animation: pulsate .5s forwards;
    }
    @keyframes pulsate{
        0% {
		border-color: gray;
        background: transparent;
	}
	10% {
		border-color:#fff;
        background: transparent;
	}
	20% {
        border-color: gray;
        background: transparent;
	}
    30% {
        border-color: #fff;
        background: transparent;
    }
    40% {
        border-color: gray;
        background: transparent;
    }
    50% {
        border-color: #fff;
        background: transparent;
    }
    60% {
        border-color: gray;
        background: transparent;
    }
    70% {
        border-color: #fff;
        background: transparent;
    }
    80% {
        border-color: gray;
        background: transparent;
    }
    90% {
        border-color: #fff;
        background: transparent;
    }
    100% {
        border-color:#fff;
        background: #fff;
        color: #000;
        font-weight: bold;
    }
    }
    @media screen and (min-width: 500px) and (max-width: 800px){
        #cybertruck .cybertruck_bot{
            padding:40% 6% 0% 6%; 
        }
        #cybertruck .english .box_1{
            font-size: 12px;
            width: 60%;
        }
        #cybertruck .cybertruck_bot .english{
            height: 25%; 
        }
        #cybertruck .cybertruck_bot .bot_image{
            width:100%;
            height: 50%;
        }
    }
    @media screen and (max-width: 500px){
        #cybertruck .cybertruck_bot{
            padding:0% 6% 0% 6%; 
            display: flex;
        }
        #cybertruck .english .box_1{
            font-size: 12px;
            width: 60%;
        }
        #cybertruck .cybertruck_bot .english{
            flex: 5;
            padding:80% 0%;
            width: 100%;
            height: 40%; 
        }
        #cybertruck .cybertruck_bot .english h3{
            font-size: 20px;
        }
        #cybertruck .cybertruck_bot .bot_image{
            flex:0;
            width:100%;
        }
    }

    @media screen and (min-width: 800px){
    #cybertruck .decline{
        margin-top:180px !important;
        opacity: 0;
        transition: 1s;
    }
    #cybertruck .rise{
        margin-top: 30px !important;
        opacity: 1;
    } 
    }
    #cybertruck #foot div a{
        color: #fff;
    }

</style>



<script>
export default {
    data(){
        return {
            y:"",
            rise:{rise:true},
            navToTop:false,
            Rotation:[
            {
              id:0,
              idView:(require('../assets/Rotation/05_Desktop.jpg'))
            },
            {
              id:1,
              idView:(require('../assets/Rotation/06_Desktop.jpg'))
            },
            {
              id:2,
              idView:(require('../assets/Rotation/07_Desktop.jpg'))
            },
            {
              id:3,
              idView:(require('../assets/Rotation/08_Desktop.jpg'))
            },
            {
              id:4,
              idView:(require('../assets/Rotation/09_Desktop.jpg'))
            },
            {
              id:5,
              idView:(require('../assets/Rotation/10_Desktop.jpg'))
            },
            ]
        }
    },
    methods:{

    },
    mounted(){
        window.onscroll = ()=>{
             if(window.innerWidth>=800){
            if (window.pageXOffset){//查看有无pageXOffset属性：IE9以及IE9以上的浏览器
	            this.y = window.pageYOffset;
	        }else if (document.compatMode ==  "BackCompat"){//混杂（怪异）模式下浏览器
	           this.y = document.body.scrollTop;
	        }else {//标准模式下浏览器
	            this.y = document.documentElement.scrollTop;
	        }
        }
        }
	        
    },
    beforeMount(){
       
    }
}
</script>
