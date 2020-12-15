<template>
  <div id="foot">
    <div v-if="show">
      <ul class="nav">
				<li class="nav-item">
					<router-link class="nav-link" to="">Tesla&copy;</router-link>
				</li>
				<li class="nav-item">
					<router-link class="nav-link" to="">沪ICP备14038430号-1</router-link>
				</li>
				<li class="nav-item">
					<router-link class="nav-link"  to="/">隐私和法律</router-link>
				</li>
				<li class="nav-item">
					<router-link class="nav-link" to="">联系我们</router-link>
				</li>
        <li class="nav-item d-md-block d-none">
					<router-link class="nav-link" to="">工作机会</router-link>
				</li>
        <li class="nav-item d-xl-block d-none">
					<router-link class="nav-link" to="">最新消息</router-link>
				</li>
			</ul>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      show:true
    }
  }
}
</script>
<style>
#foot{
  position:fixed;
  bottom:10px;
  width:100%;
  z-index:60;
  transition:1s
}
  #foot div{
    width:70%;
    margin:0 auto;
    text-align: center;
  }
  #foot div ul{
    display:table;
    text-align: center;
    margin:0 auto;
  }
  #foot div li{
    float: left;
  }
  @media (max-width: 420px) {
    #foot div li{
      flex: 1;
      float: none;
    }
  }
  #foot div a{
    color:#000;
  }
</style>