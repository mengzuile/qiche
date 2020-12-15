<template>
    <div id="login" @click.stop="loginBtn">
		<!-- 顶部 -->
		<login-nav/>
		<!-- 登录模块 -->
		<div class="my_login d-flex justify-content-center">
			<div class="flex-column">
				<h2>登录</h2>
				<div>
					<!-- 密码输入错误提示 -->
					<div class="topFailTips" v-show="topFailTips">
						<i class="iconfont">&#xe710;</i>
						账户邮箱或者密码不正确
					</div>
					<!-- 第一次引入组件 -->
					<my-input ref='myEmailInput'>
						<slot slot='input_title'>
							电子邮箱地址 
							<span>
								<i class="iconfont tips_btn" @click.stop='tips_btn'>&#xe63b;
									<div class="tips" v-show='tipsShow'>
										<p>如果您不再使用与 Tesla 账户关联的电子邮箱，请登录您的 Tesla 账户后，前往账户设置更新电子邮箱地址。</p>
										<p>如果您无法登录，请访问我们的 
											<router-link to="##" class="logo">支持页面 </router-link>获取帮助。
										</p>
									</div>
								</i>
							</span>
						</slot>
						<slot slot='input_tips'>请输入有效的电子邮件地址</slot>
					</my-input>


					<!-- 第二次引入组件 -->
					<my-input ref='myPwdInput' class="pwdInput">
						<slot slot='input_title'>密码</slot>
						<slot slot='input_tips'>必须输入密码</slot>
						<slot slot="icons"><i class="iconfont icons_eye" @click="icons_eye" v-html="eye?'&#xe679;':'&#xe60c;'"></i></slot>
					</my-input>


					<!-- 登录按钮 -->
					<div>
						<input type="button" value="登录" class="login_btn" @click="login_btn">
					</div>
					<!-- 取消按钮 -->
					<div>
						<router-link to='/'><input type="button" value="取消" class="cancel_btn"></router-link>
					</div>
					<!-- 记性不好 -->
					<div class="forget">
						<router-link to="/">
							忘记电子邮箱？
						</router-link>
						<span>|</span>
						<router-link to="/">
							忘记密码？
						</router-link>
					</div>
					<div class="or">或</div>
					<router-link to="/register" class="logo"><input type="button" value="创建账户" class="cancel_btn"></router-link>
					
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
			tipsShow:false, //提示显示隐藏
			topFailTips:false, //密码或邮箱输入错误顶部提示

			eye:true,
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
			// 邮箱
			let emailZz = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			let myEmail = this.$refs.myEmailInput.input_btn(emailZz,true);
			// 密码
			var pwdZz = /^\s*$/g;
			let myPwd = this.$refs.myPwdInput.input_btn(pwdZz,false);
			// //判断是否输入格式正确
			if(myEmail.booler&&myPwd.booler){
				// let srt= 'email='+ myEmail.value+'&password='+myPwd.value;
				// this.$store.dispatch('login_actions',srt)
				// this.topFailTips = this.$store.state.topFailTips;
				let object = {
					email:myEmail.value,
					password:myPwd.value
				}

				this.axios.post('/t_login',this.qs.stringify(object)).then(res=>{
      			  if(res.data.code == 1){
      			    // 将用户登录状态保存到webstorage中
      			    localStorage.setItem('loginStatus',1);
					localStorage.setItem('userInfo',JSON.stringify(res.data.results.email))
					this.$store.commit('login',res.data.results.email)
      			  }else{
					this.topFailTips = true;
      			  }
      			})
			}
		},
		icons_eye(){
			this.eye = !this.eye;
			if(this.eye){
				this.$refs.myPwdInput.type = 'password';
			}else{
				this.$refs.myPwdInput.type = 'text';
			}
		},
	},
	mounted(){
		this.$refs.myPwdInput.type = 'password';
	}
}
</script>


<style>
/* 登录模块 */
#login .my_login h2{
	margin:20px 0 ;
}
/* 设置所有input */
#login .my_login input{
	width: 332px;
	height: 40px;
	border-radius: 25px;
	padding:0 20px;
	margin: 0 0 20px 0;
	transition: 0.5s;
}

/* 设置登录按钮 */
#login .my_login .login_btn{
	margin-top:20px;
	border:1px solid #0066FF;
	background-color: #0066FF;
	color:#fff;
	font-size: 13px;
	cursor:pointer
}
/* 设置取消按钮  创建账户*/
#login .my_login .cancel_btn{
	border:3px solid #000;
	cursor:pointer;
	font-size: 13px;
}
#login .my_login .cancel_btn:hover{
	background-color: #000;
	color:#fff;
}
/* 设置忘记密码 */
#login .my_login .forget{
	color:#666666;
	text-align: center;
}
#login .my_login .forget span{
	padding:0 5px;
}
#login .my_login .forget a{
	color:#666666;
	font-size: 13px;
	border-bottom:1px solid #666;
	transition: 0.3s;
}
#login .my_login .forget a:hover{
	border-bottom: 2px solid #000;
}
/* 设置  或 */
#login .my_login .or{
	text-align: center;
	padding:40px;
}

/* 提示框 */
#login .my_login .tips{
	width: 300px;
	height: 150px;
	padding: 10px;
	background-color: #fff;
	box-shadow: 1px 4px 20px -6px #000000;
	position: absolute;
	transition: 0.3px;
}
#login .my_login .tips p{
	font-size: 14px;
	margin:0;
	color:#555555;
}
#login .my_login .tips p:nth-child(1){
	margin-bottom: 10px;
}
/* 密码输入错误 */
#login .my_login .topFailTips{
	width: 332px;
	height: 50px;
	background-color: #ececec;
	border-radius: 10px;
	padding-left:20px;
	line-height: 50px;
	margin-bottom:10px;
	font-size: 14px;
}
#login .my_login .topFailTips i{
	color:#f00;
}

/* 登录  眼 */
#login .my_login .icons_eye{
	cursor:pointer;
	margin-left:-35px;
}
#login .my_login .pwdInput .inp{
	padding-right:40px;
}
</style>