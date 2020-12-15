<template>
    <div id="my_input">
        <!-- 插槽   标题 -->
        <p><slot name="input_title"></slot></p>    
		<div class="input">
			<input :type="type" class="inp" :class='Fail' v-model='Value' @blur="out">
			<slot name="icons"></slot>
		</div>
        <!-- 插槽   错误提示 -->
		<p class="failTips" :style='FailTips'><slot name="input_tips"></slot></p>
    </div>
</template>

<script>
export default {
    data(){
		return{
			type:'text',
			Fail:{Fail:false},  //class 样式
			FailTips:{opacity: 0},//提示
			Value:'', //内容
			zz:'',
			bool:'',
		}
    },
    methods:{
        // 函数(正则,布尔值)
		input_btn(zz,bool){
			this.zz = zz;
			this.bool = bool;
			if(bool){
				bool = !zz.test(this.Value);
			}else{
				bool = zz.test(this.Value);
			}

			if(bool){
				this.Fail.Fail = true;
				this.FailTips.opacity = 1;
				return false;
			}else{
				this.Fail.Fail = false;
				this.FailTips.opacity = 0;
				// var reg = /^\s*$/g;
				return {booler:true,value:this.Value};
            }
		},
		out(){
			if(this.zz&&this.bool){
				this.input_btn(this.zz,this.bool)
			}
		}
    }
}
</script>

<style>
/* 设置所有input */
#my_input{
    width: 332px;
}
#my_input input{
	width: 332px;
	height: 40px;
	border-radius: 25px;
	padding:0 20px;
	margin: 0 0 20px 0;
	transition: 0.5s;
}
#my_input .inp{
	margin-top:5px;
	background-color: #ddd9d9;
	border:1px solid transparent;
	margin:0;
}

/* 登录失败后文本框样式 */
#my_input .Fail{
	border:1px solid #f00;
}

#my_input .failTips{
	float: right;
	text-align: end;
	width: 302px;
	margin:0 20px 10px 0;
	color:#f00;
	transition: 0.3s;
}
#my_input .inp:focus{
	border:1px solid #cacaca;
}


/* 设置提示文字 */
#my_input p{
	margin-left:20px;
	font-size: 13px;
}
#my_input .tips_btn{
	cursor:pointer
}
</style>
