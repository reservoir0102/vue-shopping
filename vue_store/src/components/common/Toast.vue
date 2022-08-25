<template>
  <div class="toast">
      {{msg}}
  </div>
</template>

<script>
export default {
    name:'Toast',
    // props:{
    //     msg:{
    //         type:String,
    //         required:true
    //     },
    //     duration:{
    //         type:Number,
    //         default:()=>1500
    //     }
    // }
    data(){
        return {
            msg:''
        }
    }
}
</script>

<style lang="scss" scoped>
    .toast{
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        max-width: 4rem;
        padding:.16rem .2667rem;
        font-size: .3733rem;
        color: #fff;
        line-height: .64rem;
        border-radius: .1333rem;
        background-color: rgba(0,0,0,.6);
        z-index: 999;
    }
</style>>

