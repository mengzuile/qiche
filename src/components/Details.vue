
<template>
    <div id="models">
        <!-- 回到顶部 -->
        <NavTotop v-show='navToTop' ref='btnColor'>
            <slot slot="img"><img :src="toTopLogo"></slot>
        </NavTotop>
        <full-page :options="options" ref="fullpage">
            <!-- -------------------------------第一屏 ---------------------------------->
            <div class="section">
                <my-header ref="myHeader" v-show="!navToTop">
                    <slot><img src="../assets/logo1.gif"></slot>  
                </my-header>
                <div class="box1" :style='"background-image:url("+box1Bgimg+")"'>
                    <slot name="box1Video"></slot>
                    <!-- 车型号 -->
                    <div class='modelsTitle'>
                        <div :class="change">
                            <h1><slot name="car_Type"></slot></h1>
                            <p><slot name="car_Type_sm"></slot></p>
                        </div>
                    </div>
                    <!-- 车基础情况 -->
                    <div class="modelsParameter">
                        <div :class="change">
                            <ul class='w-100 d-flex justify-content-center'>
                            <!-- 百公里加速 -->
                            <li>
                                <slot name="brief1.1Div">
                                    <div>
                                        <div class="miao">
                                            <div><i class="iconfont">&#xe603;</i></div>
                                            <div class="num1" :style='num1'>
                                                0<br>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9
                                            </div>
                                            <div>.</div>
                                            <div class="num2" :style='num2'>
                                                0<br>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9<br>0<br>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9
                                            </div>
                                            <div>秒</div>
                                        </div>
                                    </div>
                                </slot>
                                <slot name="brief1.1P"><p>百公里加速</p></slot>
                            </li>
                            <li class="shu"></li>
                            <!-- 超大载物空间 -->
                            <li>
                                <slot name="brief1.2Div">
                                    <div>804升</div>
                                </slot>
                                <slot name="brief1.2P">
                                    <p>超大载物空间</p>
                                </slot>
                            </li>
                            <li class="shu"></li>
                            <!-- 续航里程 -->
                            <li>
                                <slot name="brief1.3Div">
                                    <div>719公里</div>
                                </slot>
                                <slot name="brief1.3P">
                                    <p>续航里程</p>
                                    <p>国标工况法</p>
                                </slot>
                            </li>
                            <!-- 立即订购 -->
                            <li>
                                <router-link to='/design'><button>立即订购</button></router-link>
                                
                            </li>
                        </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- -------------------------------第二屏-------------------------------- -->
            
            <div class="section">
                <div class="box2">
                    <div class="row m-0">
                        <!-- 左边简介 -->
                        <div class='col-12 col-xl-3 fletBox'>
                            <Models-right ref="box2ChangeFn">
                                <slot slot="title">安全性</slot>
                                <slot slot="small-title"><slot name="Security_Title"></slot></slot>
                                <slot slot="center"><slot name="Security_content"></slot></slot>
                            </Models-right>
                        </div>
                        <!-- 右边模型 -->
                        <div class='col-12 col-xl-9 rightBox m-0 p-0' :class="box2Change">
                            <div class="bgImg" :style="'background-image:url('+box2Bgimg+')'">
                                <!-- 前撞保护 -->
                                <div>
                                    <span>前撞保护</span>
                                </div>
                                <!-- 侧撞保护 -->
                                <div>
                                    <span>侧撞保护</span>
                                </div>
                                <!-- 侧翻风险很低 -->
                                <div>
                                    <span>侧翻风险很低</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- -------------------------------第三屏-------------------------------- -->
            <div class="section">
                <div class="box3">
                    <div class="box3Change">
                        <!-- 上边 -->
                        <div class="bgImg3" :style='"background-image:url("+box3Bgimg+")"'>
                            <div :class="box3Change">
                                <slot name='box3Video'></slot>
                                <!-- 车基础情况 -->
                                <Models-centent ref="box3ChangeFn">
                                    <slot slot="content1Div">
                                        <slot name="brief3.1Div">全轮驱动</slot>
                                    </slot>

                                    <slot slot="content1P">
                                        <slot name="brief3.1P">双电机全轮驱动实现对牵引力和扭矩的全天候精准控制</slot>
                                    </slot>
                                    <slot slot="content1P2">
                                        <slot name="brief3.12P">标配全轮驱动</slot>
                                    </slot>

                                    <slot slot="content2Div">
                                        <slot name="brief3.2Div">
                                            <div class="miao">
                                                <div><i class="iconfont">&#xe603;</i></div>
                                                <div class="num1" :style='num3'>
                                                    0<br>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9
                                                </div>
                                                <div>.</div>
                                                <div class="num2" :style='num4'>
                                                    0<br>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9<br>0<br>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9
                                                </div>
                                                <div>秒</div>
                                            </div>
                                        </slot>
                                    </slot>
                                    <slot slot="content2P">
                                        <slot name="brief3.2P">同级别车型中出色的加速性能：百公里加速最快只需 2.5 秒</slot>
                                    </slot>
                                    <slot slot="content2P2">
                                        <slot name="brief3.22P">百公里加速</slot>
                                    </slot>

                                    <slot slot="content3Div">
                                        <slot name="brief3.3Div">250公里/小时</slot>
                                    </slot>
                                    <slot slot="content3P">
                                        <slot name="brief3.3P">操控性和空气动力学表现极佳，时速可达 250 公里/小时</slot>
                                    </slot>
                                    <slot slot="content3P2">
                                        <slot name="brief3.32P">最高车速</slot>
                                    </slot>
                                </Models-centent>
                            </div>
                        </div>
                        <!-- 下边 -->
                        <!-- 车简介 -->
                        <Models-bottom ref="box3ChangeBottom">
                            <slot slot="title">性能</slot>
                            <slot slot="small-title"><slot name="Performance_Title"></slot></slot>
                            <slot slot="center"><slot name="Performance_content"></slot></slot>
                        </Models-bottom>
                    </div>
                </div>
            </div>
            <!-- -------------------------------第四屏-------------------------------- -->
            <div class="section">
                <div class="box4">
                    <div :class="box4Change" class="row m-0">
                        <!-- 左边视频 -->
                        <div class="col-12 col-xl-9 m-0 p-0">
                            <slot name="box4Video"></slot>
                            
                             <!-- 车基础情况 -->
                                <Models-centent ref="box4ChangeCentent" class="ModelsCentent">
                                    <slot slot="content1Div">
                                        <slot name="brief4.1Div">719公里</slot>
                                    </slot>
                                    <slot slot="content1P">
                                        <slot name="brief4.1P">单次充电续航里程最高可达 719 公里</slot>
                                    </slot>
                                    <slot slot="content1P2">
                                        <slot name="brief4.12P">续航里程</slot>
                                    </slot>

                                    <slot slot="content2Div">
                                        <slot name="brief4.2Div">15分钟</slot>
                                    </slot>
                                    <slot slot="content2P">
                                        <slot name="brief4.2P">在超级充电站充电 15 分钟，即可补<br>充最多约 276 公里的续航电量</slot>
                                    </slot>
                                    <slot slot="content2P2">
                                        <slot name="brief4.22P">补充276 公里续航</slot>
                                    </slot>

                                    <slot slot="content3Div">
                                        <slot name="brief4.3Div">18,000+</slot>
                                    </slot>
                                    <slot slot="content3P">
                                        <slot name="brief4.3P">超级充电站遍布全球热门线路</slot>
                                    </slot>
                                    <slot slot="content3P2">
                                        <slot name="brief4.32P">超级充电桩</slot>
                                    </slot>
                                </Models-centent>
                        </div>
                        <!-- 右边车详情 -->
                        <div class="col-12 col-xl-3  m-0 p-0">
                            <Models-right ref="box4ChangeFn">
                                <slot slot="title">续航里程</slot>
                                <slot slot="small-title"><slot name="mileage_Title"></slot></slot>
                                <slot slot="center"><slot name="mileage_content"></slot></slot>
                            </Models-right>
                        </div>
                    </div>
                </div>
            </div>
            <!-- -------------------------------第五屏-------------------------------- -->
            <div class="section">
                <div class="box5">
                    <div class="box5Change">
                        <!-- 上边视频 -->
                        <div class="box5Top">
                            <video src="../assets/MODELS/video/hero.mp4"  muted="muted"  loop='loop' ref="box5autoplay"></video>
                            <!-- 车基础情况 -->
                            <Models-centent ref="box5ChangeFn" class="box5Models-centent">
                                <slot slot="content1Div">360°</slot>
                                <slot slot="content1P">前置、侧方和车尾摄像头，视野范围达 360 度</slot>
                                <slot slot="content1P2">视野范围</slot>

                                <slot slot="content2Div">160m</slot>
                                <slot slot="content2P">前置雷达，探测前方较远距离的障碍物</slot>
                                <slot slot="content2P2">前置雷达</slot>

                                <slot slot="content3Div"><div class="box5r"><div>12</div> 超声波<br>传感器</div></slot>
                                <slot slot="content3P">探测附近车辆，降低碰撞风险，辅助泊车</slot>
                                <slot slot="content3P2">探测附近车辆</slot>
                            </Models-centent>
                        </div>
                        <!-- 下边详情 -->
                        <div class="box5Bottom">
                            <Models-bottom ref="box5ChangeBottom">
                                <slot slot="title">Autopilot 自动辅助驾驶</slot>
                                <slot slot="small-title"><slot name="Autopilot_Title"></slot></slot>
                                <slot slot="center"><slot name="Autopilot_content"></slot></slot>
                            </Models-bottom>
                        </div>
                    </div>
                </div>
            </div>
            <!-- -------------------------------第六屏-------------------------------- -->
            <div class="section">
                <div class="box6">
                    <!-- 上边 -->
                    <div class="box6Img" :style='"background-image:url("+box6Bgimg+")"'>
                        <!-- 车基础情况 -->
                        <slot name="box6Video"></slot>
                        <Models-centent ref="box6ChangeFn" class="box6Models-centent">
                            <slot slot="content1Div">
                                <slot name="brief6.1Div">17英寸</slot>
                            </slot>
                            <slot slot="content1P">
                                <slot name="brief6.1P">车载触摸屏，操控一目了然</slot>
                            </slot>
                            <slot slot="content1P2">
                                <slot name="brief6.12P">触摸屏</slot>
                            </slot>

                            <slot slot="content2Div">
                                <slot name="brief6.2Div"><i class="iconfont wifi">&#xe65f;</i></slot>
                            </slot>
                            <slot slot="content2P">
                                <slot name="brief6.2P">OTA 空中软件更新，不断引入新功能并提升性能量</slot>
                            </slot>
                            <slot slot="content2P2">
                                <slot name="brief6.22P">OTA 软件升级</slot>
                            </slot>

                            <slot slot="content3Div">
                                <slot name="brief6.3Div">804升</slot>
                            </slot>
                            <slot slot="content3P">
                                <slot name="brief6.3P">超大载物空间，堪比 SUV 车型</slot>
                            </slot>
                            <slot slot="content3P2">
                                <slot name="brief6.32P">超大载物空间</slot>
                            </slot>
                        </Models-centent>
                    </div>
                    <!-- 下边 -->
                    <div>
                        <Models-bottom ref="box6ChangeBottom">
                            <slot slot="title">内饰</slot>
                            <slot slot="small-title"><slot name="Interior_Title"></slot></slot>
                            <slot slot="center"><slot name="Interior_content"></slot></slot>
                        </Models-bottom>
                    </div>
                </div>
            </div>
            <!-- -------------------------------第七屏-------------------------------- -->
            <div class="section">
                <div class="box7">
                    <!-- 上边 -->
                    <div class="box7Img" :style='"background-image:url("+box7BigBgimg+")"'>
                        <!-- 车基础情况 -->
                        <div :style='"background-image:url("+box7Bgimg+")"'>
                            <Models-centent ref="box7ChangeFn" class="box6Models-centent">
                                <slot slot="content1Div">
                                    <slot name="brief7.1Div"><div><img class="img1" src="../assets/MODELS/signature-colors.png" alt=""> <span>定制车漆颜色</span></div></slot>
                                </slot>
                                <slot slot="content1P">
                                    <slot name="brief7.1P">定制你的 Model S，多种车漆颜色供选择</slot>
                                </slot>
                                <slot slot="content1P2">
                                    <slot name="brief7.12P"></slot>
                                </slot>

                                <slot slot="content2Div">
                                    <slot name="brief7.2Div">
                                        <div>0.23<img class="img2" src="../assets/MODELS/cd_2.png" alt=""></div>
                                    </slot>
                                </slot>
                                <slot slot="content2P">
                                    <slot name="brief7.2P">Model S 的空气动力学表现十分出色，风阻系数极低</slot>
                                </slot>
                                <slot slot="content2P2">
                                    <slot name="brief7.22P">风阻系数极低</slot>
                                </slot>

                                <slot slot="content3Div">
                                    <slot name="brief7.3Div"><img class="img3" src="../assets/MODELS/MS_roof.png" alt=""><span>适配车顶行李架</span></slot>
                                </slot>
                                <slot slot="content3P">
                                    <slot name="brief7.3P">标配全景玻璃车顶，有效阻隔紫外线，头部空间更充裕</slot>
                                </slot>
                                <slot slot="content3P2">
                                    <slot name="brief7.32P"></slot>
                                </slot>
                            </Models-centent>
                        </div>
                        
                        <!-- 下边 -->
                        <div>
                            <Models-bottom ref="box7ChangeBottom">
                                <slot slot="title">外观</slot>
                                <slot slot="small-title"><slot name="Appearance_Title"></slot></slot>
                                <slot slot="center"><slot name="Appearance_content"></slot></slot>
                            </Models-bottom>
                        </div>
                    </div>
                </div>
            </div>
            <!-- -------------------------------第八屏-------------------------------- -->
            <div class="section">
                <div class="box8 row m-0">
                    <!-- 左边图片 -->
                    <div class="col-6 m-0 p-0" :class="box8Change">
                        <img :src="box8img">
                    </div>
                    <!-- 右边简介 -->
                    <div class="col-6 m-0 p-0" :class="box8Change">
                        <table>
                            <tr>
                                <td colspan="2"><h3><slot name="modelName">Model S</slot> 规格</h3></td>
                            </tr>
                            <!-- -- -->
                            <tr>
                                <td>
                                    <button @click='box8Btn(1)' :style='box8Btn1'>Performance 高性能版</button>
                                </td>
                                <td>
                                    <button @click='box8Btn(2)' :style='box8Btn2'>长续航升级版</button>
                                </td>
                            </tr>
                            <!-- -- -->
                            <tr>
                                <td>
                                    <p>电池</p>
                                    <p>长续航电池</p>
                                </td>
                                <td>
                                    <p>重量</p>
                                    <p>2,242 kg</p>
                                </td>
                            </tr>
                            <!-- -- -->
                            <tr>
                                <td>
                                    <p>加速</p>
                                    <p>2.5 秒 0-100 公里/小时</p>
                                </td>
                                <td>
                                    <p>储物空间</p>
                                    <p>804 升</p>
                                </td>
                            </tr>
                            <!-- -- -->
                            <tr>
                                <td>
                                    <p>续航里程</p>
                                    <p>694 公里</p>
                                </td>
                                <td>
                                    <p>显示屏</p>
                                    <p>仪表盘 + 17 英寸触摸屏</p>
                                </td>
                            </tr>
                            <!-- -- -->
                            <tr>
                                <td>
                                    <p>驱动</p>
                                    <p>全轮驱动</p>
                                </td>
                                <td>
                                    <p>超级充电功率和费用</p>
                                    <p>峰值功率 250 kW；按使用付费</p>
                                </td>
                            </tr>
                            <!-- -- -->
                            <tr>
                                <td>
                                    <p>座位数</p>
                                    <p>5 个座位</p>
                                </td>
                                <td rowspan="2">
                                    <p>质量保证</p>
                                    <p>整车质保：4 年或 8 万公里（先到者为准）</p>
                                    <p>电池和驱动单元：8 年或 240,000 公里（先到者为准）</p>
                                </td>
                            </tr>
                            <!-- -- -->
                            <tr>
                                <td>
                                    <p>轮毂</p>
                                    <p>19 英寸或 21 英寸</p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- -------------------------------第九屏-------------------------------- -->
            <div class="section">
                <div class="box9 row m-0">
                    <div class="col-sm-4 col-12 m-0 p-0 box9Left">
                        <div>
                            <h4>订购 <slot name="car_Type"></slot></h4>
                            <slot name="box9Btn">
                                <router-link to="/design"><button>立即订购</button></router-link>
                            </slot>
                        </div>
                    </div>
                    <div class="col-sm-8 col-12 m-0 p-0 box9Right">
                        <div>
                            <img :src="box9img" alt="">
                        </div>
                    </div>
                </div>
                <my-foot/>
            </div>
            
        </full-page>
    </div>
</template>
 
<script>
export default {
    name: '',
    data(){
        return {
            id:'',
            options: {
                licenseKey: 'OPEN-SOURCE-GPLV3-LICENSE',
                afterLoad: this.afterLoad,
                scrollOverflow: false,
                scrollBar: false,    //是否显示滚动条
                menu: '#menu',
                // navigation:true,
                // autoScrolling:false,
                slidesNavigation:true,
                // resize:true,
                // autoScrolling:false,
                // loopBottom:true,     //滚动到最后回到第一页
                // anchors: ['page1', 'page2', 'page3'],
                // sectionsColor: ['#41b883', '#ff5f45', '#0798ec', '#fec401', '#1bcee6', '#ee1a59', '#2c3e4f', '#ba5be9', '#b4b8ab'] //页面颜色
                afterLoad: this.afterLoad,
            },
            change:{change:false},          //第一屏进入动画
            box2Change:{box2Change:false},  //第二屏进入动画
            box3Change:{box3Change:false},  //第三屏进入动画
            box4Change:{box4Change:false},  //第四屏进入动画
            box8Change:{box8Change:false},  //第八屏进入动画
            autoplay:'',

            // 第八屏按钮
            box8Btn1:'border-color:#fff',
            box8Btn2:'',

            // 回到顶部导航
            navToTop:false,
            toTopLogo:require('../assets/logo1.png'),

            num1:'',
            num2:'',
            num3:'',
            num4:'',
            //MODELS 背景图片
            box7BigBgimg:'',
            //背景图片
            box1Bgimg:'',
            box2Bgimg:'',
            box3Bgimg:'',
            box6Bgimg:'',
            box7Bgimg:'',
            // 第八屏图片
            box8img:'',
            // 第九屏图片
            box9img:'',

            bool:true,
            windowWidth:'',
        }
    },
    methods:{
        // 回到顶部
        toTop(){
            this.$refs.fullpage.api.moveTo(1,0);
        },
        afterLoad(anchors,item){
            // 回到顶部导航
            if(item.index == 0){  
                this.navToTop = false;
            }else{
                this.navToTop = true;
                if(this.$refs.myHeader.show){
                    this.$refs.myHeader.handel()
                }
            }
            if(item.index == 5 || item.index == 7 || (this.id == 2 && item.index == 8) || (this.id == 4 && item.index == 8) || (this.id == 4 && item.index == 2)){  
                this.toTopLogo = require('../assets/logo1.gif');
                this.$refs.btnColor.color1 = 'color:#fff'
            }else{
                this.toTopLogo = require('../assets/logo1.png');
                this.$refs.btnColor.color1 = 'color:#000'
            }
            setTimeout(()=>{
                //===============第一屏=================
                if(item.index == 0){  
                    this.change.change = true;
                    this.num1 = this.$parent.num1;
                    this.num2 = this.$parent.num2;
                }else{
                    this.navToTop = true;
                    this.change.change = false;
                    this.num1 = '';
                    this.num2 = '';
                }
                // ==============第二屏==================
                if(item.index == 1){   
                    this.box2Change.box2Change = true;
                    // 左边简介组件  进入
                    this.$refs.box2ChangeFn.changeRight(true)
                }else{
                    this.box2Change.box2Change = false;
                    // 左边简介组件  移出
                    this.$refs.box2ChangeFn.changeRight(false)
                }
                // ===============第三屏======================
                if(item.index == 2){   
                    this.box3Change.box3Change = true;
                    // 上边简介组件  进入
                    this.$refs.box3ChangeFn.models_cententChange(true,true)
                    // 下边简介组件  进入
                    this.$refs.box3ChangeBottom.changeBottom(true);

                    this.num3 = this.$parent.num1;
                    this.num4 = this.$parent.num2;
                }else{
                    this.box3Change.box3Change = false;
                    // 上边简介组件  移出
                    this.$refs.box3ChangeFn.models_cententChange(false,true)
                    // 下边简介组件  移出
                    this.$refs.box3ChangeBottom.changeBottom(false)

                    this.num3 = '';
                    this.num4 = '';
                }
                // ===================第四屏===========================
                if(item.index == 3){   
                    // 左边简介组件  进入
                    this.$refs.box4ChangeCentent.models_cententChange(true,true)
                    // 右边简介组件  进入
                    this.$refs.box4ChangeFn.changeRight(true)
                }else{
                    // 左边简介组件  移出
                    this.$refs.box4ChangeCentent.models_cententChange(false,true)
                    // 右边简介组件  移出
                    this.$refs.box4ChangeFn.changeRight(false)
                }
                // ==================第五屏==========================
                if(item.index == 4){   
                    // 上边简介组件  进入
                    this.$refs.box5ChangeFn.models_cententChange(true,false)
                    // 下边简介组件  进入
                    this.$refs.box5ChangeBottom.changeBottom(true)
                }else{
                    // 上边简介组件  移出
                    this.$refs.box5ChangeFn.models_cententChange(false,false)
                    // 下边简介组件  移出
                    this.$refs.box5ChangeBottom.changeBottom(false)
                }
                // =================第六屏=============================
                if(item.index == 5){   
                    // 上边简介组件  进入
                    this.$refs.box6ChangeFn.models_cententChange(true,false)
                    // 下边简介组件  进入
                    this.$refs.box6ChangeBottom.changeBottom(true)
                }else{
                    // 上边简介组件  移出
                    this.$refs.box6ChangeFn.models_cententChange(false,false)
                    // 下边简介组件  移出
                    this.$refs.box6ChangeBottom.changeBottom(false)
                }
                // =================第七屏=============================
                if(item.index == 6){   
                    // 上边简介组件  进入
                    this.$refs.box7ChangeFn.models_cententChange(true,true)
                    // 下边简介组件  进入
                    this.$refs.box7ChangeBottom.changeBottom(true);
                    // modely
                    this.$parent.num11 = '--tcl-integral-as-percent: -30%';
                    this.$parent.num22 = '--tcl-integral-as-percent: -85%';
                }else{
                    // 上边简介组件  移出
                    this.$refs.box7ChangeFn.models_cententChange(false,true)
                    // 下边简介组件  移出
                    this.$refs.box7ChangeBottom.changeBottom(false)
                    // modely
                    this.$parent.num11 = '';
                    this.$parent.num22 = '';
                }
                // =================第八屏=============================
               if(item.index == 7){   
                    this.box8Change.box8Change = true;
                }else{
                    this.box8Change.box8Change = false;
                }
            },500)


            // ========================视频===============================
            // --------------------第一屏 视频------------------------------
            if(item.index == 0){
                if(this.id == 3){ //modelx
                    this.$parent.box1Video(true);
                }
            }else{
                if(this.id == 3){
                    this.$parent.box1Video(false)
                }
            }

             //--------------------第三屏 视频-----------------------
            if(item.index == 2){   
                // 自动播放
                if(this.id == 2 || this.id == 4){ //MODEL3 
                    this.$parent.box3Video(true);
                }
            }else{
                // 回到初始
                if(this.id == 2 || this.id == 4){
                    this.$parent.box3Video(false);
                }
            }


            // --------------------第四屏 视频------------------------
            if(item.index == 3){   
                // 自动播放
                this.$parent.box4Video(true)
            }else{
                // 回到初始
                this.$parent.box4Video(false)
            }
             // --------------------第五屏 视频-------------------------
            if(item.index == 4){   
                // 自动播放
                this.$refs.box5autoplay.play();
            }else{
                // 回到初始
                this.$refs.box5autoplay.currentTime=0
            }


            
             // MODEL3---------------- 第六屏 视频----------------------
            if(item.index == 5){// 自动播放
                if(this.id == 2){
                    this.$parent.box6Video(true);
                }
            }else{// 回到初始
                if(this.id == 2){
                    this.$parent.box6Video(false);
                }
            }
        },
        box8Btn(num){
            if(num == 1){
                this.box8Btn1 = 'border-color:#fff';
                this.box8Btn2 = 'border-color:rgb(121, 120, 120)';
            }else if(num == 2){
                this.box8Btn1 = 'border-color:rgb(121, 120, 120)';
                this.box8Btn2 = 'border-color:#fff';
            }
        }
    },
    beforeMount(){
        // 获取父组件传递的id值
        this.id = this.$parent.id;
        this.windowWidth = window.innerWidth;
        if(this.windowWidth > 420){
            this.bool = false;
        }else{
            this.bool = true;
        }
    },
    mounted(){
        // MODELx
        if(this.id == 1 || this.id == 3){
            this.box7BigBgimg = this.$parent.box7BigBgimg;
        }
        this.box1Bgimg = this.$parent.box1Bgimg;
        this.box2Bgimg = this.$parent.box2Bgimg;
        this.box3Bgimg = this.$parent.box3Bgimg;
        this.box6Bgimg = this.$parent.box6Bgimg;
        this.box7Bgimg = this.$parent.box7Bgimg;
        this.box8img = this.$parent.box8img;
        this.box9img = this.$parent.box9img;
        
    }
}

</script>
 
<style>
#models	.h_middle li a,
#models  .h_right a{
    color: #fff;
}
#models #navbar  .inner-header-icon div{
    background-color: #fff;
}
/* -------------第一屏------------------ */
#models .section{
    position: relative;
}
#models .box1{
    width:100%;
    height: 100%;
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
}
#models .box1 video{
    width: 100%;
    height: 100%;
    object-fit:fill;
}
/* 车型号 */
#models .box1 .modelsTitle{
    text-align: center;
    width: 100%;
    color:#fff;
    padding-top:9vh;
}
#models .box1 .modelsTitle h1,
#models .box1 .modelsTitle p{
    position: absolute;
    top:160px;
    left:50%;
    transform: translate(-50%);
    opacity: 0;
    transition:opacity 1.5s, top 1.5s;
}
#models .box1 .modelsTitle p{
    font-weight: 900;
    font-size: 16px;
}
/* 当滑动到第一页所触发的动画 */
#models .box1 .modelsTitle > .change p,
#models .box1 .modelsTitle > .change h1{
    opacity: 1;
}
#models .box1 .modelsTitle > .change h1{
    top:100px;
}
#models .box1 .modelsTitle > .change p{
    top:150px;
}
/* 车基础情况 */
#models .modelsParameter{
    width: 100%;
}
#models .modelsParameter ul{
    position: absolute;
    flex-wrap:wrap;
    bottom: 60px;
}
#models .modelsParameter ul li{
    /* float: left; */
    margin:0 20px;
    text-align: center;
}
#models .modelsParameter ul li:nth-child(1){
    transition:opacity 0.5s;
}
#models .modelsParameter ul li:nth-child(2){
    transition:opacity 1s 0.1s;
}
#models .modelsParameter ul li:nth-child(3){
    transition:opacity 1.5s 0.1s;
}
#models .modelsParameter ul li:nth-child(4){
    transition:opacity 2s 0.3s;
}
#models .modelsParameter ul li:nth-child(5){
    transition:opacity 2.5s 0.3s;
}
#models .modelsParameter ul li:nth-child(6){
    transition:opacity 3s 0.5s;
}
#models .modelsParameter .change ul li{
    opacity: 1;
}
/* 竖线 */
#models .modelsParameter ul .shu{ 
    width: 1px;
    height: 70px;
    background-color: #000;
    display: block;
}
#models .modelsParameter ul li:nth-child(1) div div{
    float: left;
}
#models .modelsParameter ul li:nth-child(1) .miao{
    height: 37px;
    overflow: hidden;
}
/* 设置字体大小 */
#models .modelsParameter ul li div,
#models .modelsParameter ul li div i{
    font-size: 25px;
    font-weight: 600;
    color:#000;
}

#models .modelsParameter ul li p{
    font-size: 13px;
    color:#000;
}
/* 立即订购按钮 */
#models .modelsParameter ul li:last-child button{
    width: 150px;
    height: 40px;
    border-radius: 20px;
    border:3px solid #000;
    margin-top:20px;
    transition: 0.3s;
    font-size: 13px;
    background-color: transparent;
}
#models .modelsParameter ul li:last-child button:hover{
    background-color: #000;
    color:#fff;
}
#models .modelsParameter .change .num1{
    /* --tcl-integral-as-percent: -20%; */
    transition: 1.5s ease-in-out;
}
#models .modelsParameter .change .num2{
    /* --tcl-integral-as-percent: -75%; */
    transition: 1.7s ease-in-out;
}
/* 进入第一页动画 */
#models .modelsParameter .num1,
#models .modelsParameter .num2{
    transform: translateY(var(--tcl-integral-as-percent)) translateZ(0);
}
#models .modelsParameter ul li{
    opacity: 0;
}
@media (max-width:420px) {
    #models .box1 .modelsTitle h1,
    #models .box1 .modelsTitle p{
        top:120px;
    }
    #models .box1 .modelsTitle > .change h1{
        top:62px;
    }
    #models .box1 .modelsTitle > .change p{
        top:107px;
    }
    #models .modelsParameter ul li div,
    #models .modelsParameter ul li div i{
        font-size: 25px;
        font-weight: 500;
    }
    #models .modelsParameter ul li{
        margin:0 5px;
    }
    #models .modelsParameter ul li:last-child button{
        width: 300px;
    }
}
/* ---------------------第二页---------------- */
#models .box2,
#models .box2 > div,
#models .box2 .rightBox{
    width: 100%;
    height: 100%;
}
/* 右边背景图 */
#models .box2 .rightBox .bgImg{
    width: 100%;
    height: 100%;
    background-repeat: no-repeat;
    background-position: center;
    background-size:97%;
    background-color: rgb(235, 232, 232);
}

/* 线 */
#models .box2 .rightBox .bgImg div{
    position: absolute;
    /* width: 300px; */
    border-left: 3px solid transparent;
    transition:height 1s;
}
/* 右边进入后样式 线 */
#models .box2 .box2Change .bgImg div{
    border-left: 3px solid #000;
}
/* 前装保护 */
#models .box2 .rightBox .bgImg div:first-child{
    height: 0;
    top:22%;
    left:25%;
}
/* 进入    前装保护 */
#models .box2 .box2Change .bgImg div:first-child{
    height: 250px;
}
/* 侧撞保护 */
#models .box2 .rightBox .bgImg div:nth-child(2){
    height: 0px;
    top:15%;
    left:46%;
}
/* 进入    侧撞保护 */
#models .box2 .box2Change .bgImg div:nth-child(2){
    height: 150px;
}
/* 侧翻风险很低 */
#models .box2 .rightBox .bgImg div:nth-child(3){
    height:0px;
    top:61%;
    left:50%;
}
/* 进入     侧翻风险很低 */
#models .box2 .box2Change .bgImg div:nth-child(3){
    height: 130px;
}
#models .box2 .rightBox .bgImg div:nth-child(3) span::after{
    top: -7px;
    left:-5px;
}
#models .box2 .rightBox .bgImg div:nth-child(3) span{
    margin:120px 0 0 10px;
}
/* 文字 */
#models .box2 .rightBox .bgImg div span{
    margin: -10px 0 0 10px;
    display: block;
    opacity: 0;
}
/*进入  文字 */
#models .box2 .box2Change .bgImg div span{
    opacity: 1;
}
/* 圆点 */
#models .box2 .rightBox .bgImg div span::after{
    content: '';
    width: 7px;
    height: 7px;
    border: 2px solid #000;
    border-radius: 50%;
    background-color: #fff;
    display: block;
    position: absolute;
    bottom: -7px;
    left:-5px;
}
@media(max-width:1200px){
    #models .box2 .rightBox .bgImg{
        background-position: top;
        width: 1200px;
    }
    #models .box2 .rightBox .bgImg div:first-child{
        top:130px;
        left:250px;
    }
    #models .box2 .rightBox .bgImg div:nth-child(2){
        top:25px;
        left:545px;
    }
    #models .box2 .rightBox .bgImg div:nth-child(3){
        top:405px;
        left:711px;
        height: 50px;
    }
    #models .box2 .rightBox .bgImg div:nth-child(3) span{
        margin-top:35px;
    }
}
@media(max-width:900px){
    #models .box2 .rightBox .bgImg{
        width: 900px;
    }
    #models .box2 .rightBox .bgImg div:first-child{
        top:160px;
        left:200px;
        height: 130px;
    }
    #models .box2 .rightBox .bgImg div:nth-child(2){
        top:55px;
        left:406px;
        height: 80px;
    }
    #models .box2 .rightBox .bgImg div:nth-child(3){
        top:312px;
        left:533px;
        height: 90px;
    }
    #models .box2 .rightBox .bgImg div:nth-child(3) span{
        margin-top:73px;
    }
}
@media(max-width:420px){
    #models .box2 .rightBox .bgImg{
        width: 420px;
    }
    #models .box2 .rightBox .bgImg div:first-child{
        top:100px;
        left:100px;
    }
    #models .box2 .rightBox .bgImg div:nth-child(2){
        top:14px;
        left:282px;
    }
    #models .box2 .rightBox .bgImg div:nth-child(3){
        top:285px;
        left:303px;
    }
    #models .box2 .rightBox .bgImg div:nth-child(3) span{
        margin-top:73px;
    }
}
/* --------------------------第三屏---------------------- */
#models .box3{
    height: 100%;
}
#models .box3 > div{
    display: flex;
    flex-direction:column;
    height: 100%;
}
#models .box3 >div .bgImg3{
    flex:2;
    background-color: #000;
    width: 100%;
    height: 100%;
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
    position: relative;
}
#models .box3 >div div:last-child{
    flex:1;
}
/* 上边 */
/* 车基础情况 */
#models .bgImg3{
    width: 100%;
}

/* 当滑动到第三页所触发的动画 */
#models .bgImg3 ul li:nth-child(3) .miao{
    height: 37px;
    overflow: hidden;
}

#models .bgImg3 ul li:nth-child(3) .miao div{
    float: left;
}
/* 设置字体大小 */
#models .bgImg3 .box3Change .num1{
    /* --tcl-integral-as-percent: -20%; */
    transition: 1.5s ease-in-out;
}
#models .bgImg3 .box3Change .num2{
    /* --tcl-integral-as-percent: -75%; */
    transition: 1.7s ease-in-out;
}
/* 进入第三页动画 */
#models .bgImg3 .num1,
#models .bgImg3 .num2{
    transform: translateY(var(--tcl-integral-as-percent)) translateZ(0);
}
/* box3Introduction box3Change*/
@media (max-width: 420px) {
    #models .box3 >div .bgImg3{
        flex: 1;
    }
    #models .bgImg3 ul li:nth-child(3) .miao{
        height: 31px;
    }
    
}
/* -------------------------------第四屏------------------------------- */
#models .box4,
#models .box4 >div,
#models .box4 >div>div:first-child{
    width: 100%;
    height: 100%;
}
@media(max-width:1200px){
    #models .box4, #models .box4 >div, #models .box4 >div>div:first-child{
        height: 87%;
    }
}
#models .box4 >div>div:first-child video{
    width: 100%;
    height: 100%;
    object-fit: fill;
}
#models .box4 .ModelsCentent{
    position: absolute;
    bottom:20px;
}
@media(max-width:420px){
    #models .box4, #models .box4 >div, #models .box4 >div>div:first-child{
        height: 84%;
    }
    #models .box4 #models_right{
        padding:12px 10px 10px;
    }
}
/* -------------------------------第五屏------------------------------- */
#models .box5{
    height: 100%;
    width: 100%;
}
#models .box5 > div{
    display: flex;
    flex-direction:column;
    height: 100%;
    width: 100%;
    overflow: hidden;
    position: relative;
}
#models .box5 >div > div:first-child{
    flex:2;
    width: 100%;
    height: 100%;
    margin-top:-147px;
}
#models .box5 >div div:first-child video{
    width: 100%;
    height: 100%;
    object-fit: fill;
}
/* 上边 */
#models .box5 .box5Models-centent{
    position: absolute;
    top:60%;
    left:10%;
}
#models .box5 .box5Models-centent li{
    color:#000;
}
#models .box5 .box5Models-centent .shu{ 
    background-color: #000;
}
#models .box5 .box5r{
    font-size: 13px;
    font-weight: 400;
    margin-bottom: 15px;
}
#models .box5 .box5r > div{
    width: 40px;
    height: 40px;
    border:1px solid #000;
    border-radius: 50%;
    text-align: center;
    line-height: 40px;
    font-weight: 900;
    float: left;
    margin:0 10px 0px 0;
}
/* 下边 */
#models .box5 .box5Bottom{
    flex: 1;
    background-color: #fff;
    position: relative;
    top:-147px;
}

@media(max-width:420px){
    #models .box5 >div > div:first-child{
        margin-top:auto;
        height: auto;
    }
    #models .box5 .box5Bottom{
        top:0px;
    }
    #models .box5 .box5Models-centent{
        top:auto;
        left: auto;
    }
    #models .box5 >div > div:first-child{
        flex: 1;
    }
}
/* -------------------------------第六屏------------------------------- */
#models .box6{
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
}
#models .box6 .box6Img{
    flex:2;
    width: 100%;
    height: 100%;
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
    position: relative;
}
#models .box6 >div:last-child{
    flex:1;
}
#models .box6 .box6Models-centent{
    position: absolute;
    top:90%;
    left:75%;
}
@media(max-width:1200px){
    #models .box6 .box6Models-centent{
        left:66%;
    }
}
@media(max-width:1200px){
    #models .box6 .box6Img{
        flex: 1;
    }
}
#models .box6 .wifi{
    font-size: 35px;
}
/* -------------------------------第七屏------------------------------- */
#models .box7{
    width: 100%;
    height: 100%;
}
/* 背景图片 */
#models .box7 > div{
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
}
#models .box7 > div >div{
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
}
/* 重置组件样式 */
#models .box7 .box7Img ul{
    top:50px;
}
#models .box7 .box7Img ul div{
    font-size: 13px;
    font-weight: 500;
}
#models .box7 .box7Img ul .shu{
    background-color: #000;
}
#models .box7 .box7Img li:nth-child(3) div{
    font-size: 27px;
}
#models .box7 .box7Img li{
    color:#000;
}
#models .box7 .box7Img > div:first-child{
    flex:2;
    width: 100%;
    height: 100%;
    position: relative;
}
#models .box7 .box7Img >div:last-child{
    flex:1;
}
/* 设置图标 */
#models .box7 .box7Img .img1{
    width: 40px;
    height: 40px;
}
#models .box7 .box7Img .img2{
    margin-top:-10px;
}
#models .box7 .box7Img .img3{
    width: 65px;
    height: 39px;
    margin-right:10px;
}
@media(max-width:420px){
    #models .box7 .box7Img > div:first-child{
        flex: 1;
    }
    #models .box7 .box7Img >div:last-child{
        padding-top:60px;
    }
}
/* -------------------------------第八屏------------------------------- */
#models .box8{
    height: 100%;
    background-color: #000;
}
/* 图片 */
#models .box8 img{
    position: absolute;
    top:50%;
    transform: translate(0,-50%);
    transition: 0.5s;
    opacity: 0;
}
#models .box8 .box8Change img{
    opacity: 1;
}
/* 右边表格 */
#models .box8 table{
    color:#fff;
    margin-top:50px;
    opacity: 0;
    transition: 0.5s 0.5s;
}
#models .box8 .box8Change table{
    margin-top:30px;
    opacity: 1;
}
/* 按钮 */
#models .box8 table button{
    width: 190px;
    height: 40px;
    border-radius: 20px;
    color:#fff;
    border:3px solid rgb(121, 120, 120);
    transition: 0.3s;
    font-size: 13px;
    background-color: transparent;
}
#models .box8 table tr td{
    width: 210px;
    padding:10px 0;
    vertical-align: top;
}
#models .box8 table tr td::before{
    content: '';
    width: 30px;
    height: 1px;
    display: block;
    background-color: rgb(167, 165, 165);
    margin:15px 0 10px 0;
}
#models .box8 table tr:first-child td::before,
#models .box8 table tr:nth-child(2) td::before{
    content: '';
    width: 0px;
    height: 0px;
}
@media(max-width:420px){
    #models .box8 > div:first-child{
        display: none;
    }
    #models .box8 table button{
        width: 160px;
    }
    #models .box8 table tr td{
        padding:0 10px;
    }
}
/* -------------------------------第九屏------------------------------- */
#models .box9{
    height: 100%;
}
#models .box9 .box9Left >div{
    position: absolute;
    top:50%;
    right:10px;
    transform: translate(0,-50%);
}
#models .box9 .box9Right >div{
    position: absolute;
    top:50%;
    left:10px;
    transform: translate(0,-50%);
}
@media(max-width:576px){
    #models .box9 .box9Left >div{
        right:50%;
        top:23%;
        transform: translate(50%);
        text-align: center;
    }
}
@media(max-width:420px){
    #models .box9 .box9Right{
        display: none;
    }
}
</style>