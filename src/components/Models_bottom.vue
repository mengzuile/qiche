<template>
    <div id="models_bottom">
        <div :class="change" class="row mx-2">
            <!-- 右边标题 -->
            <div class="left col-12 col-md-4 col-xl-3 offset-xl-2 offset-0 offset-md-1">
                <p><slot name="title"></slot></p>
                <h2><slot name='small-title'></slot></h2>
                <p class="d-block d-md-none"><slot name='center' ></slot></p>
                <div>
                    <div><!-- 按钮 -->
                        <button><i class="iconfont">&#xe624;</i></button>
                        了解更多
                    </div>
                    <div>
                        <router-link to="/drive"><button>预约试驾</button></router-link>
                    </div>
                </div>
            </div>
            <!-- 左边详情 -->
            <div class="right col-12 col-md-6 col-xl-5 d-none d-md-block">
                <p><slot name='center'></slot></p>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            change:{
                change:false
            }
        }
    },
    methods:{
        changeBottom(live){
            if(live){
                this.change.change=true
            }else{
                this.change.change=false
            }
        }
    }
}
</script>

<style>
#models_bottom > div{
    display: flex;
    margin-top:100px;
    transition:opacity 0.5s;
    opacity: 0;
}
/* 进入页面动画 */
#models_bottom  > .change{
    margin-top:50px;
    opacity: 1;
}
#models_bottom  .left{
    float: right;
}
#models button{  /*第三页立即预约按钮*/
    width: 150px;
    height: 40px;
    border-radius: 20px;
    border:3px solid #000;
    margin-top:20px;
    transition: 0.3s;
    font-size: 13px;
    background-color: transparent;
}
#models button:hover{
    background-color: #000;
    color:#fff;
}
/* 了解更多按钮 */
#models_bottom  .left > div >div{
    float: left;
    font-size: 13px;
}
#models_bottom  .left div:first-child{
    margin-right:10px;
}
#models_bottom  .left div:first-child button{
    width: 40px;
    height: 40px;
    border-radius:50%;
}
@media (max-width:420px) {
    #models_bottom .left h2{
        font-size: 20px;
        font-weight: 900;
        margin-bottom:40px;
    }
    #models_bottom .left p{
        font-size: 13px;
    }
}

</style>