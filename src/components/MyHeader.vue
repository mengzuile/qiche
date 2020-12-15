<template>
  <div id="headerNav" >
		<!-- 导航栏 -->
		<header>
			<div class="container-fiuled">
				<div  class="header row no-gutters" >
					<!-- 顶部导航logo -->
					<div class="h_logo col-xl-3">
						<router-link to="/"><slot><img src="../assets/logo1.png" alt=""></slot></router-link>
					</div>

					<!-- 顶部导航中间 -->
					<div class="h_middle col-xl-6 d-xl-flex d-none d-xl-block justify-content-center">
						<ul class="list-unstyled d-flex justify-content-center">
							<li><router-link to="/models">MODEL S</router-link></li>
							<li><router-link to="/model3">MODEL 3</router-link></li>
							<li><router-link to="/modelx">MODEL X</router-link></li>
							<li><router-link to="/modely">MODEL Y</router-link></li>
							<li><router-link to="/cybertruck">CYBERTRUCK</router-link></li>
							<li><router-link to="/powereall">POWERWALL</router-link></li>
						</ul>
					</div>

					<!-- 顶部导航右侧文本-->
					<div class="h_right col-xl-3 d-none d-xl-block">
						<ul class="list-unstyled  d-flex justify-content-end">
							<li><router-link to="/shopping">在线商城</router-link></li>
							<li v-if="this.$store.state.loginStatus !== 1"><router-link to="/login">TESLA 账户</router-link></li>
							<li v-else @click="logout_mutations"><router-link to="/login"><span>退出登录</span></router-link></li>
						</ul>
					</div>
				</div>
			</div>
		
		</header>
		<!-- 侧边导航栏 -->
		<div id="navbar"  class="container" :style="{width}">
			<!-- 菜单图标 -->
			<div class="inner-header" @click="handel">
				<!--三条横线-->
				<div class="inner-header-icon inner-header-icon-out" :class="change">
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
			<!-- 侧边栏 -->
			<div class="inner-nav" :style="nav">
				<div>
					<!-- 屏幕尺寸大于1200时显示以下 -->
					<ul>
						<li><router-link to="javascript:;">认证二手车</router-link></li>
						<li><router-link to="javascript:;">车辆置换</router-link></li>
						<li><router-link to="javascript:;">ROADSTER</router-link></li>
						<li><router-link to="##">ENERGY</router-link></li>
						<li><router-link to="javascript:;">大客户计划</router-link></li>
						<li><router-link to="javascript:;">金融服务</router-link></li>
						<li><router-link to="javascript:;">如何充电</router-link></li>
						<li><router-link to="javascript:;">找到我们</router-link></li>
						<li><router-link to="javascript:;">问题解答</router-link></li>
						<li><router-link to="/shopping">在线商城</router-link></li>
					</ul>
					<!-- 屏幕尺寸小于1200时显示以下 -->
					<el-collapse-transition>
						<ul v-show="show3">
							<li><router-link to="/models">MODEL S</router-link></li>
							<li><router-link to="/model3">MODEL 3</router-link></li>
							<li><router-link to="/modelx">MODEL X</router-link></li>
							<li><router-link to="/modely">MODEL Y</router-link></li>
							<li><router-link to="/cybertruck">CYBERTRUCK</router-link></li>
							<li><router-link to="/powereall">POWERWALL</router-link></li>
							<li @click="show3= !show3">
								<router-link to="javascript:;">
									更多<span class="iconfont">&#xe604;</span>
								</router-link>
							</li>
						</ul>
					</el-collapse-transition>
					<el-collapse-transition>
						<ul v-show="!show3">
							<li @click="show3= !show3">
								<router-link to="javascript:;">
									更多<span class="iconfont">&#xe6cc;</span>
								</router-link>
							</li>
							<li><router-link to="javascript:;">认证二手车</router-link></li>
							<li><router-link to="javascript:;">车辆置换</router-link></li>
							<li><router-link to="javascript:;">ROADSTER</router-link></li>
							<li><router-link to="javascript:;">ENERGY</router-link></li>
							<li><router-link to="javascript:;">金融服务</router-link></li>
							<li><router-link to="javascript:;">如何充电</router-link></li>
							<li><router-link to="javascript:;">找到我们</router-link></li>
							<li><router-link to="javascript:;">在线商城</router-link></li>
							<li v-if="this.$store.state.loginStatus !== 1"><router-link to="/login">TESLA账户</router-link></li>
							<li v-else @click="logout_mutations"><router-link to=""><span>退出登录</span></router-link></li>
						</ul>
					</el-collapse-transition>
				</div>
			</div>
		</div>	
		<!-- 点击菜单出现覆盖页 -->
		<div class="cover" id="cov" v-show="show"></div>
	</div>
</template>
<script>
export default {
	data(){
		return{
			show:false,
			width:"0%",
			nav:{ right:"-100%",width:"100%"},
			// 点击按钮切换样式
			change:{
				change:false,
			},
			time:'',
			show3:true,
			username:'张三',
		}
	},
	methods:{
		handel(){
			if(this.show){
				this.show=false;
				this.width = "20%";
				this.nav={right:"-100%"}
				// 点击按钮切换样式
				this.change.change=false;
				if( typeof this.$parent._can === "function" ){
					this.$parent._can()
				}
				this.show3=true
			}else{
				this.show=true;
				this.width = "100%";
				this.nav={right:"0px"}
				// 点击按钮切换样式
				this.change.change=true;
				if( typeof this.$parent._stop === "function" ){
					this.$parent._stop()
				}
			}
		},
		logout_mutations(){
		  this.$store.commit('logout_mutations')
		  localStorage.clear()
    	  if(this.$store.state.loginStatus==0){
    	    this.$router.push("/login")
    	  }
    	}
	},
	watch:{
		width(){
			if(this.width == '100%'){
				if(this.time){
					clearTimeout(this.time);
				}
			}
			if(this.width == '20%'){
				this.time = setTimeout(()=>{
					this.width = '0%'
				},500)
			}
		}
	},
	bodyScroll(event){
    event.preventDefault();  
	}
}
</script>
<style>
/* z-index保证导航栏在图层顶部 */
#headerNav{
	min-width: 850px;
}
	#headerNav header{
		position: fixed;
		width:100%;
		z-index: 30;
	}
	#headerNav .header{
		padding-top:15px
	}      
	#headerNav .h_logo img{
    	width:90px;
		margin-left:20px;
		margin-top:-12px
  	}
	#headerNav	.h_middle a,
	#headerNav .h_right a{
		color:#000;
		font-size:0.95em;
		margin:5px 13px;
	}
	#headerNav a:hover{text-decoration: none;}
	#headerNav .h_right ul{margin-right:45px}

	/* 侧边栏 */
#headerNav	#navbar{
    	position:absolute;
    	overflow:hidden;
		right:0;
    	top:0;
		height:100%;
    	z-index:66;
		padding:0;
  }
	/* #navbar .open{width:100% important;height:100% } */
  /* 制作右边菜单图标 */	
#headerNav	#navbar	.inner-header-icon div{
		width:19px;
		height: 2px;
		background-color:#000;
		transition: 0.5s;
	}
	/* 侧边栏按钮样式 */
#headerNav	#navbar	.change div:first-child{
		transform-origin:0 0;
		transform:rotate(42deg);
		background-color: #000;
	}
#headerNav	#navbar	.change div:nth-child(2){
		opacity: 0;
	}
#headerNav	#navbar	.change div:last-child{
		transform-origin:0 0;
		margin-top:5px;
		transform:rotate(-45deg);
		background-color: #000;
	}

#headerNav	#navbar	.inner-header-icon div:nth-child(2){
		margin:4px 0px;
	}
			
	/* 规定菜单图标位于图层最上方 */
#headerNav	.inner-header-icon{
		position:fixed;
		top:20px;
		right:22px;
		z-index:50;
	}
			
	/* 当点击菜单栏时，该div出现并覆盖页面 */	
#headerNav	.cover{
		position:fixed;
		width:100%;
		top:0px;
		bottom:0px;
		background-color:#000;
		display:block;
		opacity: 0.3;
		z-index:6;
	}
	

	/* 侧边栏 样式*/
#headerNav	.inner-nav{
		position: fixed;
		top: 0;
		bottom: 0;
		background-color:#fff;
		z-index:10;
		padding:50px 74px 100px 15px;
		transition:right 0.5s;
	}
#headerNav	.inner-nav div{
		height:100%;width:100%
	}
#headerNav	.inner-nav ul{width:200px;height:70%;text-align:left;}
#headerNav	.inner-nav ul li{
		height:50px;width:100%;
		padding-left:1em;
		border-bottom: 1px solid #c3baba;
		display:table
	}
#headerNav	.inner-nav a{ 
		display:table-cell; 
    vertical-align:middle;
		height:100%;font-size: 14px;
		color:#000
	}
#headerNav	#headerNav .iconfont{
			font-size:10px;
		}
	/* 侧边媒体查询 */
	@media screen and (max-width:1200px){
		#headerNav .inner-nav ul:first-child{display:none}
		#headerNav .inner-nav ul:nth-child(2){display:block;}
		#headerNav .inner-nav ul:nth-child(3){display:block;}
	}
	@media screen and (min-width:1200px){
		#headerNav .inner-nav ul:first-child{display:block}
		#headerNav .inner-nav ul:nth-child(2){display:none;}
		#headerNav .inner-nav ul:nth-child(3){display:none;}
	}
</style>