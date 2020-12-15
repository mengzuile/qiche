<template class="ioginNav">
	<div class="my_nav d-flex justify-content-between">
	    <router-link to="/" class="logo">
	        <img src="../assets/logo1.png" alt="">
	    </router-link>
	    <div class="nav_text pt-3">
			<span>
				<i class="iconfont">&#xe718;</i>
			</span>
	        <span>zh-CN</span>
	    </div>
	</div>
</template>


<style>
/* nav */
.logo img{
    width: 120px;
	padding-left:20px;
}
.nav_text{
	padding-right:20px;
	font-weight: 500;
	vertical-align: middle;
}
.nav_text span i{
	font-size: 20px;
	padding-right: 2px;
	vertical-align: middle;
}
</style>