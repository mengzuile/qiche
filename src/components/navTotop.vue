<template>
    <div id="toTop">
        <!-- logo -->
        <div class="h_logo">
            <router-link to="/"><slot name="img"><img src="../assets/logo1.png" alt=""></slot></router-link>
        </div>
        <!-- 回到顶部按钮 -->
        <slot name='btn'>
            <div @click="toTop"><i class="iconfont" :style='color1'>&#xe62a;</i></div>
        </slot>
    </div>
</template>

<script>
export default {
    data(){
        return{
            color1:'color:#fff'
        }
    },
    methods:{
        // 回到顶部
        toTop(){
            this.$parent.toTop()
        },
    }
}
</script>

<style>
#toTop{
    /* min-width: 850px; */
    width: 100%;
    position: fixed;
    z-index: 99999;
    display: flex;
    justify-content: space-between;
    padding:7px 20px 0 20px;
}
#toTop .h_logo img{
	width:90px;
    height: 60px;
	margin-top:-12px
}
#toTop > div:last-child i{
    font-size: 27px;
    font-weight: 900;
    cursor:pointer
}
</style>