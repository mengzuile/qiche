<template>
<!-- 预约试驾页 -->
  <div id="drive">	
		<my-header class="my"></my-header>	
		<!-- 顶部文字 -->
		<div class="content-head w-100">
			<h1>预约试驾</h1>
			<p>前往 Tesla 线下直营体验店，试驾最新款 Tesla 车型。</p>
		</div>
    	<div class="container" :class="{form:form}">	
			<!-- form页 -->
			<div class="content">
				<!-- 中部表单 -->
				<form class="row no-gutters"  ref="input">
					<!-- 姓名栏 -->
					<div class="col-sm-12">
						<div class="d-flex justify-content-between">
							<!-- 姓氏 -->
							<div class="first-name">
								<div class="label"><label>姓氏</label></div>
								<input type="text" v-model="firstname" :class="firstnameFail" ref="firstName" @blur="checkFirstname">
								<p>{{firstnameMessage}}</p>
							</div>
							<!-- 名字 -->
							<div class="last-name">
								<div class="label"><label>名字</label></div>
								<input type="text" v-model="lastname" :class="lastnameFail" ref="lastName" @blur="checkLastname">
								<p>{{lastnameMessage}}</p>
							</div>
						</div>						
					</div>
					<!-- 邮箱栏 -->
					<div class="col-12">
						<div>
							<div class="label"><label for="">电子邮箱</label></div>
							<input type="text" v-model="email" :class="emailFail" ref="email" @blur="checkEmail">
							<p>{{emailMessage}}</p>
						</div>
					</div>
					<!-- 电话 -->
					<div class="col-12">
						<div>
							<div class="label"><label for="">电话</label></div>
							<input type="text" v-model="phone" :class="phoneFail" ref="phone" @blur="checkPhone">
							<p>{{phoneMessage}}</p>
						</div>
					</div>
					<!-- 省份 -->
					<div class="col-12">
						<div>
							<div class="label select">
								<label for="">省份</label>
							</div>
							<el-select v-model="proStatus" :class="proFail" @change="proChange()" placeholder="省份">
								<el-option 
									v-for="item in proname" 
									:key="item.pid" 
									:value="item.pid"
									:label="item.proname"
								>{{item.proname}}</el-option>
							</el-select>
							<p>{{proMessage}}</p>
						</div>
					</div>
					<!-- 城市 -->
					<div class="col-12">
						<div>
							<div class="label select">
								<label for="">城市</label>
							</div>
							<el-select v-model="cityStatus" :class="cityFail" @change="cityChange()" placeholder="市(区)">
								<el-option 
									v-for="item of cityname" 
									:key="item.cid" 
									:value="item.cid"
									:label="item.cityname">{{item.cityname}}</el-option>
							</el-select>
							<p>{{cityMessage}}</p>
						</div>
					</div>
					<!-- 复选框 -->
					<div class="col-12">
						<div @click="checkBox">
              <span class="checkBox" for="checkBox" v-show="newShow">&#10003;</span>
            </div>
						<span>获取Tesla最新资讯</span>
					</div>
					<div class="col-12">
						<p>为什么试驾需要预约？为保证每位客户都享受到一对一的试驾体验，我们需要根据您提供的信息来提前安排合适的试驾地点和时间。如您填写并提交上述信息，表示您同意特斯拉按照客户隐私政策(www.tesla.cn/about/legal)收集、使用这些信息。</p>
					</div>
				</form>
				<div  @click="driveBtn">
					<button>预约试驾</button>
				</div>
			</div>
		</div>
		<!-- 未登录遮盖层 -->
		<div :class="cover1?'cover':'nocover'">
			<div>
				<div><img src="../assets/logo.png" alt=""></div>
				<div>
					<p>登录后才可进行预约</p>
					<router-link to="/login"><button>登录</button></router-link>
					<p class="huo">或</p>
					<router-link to="/register"><button>注册</button></router-link>
					<router-link to="/">以后再说</router-link>
				</div>
			</div>
		</div>
		<!-- 门店页 -->
		<div class="container" :class="{shop:shop}">
			<div class="row no-gutters">
				<!---------------------左侧部分---------------------- -->
				<div class="col-xl-6 col-sm-12  p-md-4 pr-sm-0 d-flex leftInp">
					<!-- 左侧内表单 -->
					<div class="row no-gutters d-flex flex-column align-content-center">
						<label>选择门店</label>
						<div>
							<select v-model="shopStatus" @change="shopChange">
								<option value="0">请选择门店</option>
								<option v-for="(item,i) of shopname" :key="i" :value="i+1">{{item.shopname}}</option>
							</select>
						</div>
						<label for="">选择日期</label>
						<div>
							<el-date-picker 
							v-model="value1" 
							type="date">
							</el-date-picker>
						</div>
						<label for="">选择时间</label>
						<div>
							<el-time-select
								v-model="value2"
								:picker-options="{
									start: '08:30',
									step: '00:15',
									end: '18:30'
								}">
							</el-time-select>
						</div>
						<div>
							<p>
								如需安排其他时间试驾，请
								<span><router-link to="#">联系我们</router-link></span>
							</p>
						</div>
						<div>
							<button @click="bbtn">确认预约</button>
						</div>
					</div>
					
				</div>
				<!---------------------右侧部分---------------------- -->
				<div class="col-xl-6 col-sm-12  p-md-4 pr-sm-0 d-flex flex-column justify-content-center align-items-center">
					<div>
						<h4 class="mb-3">{{title}}</h4>
						<p class="mb-2">{{adress}}</p>
						<p class="mb-3">{{Tel}}</p>
					</div>
					<!-- 门店地图 -->
					<div id="map"></div>
				</div>
			</div>
		</div>
  </div>
</template>
<script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=u68GwH2NW0B411vDLKn8HEdS5AG2Mlj6"></script>
<script>
  export default {
    data(){
      return{
				//姓氏
				firstname:'',
				//名字
				lastname:'',
				//邮箱
				email:'',
				//电话
				phone:'',
				//省份
				proStatus:'',
				//城市
				cityStatus:'',
				//复选框
				newShow:false,
				//提示信息
				firstnameMessage:"",
				lastnameMessage:"",
				emailMessage:"",
				phoneMessage:"",
				proMessage:"",
				cityMessage:"",
				//省市
				//储存服务器返回的select数据
				driveResults:"",
				//验证失败样式
				firstnameFail:{fail:false},//姓氏
				lastnameFail:{fail:false},//名字
				emailFail:{fail:false},//邮箱
				phoneFail:{fail:false},//电话
				proFail:{fail:false},//省份
				cityFail:{fail:false},//省份

				//选择门店
				shopStatus:'',
				//门店信息
				title:"店名",
				adress:"地址",
				Tel:"联系方式",
				mapshow: false,
				pickerOptions: {
          disabledDate(time) {
          	return time.getTime() > Date.now()
					}
				},
				//保存预约日期
				value1: '',
				//保存预约时间
				value2:'',
				//提交后到动态切换页面
				form:false,
				shop:false,


				//保存请求到的数据
				proname:[],
				cityname:[],
				shopname:[],

				// 遮盖层
				cover1:true,
				//初始纬度定位于北京天安门
				latitude: 39.915119,
				//初始经度
				longitude: 116.403963,
				map: null,
      }
		},
		beforeMount(){
			if(this.$store.state.loginStatus == 0){
				this.cover1 = true;
			}else{
				this.cover1 = false;
			}
		},
		mounted(){
			//获取所有省市
			this.axios.get('/drive').then(res=>{
				this.proname = res.data.results;
			}),
			this.initMap()
		},
    methods:{
			// 设置地图
			initMap(){
				this.map = new BMap.Map('map')
				//初始坐标定位于北京天安门
				let point = new BMap.Point(this.longitude,this.latitude)
				
				//设置中心点与地图级别
				this.map.centerAndZoom(point,15)
				this.map.enableScrollWheelZoom(true) // 开启鼠标滚轮缩放
				//缩放控件
				// this.map.addControl(new BMap.NavigationControl())
				let marker=new BMap.Marker(point)
				this.map.addOverlay(marker);
			},
			// 复选框
			checkBox(){
				if(this.newShow){
					this.newShow = false
				}else{
					this.newShow = true
				}
			},
			bbtn(){
				alert('提交成功')
			},
			driveBtn(){
				//姓氏
				if(!this.firstname){
					this.firstnameMessage = "内容不可为空"
					this.firstnameFail={fail:true}
				};
				//名字
				if(!this.lastname){
					this.lastnameMessage = "内容不可为空"
					this.lastnameFail={fail:true}
				};
				//邮箱
				if(!this.email){
					this.emailMessage = "内容不可为空"
					this.emailFail={fail:true}
				};
				//电话
				if(!this.phone){
					this.phoneMessage = "内容不可为空"
					this.phoneFail={fail:true}
				}
				if(this.proStatus == ''){
					this.proMessage = "请选择试驾省份";
					this.proFail={fail:true}
				}else{
					this.proMessage = "";
					this.proFail={fail:false}
				};
				//城市
				if(this.cityStatus == ''){
					this.cityMessage = "请选择试驾城市";
					this.cityFail={fail:true}
				}else{
					this.cityMessage = "";
					this.cityFail={fail:false}
				};
				//上传数据库并进入下一步
				if(
					this.checkFirstname() && 
					this.checkLastname() && 
					this.checkEmail() && 
					this.	checkPhone() &&
					!this.proStatus == '' &&
					!this.cityStatus == ''
				){
					this.form = true;
					this.shop = true
				}
			},
			//输入框失去焦点判断
			checkFirstname(){
				//判断姓氏
				let firstnameReg = /^[A-Za-z]{2,15}$/i;
				let firstname = this.firstname;
				if(firstname){
					if(firstnameReg.test(firstname)){
						this.firstnameMessage = "";
						this.firstnameFail={fail:false}
						return true;
					}else{
						this.firstnameMessage = "请输入2-15位英文字母"
						this.firstnameFail={fail:true}
					}
				}else{
					this.firstnameMessage = "内容不可为空"
					this.firstnameFail={fail:true}
				};
			},
			checkLastname(){
				//判断名字
				let lastnameReg =  /^[A-Za-z]{2,15}$/i;
				let lastname = this.lastname;
				if(lastname){
					if(lastnameReg.test(lastname)){
						this.lastnameMessage = "";
						this.lastnameFail={fail:false}
						return true;
					}else{
						this.lastnameMessage = "请输入2-15位英文字母"
						this.lastnameFail={fail:true}
					}
				}else{
					this.lastnameMessage = "内容不可为空"
					this.lastnameFail={fail:true}
				};
			},
			checkEmail(){
					//判断邮箱
				let emailReg = /^\w+@\w+\.\w+(\.cn)?$/
				let email = this.email;
				if(email){
					if(emailReg.test(email)){
						this.emailMessage = "";
						this.emailFail={fail:false}
						return true;
					}else{
						this.emailMessage = "请输入正确的邮箱"
						this.emailFail={fail:true}
					}
				}else{
					this.emailMessage = "内容不可为空"
					this.emailFail={fail:true}
				};
			},
			checkPhone(){
				//电话
				let phoneReg = /^1\d{10}$/
				let phone = this.phone;
				if(phone){
					if(phoneReg.test(phone)){
						this.phoneMessage = "";
						this.phoneFail={fail:false}
						return true;
					}else{
						this.phoneMessage = "请输入正确的电话"
						this.phoneFail={fail:true}
					}
				}else{
					this.phoneMessage = "内容不可为空"
					this.phoneFail={fail:true}
				};
			},
			//获取城市/区名
			citySelect(){
				//使用上次请求到的数据，并作为此次请求的参数
				let pid=this.proname[this.proStatus-1].pid;
				this.axios.get('/city?pid=' + pid).then(res=>{
					this.cityname = res.data.results
				})	
			},
			//获取该区门店名
			shopSelect(){
				let cid=this.cityname[this.cityStatus-1].cid
				this.axios.get('/shop?cid=' + cid).then(res=>{
					this.shopname = res.data.results
					console.log(this.shopname)
				})
			},	
			//调用
			proChange(){
				this.citySelect()
				if(this.proStatus!==0){
					this.proMessage="";
					this.proFail={fail:false}
				}
				this.cityStatus = ''
			},
			cityChange(){
				this.shopSelect()
				if(this.cityStatus!==0){
					this.cityMessage="";
					this.cityFail={fail:false}
				}
				this.shopStatus = 'x'
			},
			shopChange(){
				if(this.shopStatus>0){
					this.title=this.shopname[this.shopStatus-1].shopname
					this.adress=this.shopname[this.shopStatus-1].adress
					this.Tel=this.shopname[this.shopStatus-1].phone
					this.longitude=Number(this.shopname[this.shopStatus-1].lng)
					this.latitude=Number(this.shopname[this.shopStatus-1].lat)
					this.initMap()
					console.log(this.longitude,this.latitude)
				}else if(this.shopStatus==0){
					this.title="店名";
					this.adress="地址";
					this.Tel="联系方式";
					this.longitude=116.403963;
					this.latitude=39.915119;
					this.initMap()
				}
			}
    }
  }
</script>
<style>
/* 遮盖层 */
	#drive .nocover{
		display: none;
	}
	#drive .cover{
		position: fixed;
		width: 100%;
		height: 100%;
		background-color:rgba(0,0,0,.5);
	}
	#drive .cover > div{
		width: 50%;
		height: 50%;
		background-color: #fff;
		border-radius: 20px;
		position: absolute;
		top:50%;
		left:50%;
		transform: translate(-50%,-50%);
		text-align: center;
		display: flex;
		flex-direction: column;
	}
	#drive .cover > div img{
		width: 200px;
		float: left;
	}
	#drive .cover > div p{
		font-size: 25px;
	}
	#drive .cover > div>div:last-child{
		display: flex;
		flex-direction: column;
		/* justify-content: center; */
	}
	#drive .cover > div>div:last-child button{
		width: 200px;
		height: 40px;
		background-color: rgb(59, 112, 172);
		border-radius: 5px;
		border: 0;
		margin:20px 0 10px 0;
		color:#fff;
	}
	#drive .cover > div>div:last-child .huo{
		font-size: 13px;
	}
	#drive #headerNav .header{
		background-color: #fff;
	}
  /* 基础样式 */
 	#drive .container {
		font-size: 13px;
		position: absolute;
		top:200px;
		left:0;
		right:0;
		transition:top 2s , opacity 2s;
	}
 	
 	
			/* 标题样式 */
	#drive h1{
		font-size: 40px;font-weight: 400;
		margin-bottom:15px;
	}
			/* 输入框基础样式 */
	#drive input{
		width:100%;height:40px;
		border-radius:20px;
		background-color: #ececec;
		box-sizing: border-box;
		border:1px solid  #ececec;
		padding:10px 20px;
		outline:0px;
		transition:1s;
	}
	#drive  .container input:focus{	border:1px solid #afadadea;}

/* 验证失败时边框红色 */
	#drive .container .fail{border:1px solid #B50000;}
	#drive .container .fail:focus{border:1px solid #B50000;}

			/* 设置标题样式 */
	#drive	.container label{margin-left:20px;margin-bottom: 10px;color:#7b7b7b}
			/* 设置提示信息样式 */
  #drive	.container form p{
		text-align: right;
		margin-top:6px;
		margin-right:10px;
		margin-bottom:5px;
		height: 13px;
	}
	 #drive	.container form span+p{
		color:rgb(181, 0, 0)
	}	
	 #drive	.container form input+p{
		color:rgb(181, 0, 0)
	}	

	/* 为什么试驾需要预约 */
	#drive  .container form>div:last-child p{
    text-align:justify;font-size:14px;
  	padding-top:30px;
		height:100%;
		margin-right:0;
		margin-bottom:0px
  }
	/*下拉列表样式  */
	#drive select{
		width:100%;height:40px;
		border-radius:20px;
		background-color: #ececec;
		box-sizing: border-box;
		border:1px solid  #ececec;
		padding:10px 20px;
		outline:0px;
		transition:1s;
		/* 清除默认箭头样式 */
		appearance:none;
	}
	/* 设置span箭头样式 */
	#drive select+span{
		position: absolute;
		right:20px;
		top:35px;
		font-size: 18px;
		font-weight: 900;
	}
	/* 复选框样式 获取资讯*/
	#drive .container form>div:nth-child(6)>div+span{
		margin-left:55px;
		font-size:15px;
		font-weight: 600;
	}
	/* 复选框 */
	#drive .container form>div:nth-child(6)>div{
		display: inline-block;
		width: 22px;
		height: 22px;
		cursor: pointer;
		font-size: 18px;
		font-weight: 900;
		position: absolute;
		line-height: 22px;
		text-align: center;
		top: 0px;
		left: 20px;
		color: #0D1529;
		border: 1px solid #8d8d8d;
		border-radius: 0.2rem;
	}
  /* 复选框悬浮 */
  #drive	.container form>div:nth-child(6)>div:hover{border:1px solid #3f3e3e}

  /* 预约试驾按钮 */
	#drive form+div{margin:0 auto;width:50%;}
  #drive form+div button{
		border:0px;
		background:#494cf7;
		color:#fff;
		width:100%;
		height:40px;
		border-radius:25px;
		margin:15px 0px;
		line-height: 100%;
		text-align: center;
		font-size: 15px;
		z-index:6
	}
	#drive form+div button:hover{
		background:#3234a5;
	}
	/* 姓名栏div宽度设置 */
	@media (min-width:720px){
		/* 设置内容位置 */
		#drive .content{width:400px;margin: auto;}
		#drive .el-select{width:100%}
	  #drive	.container form .first-name{margin-right:5.5px;}
	  #drive	.container form .last-name{margin-left:5.5px;}
		#drive .container:last-child>div:first-child{width:80%;margin:0 auto}
		#drive .container:last-child select{width:400px;} 
		#drive .container:last-child input{width:400px;padding-left: 40px;}  
		#drive .container:last-child>div>div{	width:400px;}
		#drive #allmap{width:500px;}
		#drive #map	{
			height:260px;width:400px;
			border:1px solid #000000;
			overflow: hidden;
		}	
		/* 表单顶部标题栏样式 */
		#drive .content-head{
			position: absolute;
			text-align: center;
			margin-bottom: 60px;
			margin-top:60px;
		}
		#drive .container:last-child p{margin-top:20px;width:400px} 
	}
	/* 暂不使用 */
	@media (max-width:719.99px){
	  #drive	.container form .first-name{margin-right:0px;}
		#drive	.container form .last-name{margin-left:0px;}
		#drive #allmap{width:100%;}	
	}
	@media(max-width:376px){
		/* 设置内容位置 */
		#drive .content{width:350px;margin: auto;}
		#drive .el-select{width:350px}
		#drive>.container:last-child{left:5px}

		#drive .container:last-child>div>div{width:100%}
		#drive .container:last-child>div:first-child{width:100%}
		#drive .container:last-child>div>div>div{width:100%}
		#drive .container:last-child>div>div>div>div{margin:0 auto}
		#drive .container:last-child select {width: 350px;margin:0 auto}
		#drive .container:last-child input{width:350px}
		#drive #map{
			width:350px;height:190px;
			overflow: hidden;
			margin-bottom:10px
		}
		/* 表单顶部标题栏样式 */
		#drive .content-head{
			position: absolute;
			text-align: center;
			margin-bottom: 60px;
			margin-top:60px;
			left:3%
		}
		#drive .container:last-child p{margin-top:20px;width:350px} 
	}
	
	/* /////////////门店页//////////////// */
	/* 门店基础页 */
	#drive .container:last-child{
		height:500px;
		opacity:0;
		top:-800px
	}
		
	#drive .leftInp{
		justify-content: center;
	}

	/* 左侧表单元素 */
	
	
	 
	#drive .container:last-child label{margin-top:20px}
	/* 表单图标 */
	#drive .container:last-child .el-input__icon{margin-left:10px}
	#drive .container:last-child .el-input{width:100%}
	/* 右侧区域 */	
	/* 地图区域 */
	

	
	/* 按钮 */
	#drive .container:last-child button{
		display:block;margin:0 auto;
		margin-top:40px;
		width:200px;height:40px;
		border-radius:40px;
		background-color: #1e5fea;
		color:#fff;
		font-size: 15px;
		border:0px;
	} 
	#drive .container:last-child button:hover{
		background-color: #1851c3;
	}
	
	/* 表单页提交后 */
	#drive .form{
		z-index:1;
		top:-800px;
		opacity:0;
	} 
	/* 门店页 */
	#drive .shop{
		z-index:1 !important;
		top:200px !important;
		opacity:1 !important;
	}
</style>