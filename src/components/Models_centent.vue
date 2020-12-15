<template>
    <div id="models_centent">
        <!-- 车基础情况 -->
        <ul class='w-100' :class="ul" :style='flex'>
            <li>
                <div :class='conter'><slot name='content1Div'></slot></div>
                <p class="d-none d-md-block"><slot name='content1P'></slot></p>
                <p :class='conter' class="d-block d-md-none"><slot name='content1P2'></slot></p>
            </li>
            <li class="shu" :style='size'></li>
            <li>
                <div :class='conter'><slot name='content2Div'></slot></div>
                <p class="d-none d-md-block"><slot name='content2P'></slot></p>
                <p :class='conter' class="d-block d-md-none"><slot name='content2P2'></slot></p>
            </li>
            <li class="shu" :style='size'></li>
            <li>
                <div :class='conter'><slot name='content3Div'></slot></div>
                <p class="d-none d-md-block"><slot name='content3P'></slot></p>
                <p :class='conter' class="d-block d-md-none"><slot name='content3P2'></slot></p>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    data(){
        return{
            ul:{
                ul:false
            },
            flex:'',
            size:'',
            windowWidth:'',
            conter:{conter:false}
        }
    },
    beforeMount(){ 
        this.windowWidth = window.innerWidth;
    },
    methods:{
        models_cententChange(live,flex){
            // 进入 移出
            if(live){
                this.ul.ul=true;
            }else{
                this.ul.ul=false;
            }
            // 是否横向显示
            if(flex){
                this.flex='display:flex;justifyContent: center';
                this.size = 'width: 1px; height: 70px;'
                
                if(this.windowWidth<420){
                    this.size = 'width: 1px; height: 54px;'
                }
                this.conter.conter=true;
            }else{
                this.size = 'width: 70px; height: 1px; margin-top:40px; margin-bottom:40px'
                if(this.windowWidth<420){
                    this.size = 'width: 70px; height: 1px;margin-top:20px; margin-bottom:20px'
                }
            }
            
        }
    }
}
</script>

<style>
/* 车基础情况 */
#models_centent .conter{
    text-align: center;
}
#models_centent{
    width: 100%;
}
#models_centent ul{
    position: absolute;
    bottom: 10px;
}
#models_centent .ul{
    bottom: 60px;
}
#models_centent  ul li{
    /* float: left; */
    margin:0 20px;
    text-align: center;
    color: #fff;
    text-align: start;
    
}
#models_centent  ul li:nth-child(1){
    transition:opacity 0.5s;
}
#models_centent  ul li:nth-child(2){
    transition:opacity 1s 0.1s;
}
#models_centent  ul li:nth-child(3){
    transition:opacity 1.5s 0.1s;
}
#models_centent  ul li:nth-child(4){
    transition:opacity 2s 0.3s;
}
#models_centent  ul li:nth-child(5){
    transition:opacity 2.5s 0.3s;
}
#models_centent  ul li:nth-child(6){
    transition:opacity 3s 0.5s;
}
#models_centent  .box3Change ul li{
    opacity: 1;
    
}
/* 当滑动到第三页所触发的动画 */
/* 竖线 */
#models_centent  ul .shu{ 
    background-color: #fff;
    display: block;
}
#models_centent  ul li:nth-child(3) div::after{
    content: '';
    display: block;
    clear: both;
}
/* 设置字体大小 */
#models_centent  ul li div,
#models_centent  ul li div i{
    font-size: 25px;
    font-weight: 500;
}
#models_centent  ul li p{
    font-size: 12px;
}
/* 进入第三页动画 */
#models_centent ul li{
    opacity: 0;
}
#models_centent .ul li{
    opacity: 1;
}
#models_centent{
    float: right;
}
@media (max-width: 420px) {
    #models_centent ul li div, 
    #models_centent ul li div i{
        font-size: 20px;
    }
    #models_centent ul li{
        margin:0 7px;
    }
    #models_centent .ul{
        bottom: 10px;
    }
    #models_centent ul li div span{
        display: block;
    }
}
</style>