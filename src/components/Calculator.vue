<template>
    <div class="calculator">
        <div>
            <!-- 选择付款方式 -->
            <div>
                <select v-model="bottomP">
                    <option value="d1">现金</option>
                    <option value="d2">合作金融机构贷款</option>
                    <option value="d3">合作金融机构租赁</option>
                </select>
            </div>
            <div class="shu"></div>
            <!-- 减去预估节省费用 -->
            <div>
                <h4>¥{{cashPrice1}}</h4>
                <p>减去预估节省费用</p>
            </div>
            <!-- 实际价格 -->
            <div>
                <h4>¥{{cashPrice2}}</h4>
                <p>实际价格</p>
            </div>
            <!-- 付款计算器 -->
            <div>
                <p @click="open">付款计算器</p>
            </div>
            <div class="shu"></div>
            <!-- 预交付 -->
            <div>
                <p>预计交付日期：4至6周</p>
                <p>具体交付日期根据车辆配置和提车地点会有所差异</p>
            </div>
            <!-- 提交订单按钮 -->
            <div>
                <button v-if="num == 0" @click="x_btn">下一步</button>
                <button v-else-if="num == 1" @click="x_btn">下一步</button>
                <button v-else-if="num == 2" @click="x_btn">下一步</button>
                <button v-else-if="num == 3" @click="x_btn">提交订单</button>
            </div>
        
        </div>
        <div v-show="show">
            <div>
                <!-- 左边 -->
                <div class="left">
                    <div>
                        <img src="../assets/c9abbe5e35fca010e7aaeac462d8342.png" alt="">
                    </div>
                    <div>
                        <div :class="i==num?ok:''" v-for='(elem,i) of leftArr' :key='i' @click='leftBtn(i)'>{{elem}}</div>
                    </div>
                </div>
                <!-- 右边 -->
                <div class="right">
                    <div class="x" @click="close">
                        <i class="iconfont">&#xe61a;</i>
                    </div>
                    <!-- 页面1 -->
                    <div v-if='num == 0'>
                        <div class="top">
                            <h5 :class="num1==i?rightOk:''" v-for='(elem,i) of rightArr' :key='i' @click='rightBtn(i)'>{{elem}}</h5>
                        </div>
                        <div class="bottom">
                            <!-- 现金支付 -->
                            <div class="rightNum1" v-if="num1==0">
                                <div>
                                <p>现金价格</p>
                                <h4>¥{{cashPrice}}</h4>
                                </div>
                                <div>
                                    <div>价格包含估算增值税及预估关税</div>
                                    <div>预估购置税减免金额: ¥ 64,947</div>
                                    <div>
                                        <div>预估燃油费节省金额</div>
                                        <div>- ¥ 55,000</div>
                                    </div>
                                    <div>
                                        <div>价格 减去预估节省费用</div>
                                        <div>¥ 678,900</div>
                                    </div>
                                </div>
                            </div>
                            <!-- 合作金融机构贷款 -->
                            <div class="rightNum2" v-else-if="num1==1">
                                <p>通过 Tesla 合作银行贷款购车。支付一定首付后，每月分期付款，直至付清全部车款。</p>
                                <div class="inputBox">
                                    <div class="num2Input">
                                        <p>首付比例 %</p>
                                        <select v-model="proportion">
                                            <option value="15">15 %</option>
                                            <option value="20">20 %</option>
                                            <option value="30">30 %</option>
                                            <option value="40">40 %</option>
                                            <option value="50">50 %</option>
                                        </select>
                                    </div>
                                    <div class="num2Input">
                                        <p>期数</p>
                                        <select v-model="month">
                                            <option value="12">12 个月</option>
                                            <option value="24">24 个月</option>
                                            <option value="36">36 个月</option>
                                            <option value="48">48 个月</option>
                                            <option value="60">60 个月</option>
                                        </select>
                                    </div>
                                    <div class="num2Input">
                                        <p>贷款金额</p>
                                        <input type="text" readonly :value="`¥${loanAmount}`">
                                    </div>
                                    <div class="num2Input">
                                        <p>年化费率 %</p>
                                        <input type="text" readonly value="4.33%">
                                    </div>
                                </div>
                                <!-- 贷款月供 -->
                                <div class="monthly">
                                    <div>
                                        <p>贷款月供</p>
                                        <h4>¥ {{contribution}} /月</h4>
                                    </div>
                                    <div>
                                        <p>合作金融机构贷款 减去预估节省费用</p>
                                        <p>¥ 49,481 /月</p>
                                    </div>
                                </div>
                                <div class="tips">以上计算结果仅供参考，最终贷款额度及费率以合作银行出具的书函，及贷款人与合作银行签署的贷款合同为准。</div>
                            </div>
                            <!-- 合作融资租赁机构 -->
                            <div class="rightNum2 rightNum3" v-else-if="num1==2">
                                <p>通过 Tesla 合作融资租赁机构购车。支付保证金后，每月分期付款并获得车辆使用权，租赁期满后支付残值并获得车辆所有权。</p>
                                <div class="inputBox">
                                    <div class="num2Input">
                                        <p>保证金比例 %</p>
                                        <select>
                                            <option value="d30">30 %</option>
                                        </select>
                                    </div>
                                    <div class="num2Input">
                                        <p>期数</p>
                                        <select v-model="periods">
                                            <option value="12">12 个月</option>
                                            <option value="24">24 个月</option>
                                            <option value="36">36 个月</option>
                                        </select>
                                    </div>
                                    <div class="num2Input">
                                        <p>融资金额</p>
                                        <input type="text" readonly :value="`¥${cashPrice}`">
                                    </div>
                                    <div class="num2Input">
                                        <p>年化费率 %</p>
                                        <input type="text" readonly value="4.33%">
                                    </div>
                                </div>
                                <!-- 租赁月供 -->
                                <div class="monthly">
                                    <div>
                                        <p>租赁月供</p>
                                        <h4>¥ {{rent}} /月</h4>
                                    </div>
                                    <div>
                                        <p>合作金融机构租赁 减去预估节省费用</p>
                                        <p>¥ 21,915 /月</p>
                                    </div>
                                </div>
                                <div class="tips">以上计算结果仅供参考，最终融资额度及费率以申请人与融资租赁机构签订的协议为准。</div>
                            </div>
                        </div>
                    </div>
                    <!-- 页面2 -->
                    <div v-else-if="num == 1" class="right2">
                        <div class="top">
                            <h4>预估燃油费节省金额</h4>
                        </div>
                        <div class="bottom">
                            <div>
                                <div class="bottomInput">
                                    <p>行驶里程</p>
                                    <div>
                                        <span>
                                            <input type="text" v-model='valKilometre' maxlength='7'>
                                            <span>公里/年</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="bottomInput">
                                    <p>燃油价格</p>
                                    <div>
                                        <span>
                                            <input type="text" v-model='valLitre' maxlength='7'>
                                            <span>/公升</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <!-- 节省的费 -->
                            <div>
                                <p>估算<b>3</b> 年能够节省的费用约为 ¥ {{zong}}</p>
                            </div>
                            <div>
                                <p>相比传统燃油汽车，纯电动车的能耗费用要便宜很多。普通家用车平均每年的行驶里程大约为 20,000 公里，每年的燃油费约为 ¥ 13,000 。相比之下，Model S 行驶相同距离的电费开销仅需 7 分之一。如果换车周期为 5 年，则估算 5 年能够节省的费用约为 ¥ 55,000。</p>
                                <p>我们假设同级别燃油轿车的百公里油耗为 10.0 升，并且假设未来 5 年的平均油价为 ¥ 6.50/升，家庭用电价格为 ¥ 0.50/度，车辆使用家庭充电桩充电。</p>
                            </div>
                        </div>
                    </div>
                    <!-- 页面3 -->
                    <div v-else-if="num == 2" class="num2">
                        <h4>新能源车激励政策</h4>
                        <div>
                            <p>Tesla 纯电动车在全国部分省市享受新能源汽车牌照政策和差异化鼓励政策。</p>
                            <p>【北京】Tesla 享有免费新能源车牌照，可以参加新能源牌照指标轮候配置。不受工作日高峰时段或者重污染红色预警区域限行措施限制，在全市每周每天24小时均可上路行驶。</p>
                            <p>【上海】Tesla 享有免费新能源车牌照，无需竞拍。</p>
                            <p>【杭州】Tesla 享有免费新能源车牌照，无需摇号，无需竞拍。不受市区“错峰限行”和西湖景区“单双号”限行措施的限制（浙A号牌）。</p>
                            <p>【广州】Tesla 享有免费新能源车牌照，无需摇号，无需竞拍。</p>
                            <p>【深圳】Tesla 享有免费新能源车牌照，无需摇号，无需竞拍。</p>
                            <p>【成都】Tesla 不受汽车尾号限行措施限制，工作日可在实行尾号限行区域内的所有道路上通行（新能源号牌）。</p>
                        </div>
                        <div>
                            <p>根据工信部发布《新能源汽车推广应用推荐车型目录》，部分 Model 3 在售车型享受新能源汽车补贴政策。</p>
                            <p>根据最新公布的《免征车辆购置税的新能源汽车车型目录》，部分 Tesla 在售车型享受购置税减免政策。</p>
                            <p><router-link to="/">了解更多 › </router-link></p>
                        </div>
                    </div>
                </div>   
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            num:0,
            num1:0,
            show:false,
            leftArr:['金融服务','预估燃油费节省金额','新能源车激励政策'],
            rightArr:['现金','合作金融机构贷款','合作金融机构租赁'],
            ok:{ok:true},
            rightOk:{rightOk:true},
            // 底部导航计算器
            bottomP:'d1',
            bottomFn:'',
            // 页面1 
            loan:'',
            cashPrice:733000,  //现金价格
            cashPrice1:'',  //底部价格
            cashPrice2:'',  //底部价格

            loanAmount:'',     //贷款金额
            proportion:'15',   //首付比例
            month:'12',        //期数
            contribution:'',   //月供

            periods:'12',      //期数
            rent:'',           //月租
            // 页面2
            valKilometre:20000,
            valLitre:6.50,
            zong:41973,

            i:0,
        }
    },
    methods:{
        newCashPrice(newCashPrice){
            this.cashPrice = newCashPrice;
            this.bottomFn();
        },
        leftBtn(index){
            this.num = index;
        },
        rightBtn(index){
            this.num1 = index;
        },
        // 关闭 计算器
        close(){
            this.show = false;
        },
        //打开 计算器
        open(){
            this.show = true;
        },

        x_btn(){
            this.i++;
            if(this.i < 4){
                this.num++;
                this.$parent.navBtn(this.i)
            }else{
                alert('未上线不可提交')
            }
        }
    },
    watch:{
        // 底部导航计算器
        bottomP(){
            this.bottomFn();
        },
        // 页面1
        proportion(){
            this.loan()
        },
        month(){
            this.loan()
        },
        periods(){
            this.loan()
        },
        // 页面2
        valKilometre(){
            this.zong=parseInt(((this.valKilometre * this.valLitre) - (this.valKilometre * 0.092)) * 3 / 9.16);
        },
        valLitre(){
            this.zong=parseInt(((this.valKilometre * this.valLitre) - (this.valKilometre * 0.092)) * 3 / 9.16);
        }
    },
    beforeMount(){
        this.cashPrice = this.$parent.Car_prices[0]
    },
    mounted(){
        this.loan = ()=>{
            // 贷款金额
            this.loanAmount = this.cashPrice - (this.cashPrice * this.proportion / 100);
            // 每月应还
            this.contribution = parseInt(this.loanAmount / this.month);
            // 租金 月供
            this.rent = parseInt(this.cashPrice / this.periods);
        }
        this.loan();
        this.bottomFn = ()=>{
            if(this.bottomP == 'd1'){
                this.cashPrice1 = this.cashPrice - 300;
                this.cashPrice2 = this.cashPrice;
            }else if(this.bottomP == 'd2'){
                this.cashPrice1 = this.contribution - 300;
                this.cashPrice2 = this.contribution;
            }else if(this.bottomP == 'd3'){
                this.cashPrice1 = this.rent - 300;
                this.cashPrice2 = this.rent;
            }
        };
        this.bottomFn();
        
    }
}
</script>

<style>
/* 整个盒子样式 */
.calculator > div:first-child{
    height: 100px;
    background-color: rgb(54, 54, 54);
    display: flex;
    padding:5px 50px;
    position: relative;
}
/* 盒子里div布局 */
.calculator > div:first-child >div{
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin:0 10px; 
}
/* 字体大小 */
.calculator > div:first-child >div h4{
    font-size: 20px;
}
.calculator > div:first-child >div p{
    font-size: 13px;
}
/* 字体颜色 */
.calculator > div:first-child select,
.calculator > div:first-child{
    color:rgb(221, 217, 217)
}
/* 付款计算器 */
.calculator > div:first-child >div:nth-child(5) p{
    border-bottom:1px solid rgb(221, 217, 217);
    cursor:pointer;
}
/* 下拉菜单样式 */
.calculator > div:first-child select{
    border:0;
    text-align: center;
    background-color: rgb(54, 54, 54);
}
/* 竖线 */
.calculator > div:first-child >.shu{
    width: 1px;
    height: 90px;
    background-color: rgb(129, 128, 128);
    margin:0 50px;
}
/* 提交订单按钮 */
.calculator > div:first-child >div:last-child{
    position: absolute;
    right:50px;
    top:50%;
    transform: translate(0,-50%);
}
.calculator > div:first-child >div:last-child button{
    width: 300px;
	height: 40px;
	border-radius: 25px;
	border:0;
	background-color: #0066FF;
	color:#fff;
	font-size: 13px;
    transition: 0.3s;
	cursor:pointer
}
.calculator > div:first-child >div:last-child button:hover{
    background-color: rgb(32, 93, 223);
}
/* 计算器弹出框 */
/* 遮盖层 */
.calculator > div:last-child{
    width: 100%;
    height: 100%;
    position: fixed;
    top:0;
    left:0;
    background-color: rgba(0, 0, 0, 0.5)
}
/* 弹出框 */
.calculator > div:last-child > div{
    width: 60%;
    min-width: 600px;
    height: 70%;
    min-height: 400px;
    position: absolute;
    top:50%;
    left:50%;
    transform: translate(-50%,-50%);
    display: flex;
    border-radius: 10px;
    overflow: hidden;
}
/* 左边 */
.calculator > div:last-child .left{
    flex:1;
    background-color: #fff;
}
.calculator > div:last-child .left > div:first-child{
    padding-bottom:30px;
    border-bottom:1px solid rgb(167, 164, 164);
    padding:30px;
}
.calculator > div:last-child .left > div:first-child img{
    width: 50px;
}
.calculator > div:last-child .left > div:last-child div{
    padding:15px 0 15px 15px;
    border-right:4px solid transparent;
    margin-top:10px;
    color:#999;
    cursor:pointer
}
/* 点击选中的样式 */
.calculator > div:last-child .left > div:last-child .ok{
    border-right:4px solid blue;
    color:#000;
}
/* 右边 */
/* 叉子按钮 */
.calculator > div:last-child .right .x{
    position: absolute;
    top:15px;
    right:20px;
    cursor:pointer
}
.calculator > div:last-child .right .x i{
    font-size: 25px;
}



.calculator > div:last-child .right{
    height: 100%;
    flex:4;
    background-color: rgb(214, 209, 209);
    padding:50px;
    overflow: auto;
}
/* 第三页 */
.calculator > div:last-child .right .num2>div:last-child{
    margin-top:20px;
}
.calculator > div:last-child .right h4{
    padding-bottom:20px;
}
.calculator > div:last-child .right p{
    font-size: 14px;
    color:rgb(107, 106, 106);
}
/* 第一页 */
.calculator > div:last-child .right .top{
    display: flex;
    border-bottom:1px solid rgb(109, 107, 107);
}
.calculator > div:last-child .right .top h5{
    flex:1;
    text-align: center;
    color:rgb(107, 106, 106);
    border-bottom:2px solid transparent;
    cursor:pointer;
    padding-bottom:10px;
}
/* 点击后样式 */
.calculator > div:last-child .right .top .rightOk{
    border-bottom:2px solid #000;
    color:#000;
}
/* 现金底部 */
.calculator > div:last-child .right .bottom{
    padding:30px;
}
/* 现金价格 */
.calculator > div:last-child .right .bottom .rightNum1 >div:first-child{
    display: flex;
    justify-content: space-between;
    border-bottom:1px solid rgb(182, 175, 175);
}
.calculator > div:last-child .right .bottom .rightNum1 >div:first-child p{
    font-size: 15px;
    color:#000;
}
/* 现金价格下面 */
.calculator > div:last-child .right .bottom .rightNum1 >div:last-child{
    border-bottom:1px solid rgb(182, 175, 175);
    padding:10px 0;
}
.calculator > div:last-child .right .bottom .rightNum1 >div:last-child div:nth-child(1),
.calculator > div:last-child .right .bottom .rightNum1 >div:last-child div:nth-child(2){
    font-size: 13px;
    color:rgb(107, 106, 106);
    padding:5px 0;
}
.calculator > div:last-child .right .bottom .rightNum1 >div:last-child div:nth-child(3),
.calculator > div:last-child .right .bottom .rightNum1 >div:last-child div:nth-child(4){
    display: flex;
    justify-content: space-between;
    padding:5px 0;
}
.calculator > div:last-child .right .bottom .rightNum1 >div:last-child div:nth-child(4) div{
    color:#000;
}
/* 右边第二页 */
.calculator > div:last-child .right .bottom .rightNum2 .inputBox,
.calculator > div:last-child .right2 .bottom > div:first-child{
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}
.calculator > div:last-child .right .bottom .rightNum2 .num2Input,
.calculator > div:last-child .right2 .bottom > div:first-child >div{
    width: 300px;
}
.calculator > div:last-child .right .bottom .rightNum2 .num2Input p,
.calculator > div:last-child .right2 .bottom > div:first-child >div p{
    margin: 20px 0px 5px 10px;
}
.calculator > div:last-child .right .bottom .rightNum2 .num2Input select,
.calculator > div:last-child .right .bottom .rightNum2 .num2Input input,
.calculator > div:last-child .right2 .bottom > div:first-child input{
    width:100%;
    height: 40px;
    border-radius: 20px;
    border: 0;
    padding:0 10px;
    border: 1px solid rgb(189, 187, 187);
}
.calculator > div:last-child .right .bottom .rightNum2 .num2Input input{
    background-color: rgb(202, 201, 201);
}
/* 贷款月供 */
.calculator > div:last-child .right .bottom .rightNum2 .monthly{
    padding:20px;
    border-radius:10px;
    background-color: rgb(204, 201, 201);
    margin-top:20px;
}
.calculator > div:last-child .right .bottom .rightNum2 .monthly >div{
    display: flex;
    justify-content: space-between;
}
.calculator > div:last-child .right .bottom .rightNum2 .monthly >div > p{
    font-size: 15px;
    color: #333;
}
.calculator > div:last-child .right .bottom .rightNum2 .tips{
    font-size: 13px;
    padding-top:20px;
}
/* 预估燃油费节省金额 */
.calculator > div:last-child .right2 .bottom{
    padding: 0;
}
.calculator > div:last-child .right2 .bottom > div:first-child input{
    margin-left: 60px;
}
.calculator > div:last-child .right2 .bottom > div:first-child span{
    margin-left:-60px;
}
/* 节省费用 */
.calculator > div:last-child .right2 .bottom > div:nth-child(2){
    padding:20px;
    background-color: rgb(204, 201, 201);
    border-radius: 5px;
    margin:35px 0 30px 0;
}
.calculator > div:last-child .right2 .bottom > div:nth-child(2) P{
    color:#000;
}
.calculator > div:last-child .right2 .bottom > div:nth-child(3) P{
    margin-bottom:30px;
}
</style>