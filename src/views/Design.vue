<template>
    <div id="design">
        <!-- 头部 -->
        <header>
            <div class="d_left">
                <router-link to='/'><img src="../assets/carType/logo.svg" alt="" width="100" height="13"></router-link>
            </div>
            <div class="d_nav_center">
                <ul>
                    <li :class="i==num?ok:''" v-for="(index,i) of DtitleArr" :key="i" @click="navBtn(i)">{{index}}</li>
                </ul>
            </div>
            <div class="d_right">
                CN
            </div>
        </header>
        <!-- 身子 -->

        <!-- ################################1.车型################################ -->
        <section v-if="num == 0">
            <!-- 左页面 -->
            <article class="s_left">
                <div class="s_l_top">
                    <i class="iconfont">&#xe719;</i>
                    <span>Model S 享受新能源汽车购置税减免政策，最高节省约8.6万</span>
                </div>
                <div class="s_l_bottom">
                    <div>
                        <img :src="s_img[num1]" alt="">
                        <Models-centent class="s_l_M">
                            <slot slot="content1Div">480 公里</slot>
                            <slot slot="content1P">续航里程 (WLTP 预估)</slot>
                            <slot slot="content2Div">241 km/h</slot>
                            <slot slot="content2P">最高时速</slot>
                            <slot slot="content3Div">3.7 秒</slot>
                            <slot slot="content3P">0-100 公里/小时 加速</slot>
                        </Models-centent>
                    </div>
                    
                </div>
            </article>
            <!-- 右页面 -->
            <article class="s_right">
                <div class="s_r_content">
                    <span>中国制造 车型选择</span>
                </div>
                <div class="s_r_content_1">
                    <div>
                        <span>后轮驱动</span>
                    </div>
                    <div>
                        <span class="s_r_c1">升级版内饰套件</span>
                    </div>
                    <div :class="0==isbor?s_r_bor:''" class="s_r_c2" @click="borBtn(Car_prices[0])">
                        <p>{{Car_name[0]}}</p>
                        <p>¥ {{Car_prices[0]}}</p>
                    </div>
                    <div>
                        <span class="s_r_c1">高级版内饰套件</span>
                    </div>
                    <div :class="1==isbor?s_r_bor:''" class="s_r_c2" @click="borBtn1(Car_prices[1])">
                        <p>{{Car_name[1]}}</p>
                        <p>¥ {{Car_prices[1]}}</p>
                    </div>
                    <div>
                        <span>双电机全轮驱动</span>
                    </div>
                    <div>
                        <span class="s_r_c1">高级版内饰套件</span>
                    </div>
                    <div :class="2==isbor?s_r_bor:''" class="s_r_c2" @click="borBtn2(Car_prices[2])">
                        <p>{{Car_name[2]}}</p>
                        <p>¥ {{Car_prices[2]}}</p>
                    </div>
                </div>
                <div class="s_r_content_2">
                    <div>
                        <p>*待监管机构批准。</p>
                        <p>包含竞速套件</p>
                    </div>
                    
                    <ul>
                        <li>19 英寸动力运动轮毂</li>
                        <li>高级制动装置</li>
                        <li>碳纤维扰流板</li>
                        <li>悬架更低</li>
                        <li>铝合金踏板</li>
                        <li>最高时速可达 261 公里每小时</li>
                        <li>赛道模式</li>
                    </ul>
                </div>
            </article> 
        </section>
        <!-- ################################2.外观##################################### -->
        <section v-else-if="num == 1">
            <!-- 左 -->
            <article class="s_left">
                <div class="s_l_bottom">
                    <div>
                        <img :src="s_A_img[num2]" alt="">
                    </div>
                </div>
            </article>
            <!-- 右 -->
            <article class="s_right">
                <div class="s_r_center">
                    <div>
                        <!-- 选择车的颜色 -->
                        <div class="s_r_c_top">
                            <div><span>选择颜色</span></div>
                            <div>
                                <ul>
                                    <li :class="i == num2?carbor:''" v-for="(index,i) of carColorArr" :key="i"  @click="carborBtn(i)"><img :src="index" alt="" width="45" height="45"></li>
                                </ul>
                            </div>
                            <div class="s_r_c_zt">
                                <span>{{s_r_c_zt1[num2]}}</span>
                                <span>{{s_r_c_zt_Money[num2]}}</span>
                            </div>
                        </div>
                        <hr>
                        <!-- 更换车轮胎 -->
                        <div class="s_r_c_bottom">
                            <div><span>选择轮毂</span></div>
                            <div>
                                <ul>
                                    <li :class="i == num3?carbor1:''" v-for="(index,i) of TireArr" :key="i" @click="carborBtn1(i)">
                                        <img :src="index" alt="" width="45" height="45">
                                    </li>
                                </ul>
                            </div>
                            <div class="s_r_c_zt">
                                <span>{{s_r_c_Tire[num3]}}</span>
                                <span>{{s_r_c_Tire_Money[num3]}}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </section>
        <!-- ################################ 3.内饰 ################################-->
        <section v-else-if="num == 2">
            <!-- 左 -->
            <article class="s_left1">
                <div class="s_r_interior_img">
                    <img :src="interior_img[num4]" alt="">
                </div>
            </article>
            <!-- 右 -->
            <article class="s_right">
                <div class="s_r_interior">
                    <!-- 选择内饰 -->
                    <div class="s_r_i_top">
                        <div><h6>选择内饰</h6></div>
                        <div>
                            <ul>
                                <li :class="i == num4?carbor1:''" v-for="(index,i) of interiorArr" :key="i" @click="carborBtn2(i)">
                                    <img :src="index" alt="">
                                </li>
                            </ul>
                        </div>
                        <div>
                            <span>{{interior_Seat[num4]}}</span>
                            <span>{{interior_Seat_Money[num4]}}</span>
                        </div>
                        <div><span>碳纤维饰板</span></div>
                    </div>
                    <!-- 套件包含: -->
                    <div class="s_r_i_bottom" >
                        <div><span>包含：</span></div>
                        <div>
                            <ul>
                                <li>专为 Tesla 超静音驾驶室定制的高级音响系统</li>
                                <li>适用于寒冷天气的功能，包括所有座椅加热、方向盘加热、雨刷除霜和清洗器喷嘴加热</li>
                                <li>HEPA 高效空气过滤系统，可有效防止病毒、细菌和异味进入车内</li>
                                <li>高级车载娱乐服务（第一年免费）:
                                    <ul>
                                        <li>包含卫星视图和实时路况显示的车载地图</li>
                                        <li>通过车载流量播放网络音乐</li>
                                        <li>通过车载流量播放网络视频</li>
                                        <li>互联网浏览器</li>
                                    </ul>
                                </li>
                                <li>通过蓝牙进行音乐和媒体播放</li>
                                <li>LED 雾灯</li>
                                <li>有色玻璃车顶，有效阻隔紫外线和红外线</li>
                                <li>自动防眩目、电动折叠、加热式侧后视镜</li>
                                <li>驾驶员偏好设置</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </article>
        </section>
        <!-- ################################ 4.付款 ################################-->
        <section v-else-if="num == 3">
            <!-- 左 -->
            <article class="s_left2">
                <div><span @click="fanhui()"><i class="iconfont">&#xe71a; &nbsp;</i> 更改配置</span></div>
                <div class="s_payment">
                    <!-- 家庭充电服务包 -->
                    <div>
                        <h6>家庭充电服务包</h6>
                        <div>
                            <img src="../assets/carType/wall_connector_v2.png" alt="" width="100" height="100">
                            <p>家庭充电是 Tesla 车辆最便捷的充电方式之一。「家庭充电服务包」是专为 Tesla 车主提供的一站式家庭充电解决方案，包含一个壁挂式充电连接器设备，电力环境勘测服务，基础安装服务和售后保障，售价为¥8,000。</p>
                        </div>
                    </div>
                    <!-- 创建账户 -->
                    <div>
                        <h6>创建账户</h6>
                        <div class="s_p_radioBox">
                            <input type="radio" name="create" id="create1"><label for="create1">个人</label>
                            <input type="radio" name="create" id="create2"><label for="create2">公司</label>
                        </div>
                    </div>
                    <!-- input -->
                    <div class="account_type_container">
                        <!-- 第一个 -->
                        <div>
                            <div class="field-container">
                                <p>名字</p>
                                <div class="a_t_c_input">
                                    <input type="text" v-model="input_name"  @blur="check_name"> 
                                </div>
                                <p class="a_t_c_right">{{NameMessage}}</p>
                            </div>
                            <div class="field-container a_t_c_Name_family">
                                <p>姓氏</p>
                                <div class="a_t_c_input">
                                    <input type="text" v-model="input_last_name" @blur="check_last_name">
                                </div>
                                <p class="a_t_c_right">{{last_name_Message}}</p>
                            </div>
                        </div>
                        <!-- 第二个 -->
                        <div>
                            <div class="field-container">
                                <p>电子邮箱</p>
                                <div class="a_t_c_input">
                                    <input type="text" v-model="input_email" @blur="check_email">
                                </div>
                                <p class="a_t_c_right">{{emailMessage}}</p>
                            </div>
                            <div class="field-container a_t_c_Name_family">
                                <p>电话</p>
                                <div class="a_t_c_input">
                                    <input type="text" v-model="input_phone" @blur="check_phone">
                                </div>
                                <p class="a_t_c_right">{{phoneMessage}}</p>
                            </div>
                        </div>
                        <!-- 第三个 -->
                        <div>
                            <div class="field-container">
                                <p>证件类型</p>
                                <div class="a_t_c_input">
                                    <select name="" id="a_t_c_select">
                                        <option value="">身份证</option>
                                        <option value="">出入境登记证</option>
                                        <option value="">护照</option>   
                                    </select>
                                    <i class="iconfont">&#xe6cc;</i>
                                </div>
                            </div>
                            <div class="field-container a_t_c_Name_family">
                                <p>身份证号</p>
                                <div class="a_t_c_input">
                                    <input type="text" v-model="input_id_card" @blur="check_id_card">
                                </div>
                                <p class="a_t_c_right">{{id_card_Message}}</p>
                            </div>
                        </div>
                        <!-- input结束 -->
                    </div>
                    <!-- 提车地点 -->
                    <div>
                        <h6>提车地点</h6>
                        <p>请选择离您最近的提车地点</p>
                        <select id="a_t_c_select">
                            <option value="">选择地点</option>
                            <option value="">北京</option>
                        </select>
                    </div>
                    <!-- 付款 -->
                    <div>
                        <h6>付款</h6>
                        <p>下单购买 Model S 的第一笔付款金额为 ¥ 1,000。该笔付款不可退款，不可转让。支付第一笔付款后，特斯拉工作人员会与您联系并安排后续事宜。提车前您可以随时更改订单的配置方案，请注意订单价格和交付日期也会随之改变。</p>
                    </div>
                    <!-- 付款方式 -->
                    <div class="Method_payment">
                        <div :class="index == num5?Method:''" v-for="(elem,index) of Method_payment" :key="index" v-html="elem" @click="Method_payment1(index)"></div>
                    </div>
                    <div>
                        <p>{{Method_payment5[num5]}}</p>
                    </div>
                </div>
            </article>
            <!-- 右 -->
            <article class="s_right">
                <div><img src="../assets/carType/Whitecar.png" alt="" width="380" height="215"></div>
                <div  class="s_ModelS">
                    <h4>您的 Model S</h4>
                    <p>预计交付日期：2021年3月</p>
                    <p>具体交付日期根据车辆配置和提车地点会有所差异</p>
                </div>
                <!-- 概要 -->
                <div>
                    <div><span>概要</span></div>
                    <div>
                        <ul>
                            <li><span>狂暴模式</span><span v-show="s_r_Details==true">包括</span></li>
                            <li><span>Model S Performance 高性能版</span><span v-show="s_r_Details==true">¥ 833,900</span></li>
                            <li><span>珍珠白（多涂层）车漆</span><span v-show="s_r_Details==true">包括</span></li>
                            <li><span>19 英寸银色轮毂</span><span v-show="s_r_Details==true">包括</span></li>
                            <li><span>黑白高级内饰（白色座椅，碳纤维饰板）</span><span v-show="s_r_Details==true">包括</span></li>
                            <li><span>基础版辅助驾驶功能</span><span v-show="s_r_Details==true">包括</span></li>
                        </ul>
                    </div>
                    <div>
                        <p @click="xs()" style="cursor: pointer;">显示详情</p>
                        <p></p>
                    </div>
                </div>
            </article>
        </section>
        <!-- 底部 -->
        <footer>
           <Calculator ref='calculator'></Calculator>
        </footer>
    </div>
</template>
<script>
export default {
    data(){
        return{
            num: 0,
            num1: 0,
            DtitleArr:['1.车型','2.外观','3.内饰','4.付款'],
            // 1.车型
            carColorArr:[require("../assets/carType/ui_swat_col_ppsw.png"),require("../assets/carType/ui_swat_col_pbsb.png"),require("../assets/carType/ui_swat_col_pmng.png"),require("../assets/carType/ui_swat_col_ppsb.png"),require("../assets/carType/ui_swat_col_ppmr.png")],
            TireArr:[require('../assets/carType/ui_swat_whl_wtas.png'),require('../assets/carType/ui_swat_whl_wttc.png')],
            Car_name:['标准续航版','长续航升级版','Performance 高性能版'],
            Car_prices:[507900,733900,833600],
            ok:{ok:true},
            s_r_bor:{s_r_bor:true},
            isbor: 0,  //车型右类名
            s_img:[require('../assets/carType/Whitecar.png'),require('../assets/carType/Whitecar2.png'),require('../assets/carType/Whitecar1.png')],
            // 2.外观
            num2:0, //车的颜色
            carbor:{carbor:true},
            s_A_img:[require('../assets/carType/Whitecar1.png'),require('../assets/carType/Whitecar2.png'),require('../assets/carType/Whitecar3.png'),require('../assets/carType/Whitecar4.png'),require('../assets/carType/Whitecar5.png')],
            s_r_c_zt1:['珍珠白（多涂层）','纯黑色','冷光银','深海蓝','中国红（多涂层）'],
            s_r_c_zt_Money:['包括','包括','包括','包括','包括'],
            num3:0, //车轮胎
            carbor1:{carbor1:true},
            s_r_c_Tire:['18 英寸动力轮毂','19 英寸银色轮毂'],
            s_r_c_Tire_Money:['包括','9900'],
            // 3.内饰
            num4:0,
            interior_img:[require('../assets/carType/ModelxCustomized/compositor_aSH_black6.jpg'),require('../assets/carType/ModelxCustomized/compositor_oak6.jpg'),require('../assets/carType/ModelxCustomized/compositor_aSH_white7.jpg')],
            interiorArr:[require('../assets/carType/ModelxCustomized/X_ui_bundle_black.png'),require('../assets/carType/ModelxCustomized/X_ui_bundle_cream.png'),require('../assets/carType/ModelxCustomized/X_ui_bundle_white.png')],
            
            interior_Seat:['纯黑色内饰（黑色座椅）','浅米色','黑白内饰（白色座椅）'],
            interior_Seat_Money:['包括','包括','包括'],
            // 4.付款
            Method_payment:[
                '<i>银联POS通</i>',
                `<img src='${require("../assets/carType/yinlian.svg")}'>`,
                `<img src='${require("../assets/carType/weixin.png")}'>`,
                `<img src='${require('../assets/carType/zfb.svg')}'>`
            ],
            num5:0,
            Method:{Method:true},
            Method_payment5:['提交订单后，请前往 Tesla 账户查看您的付款二维码，并在 Tesla 门店内刷卡支付。','暂不支持','提交订单后，页面将跳转至支付宝网站。请完成付款后返回 Tesla 账户查看订单状态。','提交订单后，请在页面弹出框中查看并通过微信扫描付款二维码。支付成功后请前往 Tesla 账户查看订单状态。'],
            //显示详情
            s_r_Details:false,
            //input验证
            input_name:'',
            input_last_name:'',
            input_email:'',
            input_phone:'',
            input_id_card:'',
            //提示信息
            NameMessage:'',
            last_name_Message:'',
            emailMessage:'',
            phoneMessage:'',
            id_card_Message:'',
        }
    },
    methods:{
        navBtn(index){
            this.num = index;
            this.$refs.calculator.i = index;
            this.$refs.calculator.num = index;
        },
        borBtn(newCashPrice){
            this.isbor = 0;
            this.num1 = 0;
            this.$refs.calculator.newCashPrice(newCashPrice)
        },
        borBtn1(newCashPrice){
            this.isbor = 1;
            this.num1 = 1;
            this.$refs.calculator.newCashPrice(newCashPrice)
        },
        borBtn2(newCashPrice){
            this.isbor = 2;
            this.num1 = 2;
            this.$refs.calculator.newCashPrice(newCashPrice)
        },
        carborBtn(index){
            this.num2 = index;
        },
        carborBtn1(index){
            this.num3 = index;
        },
        carborBtn2(index){
            this.num4 = index;
        },
        // 4.付款

        Method_payment1(i){
            this.num5 = i;
        },
        // 显示详情
        xs(){
            this.s_r_Details = !this.s_r_Details
        },
        // 4.付款-更改配置返回第一页
        fanhui(){
            this.num = 0
            this.navBtn(0);
        },
        //input内容为空,失去焦点验证 
        check_name(){
            let nameReg = /^[A-Za-z]{2,15}$/i;
            let name = this.input_name;
            if(name){
                if(nameReg.test(name)){
                    this.NameMessage = "";
                }else{
                    this.NameMessage = "请输入2-15位英文字母"
                }
            }else{
                this.NameMessage = "内容不可为空"
            };
        },
        check_last_name(){
            let last_nameReg = /^[A-Za-z]{2,15}$/i;
            let last_name = this.input_last_name;
            if(last_name){
                if(last_nameReg.test(last_name)){
                    this.last_name_Message = "";
                }else{
                    this.last_name_Message = "请输入2-15位英文字母"
                }
            }else{
                this.last_name_Message = "内容不可为空"
            };
        },//电话号码格式不正确电子邮件地址无效
        check_email(){
            // if(!this.input_email){
            //     this.emailMessage = '内容不可为空'//姓名包含无效字符
            // }
            let emailReg = /^\w+@\w+\.\w+(\.cn)?$/;
            let email = this.input_email;
            if(email){
                if(emailReg.test(email)){
                    this.emailMessage = "";
                }else{
                    this.emailMessage = "请输入正确的邮箱"
                }
            }else{
                this.emailMessage = "内容不可为空"
            };
        },
        check_phone(){
            // if(!this.input_phone){
            //     this.phoneMessage = '内容不可为空'//姓名包含无效字符
            // }
            let phoneReg = /^1\d{10}$/;
            let phone = this.input_phone;
            if(phone){
                if(phoneReg.test(phone)){
                    this.phoneMessage = "";
                }else{
                    this.phoneMessage = "请输入正确的手机号"
                }
            }else{
                this.phoneMessage = "内容不可为空"
            };
        },
        check_id_card(){
            let id_card_Reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
            let id_card = this.input_id_card;
            if(id_card){
                if(id_card_Reg.test(id_card)){
                    this.id_card_Message = "";
                }else{
                    this.id_card_Message = "请输入正确的身份证"
                }
            }else{
                this.id_card_Message = "内容不可为空"
            };
        }
    },
    computed:{
    }

}
</script>
<style>
html,
body,
#app{
  height: 100%;
  margin: 0;
  padding: 0;
}

/* 头部导航 */
#design header{
    position: relative;
    display: flex;
    border: 1px solid #dfdfdf;
}
#design header > div{
    flex-direction: row;
    flex-grow: 1;
    align-content: center;
}
#design .d_left{
    padding: 20px 0;
    width: 120px;
    margin-left: 50px;
}
#design .d_nav_center{
    width: 1430px;
}
#design .d_nav_center ul{
    display: flex;
    text-align: center;
    align-content: center;
}
#design .d_nav_center li{
    padding: 20px 0;
    flex-grow: 1;
    cursor: pointer;
    color: #c3baba;
    border-bottom: 3px solid transparent;
}
#design .d_nav_center .ok{
    color: #000;
    border-bottom: 3px solid #007fff;
}
#design .d_right{
    width: 200px;
    margin-right: 23px;
    padding: 20px 0;
    display: flex;
    font-weight: bold;
    justify-content: flex-end;
}
/* 身子左边 */
/* 1.车型 */

#design section{
    position: absolute;
    left: 0;
    width: 100%;
    height: 83%;
    display: flex;
}
#design .s_left{ 
    overflow: hidden;
    border-right: 1px solid #dfdfdf;
}
#design .s_left .s_l_top{
    width: 465px;
    display: flex;
    background-color: #e8e8e8;
    padding: 5px 15px;
    border-radius: 6px;
    margin: 0px auto;
    margin-top: 10px;
}
#design .s_left .s_l_bottom{
    position: relative;
}
#design .s_left .s_l_top i{
    margin-right: 10px;
    color: rgb(62, 106, 224);
}
/*组件*/
#design .s_left .s_l_M ul{
    position: absolute;
    bottom: 87px;
    display:flex;
    justify-content: center;
}
#design .s_left .s_l_M ul li{
    text-align: center;
    color: #000;
}
#design .s_left .s_l_M ul li{
    opacity: 1;
}
#design .s_left .s_l_M ul li>div{
    font-size: 34px;
}
#design .s_left .s_l_M ul li>p{
    font-size: 16px;
    color: #666;
}
#design .s_left .s_l_M ul .shu{
    background-color: #ddd;
    width: 1px;
    height: 72px;
}

/* 身子右边 */
#design .s_right{
    max-width: 477px;
    width: 100%;
    padding: 50px;
    overflow: scroll;
    color: #000;
}
#design .s_right .s_r_content span{
    font-size: 20px;
}
#design .s_right .s_r_content_1{
    margin: 20px 0 10px;
}
#design .s_right .s_r_content_1 div{
    margin-bottom: 15px;
}
#design .s_right .s_r_content_1 .s_r_c1{
    color: #c1c1c1;
    font-size: 13px;
    padding-bottom: 4px;
    border-bottom: 1px solid #c1c1c1;
    transition: all .5s;
}
#design .s_right .s_r_content_1 .s_r_c1:hover{
    border-bottom: 2px solid #000;
    color: #000;
}
#design .s_right .s_r_content_1 .s_r_c2{
    border: 2px solid #ddd;
    border-radius: 25px;
    padding: 16px 20px 5px;
    cursor: pointer;
}
#design .s_right .s_r_content_1 .s_r_bor{
    border: 2px solid rgb(62, 106, 224);
}
#design .s_right .s_r_content_1 .s_r_c2{
    display: flex;
    justify-content: space-between;
    font-size: 15px;
}
#design .s_right .s_r_content_1 .s_r_c2>p:nth-child(2){
    margin-left: 30px;
    color: #666;
}
#design .s_right .s_r_content_2 div > p:nth-child(1){
    font-size: 12px;
}
#design .s_right .s_r_content_2 div > p:nth-child(2){
    margin: 10px 0;
    font-size: 12px;
}
#design .s_right .s_r_content_2 ul li{
    list-style: disc;
    color: #666;
    margin-left: 40px;
    padding: 5px 0px;
    font-size: 14px;
}
/* 2.外观 */
#design .s_right .s_r_center{
    margin: 200px 20px;
}
/* 选择车的颜色 */
#design .s_right .s_r_center .s_r_c_top > div{
    margin-bottom: 10px;
}
#design .s_right .s_r_center .s_r_c_top div:nth-child(1){
    font-size: 20px;
}
#design .s_right .s_r_center .s_r_c_top div:nth-child(3)>span:nth-child(2){
    text-align: right;
}
#design .s_right .s_r_center .s_r_c_top ul{
    display: flex;
}
#design .s_right .s_r_center .s_r_c_top ul li{
    margin-right: 10px;
    padding: 5px;
    margin: 0px;
    border: 2px solid transparent;
}
#design .s_right .s_r_center .s_r_c_top li.carbor{
    border-radius: 50%;
    border: 2px solid rgb(0, 127, 255);
}
/* 更换车轮胎 */
#design .s_right .s_r_center .s_r_c_bottom ul{
    display: flex;
}
#design .s_right .s_r_center .s_r_c_bottom > div{
    margin-bottom: 10px;
}
#design .s_right .s_r_center .s_r_c_bottom div:nth-child(1){
    font-size: 20px;
}
#design .s_right .s_r_center .s_r_c_bottom ul li{
    margin-right: 20px;
    padding: 5px;
    border: 2px solid transparent;
}

#design .s_right .s_r_center div .s_r_c_zt{
    display: flex;
    justify-content: space-between;
}
#design .s_right .s_r_center .s_r_c_bottom li.carbor1{
    border-radius: 50%;
    border: 2px solid rgb(0, 127, 255);
}
/* 3.内饰 */
#design .s_left1{
    width: 122%;
}
#design .s_r_interior_img{
    width: 100%;
    height: 100%;
}
#design .s_r_interior_img img{
    width: 100%;
    height: 100%;
}
#design .s_r_interior .s_r_i_top div{
    margin-top: 10px;
}
#design .s_r_interior .s_r_i_top div:nth-child(2) ul{
    display: flex;
}
#design .s_r_interior .s_r_i_top div:nth-child(2) ul li{
    margin-right: 10px;
    padding: 5px;
    border: 2px solid transparent;
}
#design .s_r_interior .s_r_i_top div:nth-child(2) ul li.carbor1{
    border-radius: 50%;
    border: 2px solid rgb(0, 127, 255);
}
#design .s_r_interior .s_r_i_top div:nth-child(3){
    display: flex;
    justify-content: space-between;
}
#design .s_r_interior .s_r_i_top div:nth-child(4) span{
    font-size: 14px;
    color: #666;
}
#design .s_r_interior .s_r_i_bottom div{
    margin-top: 10px;
}
#design .s_r_interior .s_r_i_bottom div:nth-child(2) ul li{
    list-style: disc;
    color: #666;
    margin-left: 40px;
    padding: 5px 0px;
    font-size: 14px;
}
#design .s_r_interior .s_r_i_bottom div:nth-child(2) ul li>ul li{
    list-style: circle;
}
/*  4.付款  */

#design .s_left2{
    background: rgb(244, 244, 244);
    overflow: scroll;
    border-right: 1px solid #dfdfdf;
}
#design .s_left2 > div:nth-child(1){
    margin: 7px 119px;
    color: #999;
}
#design .s_left2 > div:nth-child(1) span{
    cursor: pointer;
}
#design .s_left2 .s_payment{
    margin: 10px 200px;
}
#design .s_left2 .s_payment h6{
    font-size: 18px;
} 
/* 家庭充电服务包 */
#design .s_left2 .s_payment>div:nth-child(1){
    margin-top: 40px;
    border-bottom: 3px solid #ccc;
}
#design .s_left2 .s_payment>div:nth-child(1) div{
    display: flex;
    margin: 25px 0 50px;
}
#design .s_left2 .s_payment>div:nth-child(1) div p{
    margin-left: 27px;
    margin-top: 20px;
    color: #666;
}
#design .s_left2 .s_payment>div h6{
    margin-top: 20px;
    margin-bottom: 20px;
}
/* 创建账户 */
#design .s_left2 .s_payment>div:nth-child(2){
    border-bottom: 3px solid #ccc;
}
#design .s_left2 .s_payment .s_p_radioBox{
    margin-bottom: 30px;
}
#design .s_left2 .s_payment .s_p_radioBox input{
    width: 20px;
    height: 20px;
    margin-top: 2px;
    margin-right: 10px;
}
#design .s_left2 .s_payment .s_p_radioBox label{
    margin-right: 10px;
    vertical-align: top;
}
/* 用户登记 */
#design .s_left2 .s_payment .account_type_container{
    border-bottom: 3px solid #ccc;
    padding-bottom: 17px;
}
#design .s_left2 .s_payment .account_type_container>div{
    width: 100%;
    display: flex;
}
#design .s_left2 .s_payment .field-container{
    margin-right: 10px;
    flex: 0 0 50%;
    height: 112px;
}
#design .s_left2 .s_payment .field-container p{
    margin: 7px 0;
}
#design .s_left2 .s_payment .field-container .a_t_c_right{
    text-align: right;
    color: #b74134;
}
#design .s_left2 .s_payment .field-container .a_t_c_input input{
    width: 100%;
    height: 40px;
    border: 2px solid transparent;
    outline: none;
    border-radius: 20px;
    padding-left: 20px;
}
#design .s_left2 .s_payment .field-container .a_t_c_input input:focus{
    border: 2px solid #b74134;
}
#design .s_left2 .s_payment .field-container #a_t_c_select{
    width: 100%;
    height: 40px;
    border-radius: 20px;
    padding: 0 20px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}
#design .s_left2 .s_payment .field-container .a_t_c_input{
    position: relative;
}
#design .s_left2 .s_payment .field-container .a_t_c_input i{
    position: absolute;
    right: 20px;
    top: 7px;
    font-weight: bold;
}
/* 提车地点 */
#design .s_left2 .s_payment div:nth-child(4) p{
    margin-left: 30px;
    margin-bottom: 20px;
}
#design .s_left2 .s_payment div:nth-child(4) select{
    width: 100%;
    height: 30px;
    padding: 4px 20px;
    border: none;
    margin-bottom: 30px;
}
/* 支付方式 */
#design .s_left2 .s_payment .Method_payment{
    display: flex;
    margin-top: 20px;
    margin-bottom: 30px;
}
#design .s_left2 .s_payment .Method_payment div{
    flex: 0 50%;
    width: 50%;
    height: 50px;
    margin-right: 10px;
    text-align: center;
    line-height: 40px;
    border-radius: 40px;
    border: 2px solid #c7c7c7;
}
#design .s_left2 .s_payment .Method_payment .Method{
    border: 2px solid #666;
}
#design .s_left2 .s_payment .Method_payment img{
    width: 120px;
    height: 30px;
}
#design .s_left2 .s_payment div:nth-child(7){
    margin-bottom: 50px;
}
/* 您的 Model S */
#design .s_right .s_ModelS{
    text-align: center;
}
#design .s_right>div:nth-child(2) h4{
    margin-bottom: 10px;
}
#design .s_right>div:nth-child(2) p{
    margin-bottom: 10px;
    font-size: 13px;
}
#design .s_right>div:nth-child(3) div{
    margin-top: 10px;
}
#design .s_right>div:nth-child(3) div:nth-child(1){
    padding-bottom: 10px;
    margin-top: 30px;
    border-bottom: 1px solid #ccc;
}
#design .s_right>div:nth-child(3) div:nth-child(2) ul li{
    margin-bottom: 10px;
    color: #666;
    display: flex;
    justify-content: space-between;
}

/*  */
/* 尾部 */
#design footer{
    width: 100%;
    height: 100px;
    position: fixed;
    bottom: 0px;
}
@media(max-width:1500px){
    #design .s_left .s_l_M ul {
        position: absolute;
        bottom: -10px;
    }
}
@media(max-width:1100px){
    #design .s_left .s_l_M ul {
        position: absolute;
        bottom: -90px;
    }
    #design .s_left2 > div:nth-child(1) {
        margin: 7px 19px;
    }
    #design .s_left2 .s_payment {
        margin: 10px 67px;
    }
}
@media(max-width:510px){
    #design .d_left {
        width: 366px;
        margin-left: 10px;
    }
    #design section{
        display: block;
    }
    #design .s_right{
        overflow: hidden;
    }
    #design .s_left .s_l_M ul{
        position: absolute;
        bottom: 0px;
        display:flex;
        justify-content: center;
    }
    #design .s_left .s_l_M ul li>div{
        font-size: 24px;
    }
    #design .s_left .s_l_M ul .shu{
        background-color: #ddd;
        width: 1px;
        height: 32px;
    }
    #design .s_right{
        margin-bottom: 80px;
    }
    /* 1.车型 */
    #design .s_left .s_l_top {
        width: 96%;
        margin: 0px 5px;
        margin-top: 10px;
    }
    /* 2.外观 */
    #design .s_right .s_r_center {
        margin: -27px 20px;
    }
    #design .s_right .s_r_center .s_r_c_top ul {
        width: 281px;
    }
    /* 3.内饰 */
    #design .s_left1 {
        width: 100%; 
    }
    /* 4.付款 */
    #design .s_left2 > div:nth-child(1) {
        margin: 7px 26px;
        color: #999;
    }
    #design .s_left2 .s_payment {
        margin: 10px 38px;
    }
    #design .s_left2 {
        overflow: hidden;
    }
    #design .s_left2 .s_payment .Method_payment img {
        width: 59px;
        height: 20px;
    }
    #design .s_left2 .s_payment .Method_payment {
        display: block;
    }
    #design .s_left2 .s_payment .Method_payment div {
        width: 100%;
        margin-bottom: 10px;
    }
    #design .s_left2 .s_payment .account_type_container>div {
        display: block;
    }
    /* 底部 */
    footer .calculator > div:first-child >div {
        display: none;
    }
    footer .calculator > div:first-child >div:last-child {
        display: block;
    }
    footer .calculator > div:first-child >div:last-child {
        right: 27px;
    }
}
</style>