<template>
    <div id="models_right">
        <div :class="change">
            <p><slot name='title'></slot></p>
            <h2 class="pb-3"><slot name='small-title'></slot></h2>
            <p><slot name='center'></slot></p>
        </div>
        <div :class="change">
            <div>
                <button><i class="iconfont">&#xe624;</i></button>
                了解更多
            </div>
            <div>
                <router-link to="/drive"><button>预约试驾</button></router-link>
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
        changeRight(live){
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
/* 左边进入前位置*/
#models_right > div:first-child,
#models_right > div:last-child{
    position: relative;
    top:50px;
    opacity: 0;
    transition: 0.5s ease-out;
}
#models_right > div:last-child{
    transition: 0.5s ease-out 0.5s;
}
/* 左边进入后位置*/
#models_right > .change:first-child,
#models_right > .change:last-child{
    position: relative;
    top:0px;
    opacity: 1;
}
/* 了解更多按钮 */
#models_right div:last-child div:first-child button{
    width: 40px;
    height: 40px;
    border-radius:50%;
}
/* 左边盒子的样式 */
#models_right{
    height: 100%;
    background-color: #fff;
    padding:50px 50px;
    display: flex;
    flex-direction: column;
    justify-content:space-between;
}
/* 左边盒子底部的按钮 */
#models_right div:last-child{
    display: flex;
    font-size: 13px;
    flex-wrap: nowrap;
    justify-content:space-between;
}
/* 立即订购按钮 */
#models_right button{     /*第二页立即预约按钮*/
    width: 150px;
    height: 40px;
    border-radius: 20px;
    border:3px solid #000;
    margin-top:20px;
    transition: 0.3s;
    font-size: 13px;
    background-color: transparent;
}
#models_right  button:hover{
    background-color: #000;
    color:#fff;
}

@media(max-width:420px){
    #models_right{
        padding:35px 10px 10px;
    }
    #models_right h2{
        font-size: 20px;
        font-weight: 600;
    }
}
</style>