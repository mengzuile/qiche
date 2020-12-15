<template>
	<div class="register"  @click.stop="loginBtn">
		<!-- 顶部 -->
		<login-nav/>
		<!-- 注册模块 -->
		<div class="my_register d-flex justify-content-center">
			<div class="flex-column">
				<h2>创建账户</h2>
				<div>
					<!-- 密码输入错误提示 -->
					<div class="topFailTips" v-show="topFailTips">
						<i class="iconfont">&#xe710;</i>
						您必须同意隐私声明和使用条款才能继续
					</div>
					<!-------- 姓名---- -->
					<my-input ref='myNameInput'>
						<slot slot='input_title'>名字</slot>
						<slot slot='input_tips'>请输入姓名，仅支持英文字母</slot>
					</my-input>
					<!-- -----姓氏----- -->
					<my-input ref='mySurnameInput'>
						<slot slot='input_title'>姓氏</slot>
						<slot slot='input_tips'>请输入姓氏，仅支持英文字母</slot>
					</my-input>

					<!-- -------电子邮件---------- -->
					<my-input ref='myEmailInput'>
						<slot slot='input_title'>电子邮件</slot>
						<slot slot='input_tips'>请输入有效的电子邮件地址</slot>
					</my-input>

					<!-- -------密码------ -->
					<my-input ref='myPwdInput'>
						<slot slot='input_title'>
							密码
							<span>
								<i class="iconfont tips_btn" @click.stop='tips_btn'>&#xe63b;
									<div class="tips" v-show='tipsShow'>
										<p>请输入一个有效密码，至少 8 个字符。密码必须包含至少 1 个数字和 1 个字母。</p>
									</div>
								</i>
							</span>
						</slot>
						<slot slot='input_tips'>密码至少包含1位字母和数字</slot>
					</my-input>
					<!-- 隐私声明和使用条款 -->
					<div class="statement">
						<div @click='statementBtn'>
							<div :class='statementFail'><span  v-show='statementShow'>√</span></div>
							<p>创建 Tesla 账户，即表示我了解并同意 Tesla 的
								<router-link to='##'>隐私声明</router-link>
								和
								<router-link to='##'>使用条款</router-link>
							</p>
						</div>
						<div @click='newsBtn'>
							<div><span  v-show='newsShow'>√</span></div>
							<p>我希望接收到有关 Tesla 的
								<router-link to='##'>最新消息</router-link>
							</p>
						</div>
					</div>
					<!-- 验证码 -->
					<div class="verification">
						<!-- 点击切换验证码 -->
						<div @click="verificationBtn">
							<img :src="verificationL" alt="验证码">
						</div>
						<p>请输入图片中的字符</p>
						<div>
							<input type="text" class="inp" :class='verificationFail' v-model='verificationValue' @blur="verificationOut">
						</div>
						<p class="failTips" :style='verificationFailTips'>验证码不匹配</p>
					</div>
					<!-- 登录按钮 -->
					<div>
						<input type="button" value="创建账户" class="login_btn" @click="login_btn">
					</div>
					<!-- 取消按钮 -->
					<div>
						<router-link to='/'><input type="button" value="取消" class="cancel_btn"></router-link>
						
					</div>
					<div class="or">或</div>
					<router-link to='/login'><input type="button" value="登录" class="cancel_btn"></router-link>
					
				</div>
			</div>
		</div>
		<!-- 底部分 -->
		<login-footer/>
	</div>
</template>

<script>
export default {
	data(){
		return{
			tipsShow:false, //提示显示隐藏,
			statementFail:{statementFail:false},
			verificationFail:{verificationFail:false},
			

			verificationFailTips:{opacity: 0}, // 验证码提示
			topFailTips:false, //账户输入错误

			
			verificationValue:'', //验证码内容
			
			
			statementShow:false,  //勾选隐私声明
			newsShow:false,  //勾选是否接受最新消息
			// 验证码数组
			verificationS:[require("../assets/captcha.svg"),require("../assets/captcha1.svg"),require("../assets/captcha2.svg"),require("../assets/captcha3.svg"),require("../assets/captcha4.svg"),require("../assets/captcha5.svg"),require("../assets/captcha6.svg"),require("../assets/captcha7.svg"),require("../assets/captcha8.svg"),require("../assets/captcha9.svg")],
			// 随机数
			random:'',
			// 随机出现的验证码
			verificationL:'',
			// 对应验证码数组
			verificationArr:['mllp','mpvxak','bkee','bd8sh','xdpnjp','rj44n','bqffd','wcvpt','3nkhvc','9ddtsz'],
		}
	},
    methods:{
		loginBtn(){
			if(this.tipsShow){
				this.tipsShow=false;
			}
		},
		// 显示隐藏提示框
		tips_btn(){
			this.tipsShow=!this.tipsShow;
		},
		// 登录按钮
		login_btn(){
			// 判断姓氏和名字只能输入英文分别最多15个
			let nameZz = /^[A-Za-z]{2,15}$/;
			var myName = this.$refs.myNameInput.input_btn(nameZz,true);
			var mySurname = this.$refs.mySurnameInput.input_btn(nameZz,true);

			// 邮箱正则
			let emailZz = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var myEmail = this.$refs.myEmailInput.input_btn(emailZz,true);

			// 密码验证 至少8个字符 包含1个数字和1个字母
			let pwdZz = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
			var myPwd = this.$refs.myPwdInput.input_btn(pwdZz,true);
			

			let verificationV = this.verificationValue;
			// 判断隐私声明是否同意
			if(!this.statementShow){
				this.topFailTips = true;
				this.statementFail.statementFail = true;
				var myStatement = false;
			}else{
				this.topFailTips = false;
				this.statementFail.statementFail = false;
				var myStatement = true;
			}
			// 验证码
			if(!(verificationV == this.verificationArr[this.random])){
				this.verificationFail.verificationFail = true;
				this.verificationFailTips.opacity = 1;
				var myVerification = false;
			}else{
				this.verificationFail.verificationFail = false;
				this.verificationFailTips.opacity = 0;
				var myVerification = true;
			}
			// 都通过判断验证
			if(myName.booler&&mySurname.booler&&myEmail.booler&&myPwd.booler&&myStatement&&myVerification){
				// 传递参数
				let object = {
					username:myName.value,     //名字
					surnames:mySurname.value,  //姓氏
					password:myPwd.value,      //密码
					email:myEmail.value,       //邮箱
				}
				//  axios请求
				this.axios.post('/t_register',this.qs.stringify(object)).then((results)=>{
					if(results.data.code == 1){
						this.$router.push("/login")
					}else if(results.data.code == 0){
						alert('邮箱已注册')
					}
				})
			}
		},
		// 验证码输入框失去光标
		verificationOut(){
			let verificationV = this.verificationValue;
			if(verificationV == this.verificationArr[this.random]){
				this.verificationFail.verificationFail = false;
				this.verificationFailTips.opacity = 0;
				var myVerification = true;
			}
		},
		// 验证码看不清 点击切换验证码
		verificationBtn(){
			this.verification();
		},
		// 获取随机验证码
		verification(){
			this.random = Math.floor(Math.random() * 10);
			this.verificationL = this.verificationS[this.random]
		},
		// 隐私声明
		statementBtn(){
			this.statementShow = !this.statementShow;
		},
		newsBtn(){
			this.newsShow = !this.newsShow;
		},
	},
	mounted(){
		this.verification()
	}
}
</script>


<style>
/* 登录模块 */
.register .my_register h2{
	margin:20px 0 ;
}
/* 设置所有input */
.register .my_register input{
	width: 332px;
	height: 40px;
	border-radius: 25px;
	padding:0 20px;
	margin: 0 0 20px 0;
	transition: 0.5s;
}
/* 设置输入框 */
.register .my_register .inp{
	margin-top:5px;
	background-color: #f3ebeb;
	border:1px solid transparent;
	margin:0;
}
.register .my_register .inp:focus{
	border:1px solid #cacaca;
}
/* 登录失败后文本框样式 */
.register .my_register .statement .statementFail{
	border:1px solid #f00;
}
.register .my_register .verificationFail{
	border:1px solid #f00;
}
.register .my_register .failTips{
	float: right;
	text-align: end;
	width: 302px;
	margin:0 20px 10px 0;
	color:#f00;
	transition: 0.3s;
}
/* 没有勾选 */
.register .my_register .topFailTips{
	width: 332px;
	height: 50px;
	background-color: #ececec;
	border-radius: 10px;
	padding-left:20px;
	line-height: 50px;
	margin-bottom:10px;
	font-size: 14px;
}
.register .my_register .topFailTips i{
	color:#f00;
}
/* 设置提示文字 */
.register .my_register p{
	margin-left:20px;
	font-size: 13px;
}
.register .my_register .tips_btn{
	cursor:pointer
}
/* 设置登录按钮 */
.register .my_register .login_btn{
	margin-top:20px;
	border:1px solid #0066FF;
	background-color: #0066FF;
	color:#fff;
	font-size: 13px;
	cursor:pointer
}
/* 设置取消按钮  创建账户*/
.register .my_register .cancel_btn{
	border:3px solid #000;
	cursor:pointer;
	font-size: 13px;
}
.register .my_register .cancel_btn:hover{
	background-color: #000;
	color:#fff;
}
/* 设置忘记密码 */
.register .my_register .forget{
	color:#666666;
	text-align: center;
}
.register .my_register .forget span{
	padding:0 5px;
}
.register .my_register .forget a,
.register .my_register .statement div a{
	color:#666666;
	font-size: 13px;
	border-bottom:1px solid #666;
	transition: 0.3s;
}
.register .my_register .forget a:hover,
.register .my_register .statement div a:hover{
	border-bottom: 2px solid #000;
}
/* 设置  或 */
.register .my_register .or{
	text-align: center;
	padding:40px;
}

/* 提示框 */
.register .my_register .tips{
	width: 300px;
	height: 60px;
	padding: 10px;
	background-color: #fff;
	box-shadow: 1px 1px 20px -6px #000000;
	position: absolute;
	transition: 0.3px;
	margin-top:-100px;
	border-radius: 10px;
}
.register .my_register .tips p{
	font-size: 14px;
	margin:0;
	color:#555555;
}
.register .my_register .tips p:nth-child(1){
	margin-bottom: 10px;
}
/* 隐私声明和使用条款 */
.register .my_register .statement{
	width: 332px;
	padding:10px;
	margin-top:20px;
	cursor:pointer
}
.register .my_register .statement div{
	margin-bottom:15px;
}
.register .my_register .statement div > div{
	width: 22px;
	height: 22px;
	border:1px solid #000;
	border-radius: 5px;
	text-align: center;
	line-height: 22px;
	font-weight: 900;
	float: left;
	margin-right:15px;
}
/* 验证码 */
.register .my_register .verification{
	width: 332px;
}
.register .my_register .verification >div:nth-child(1){
	width: 332px;
	height: 60px;
	background-color: #b9b9b9;
	text-align: center;
	margin-bottom:15px;
	line-height: 60px;
	border-radius: 5px;
}
</style>
