<template>
<div class="bac">

    <van-nav-bar title="个人中心"></van-nav-bar>    
    <div class="headback">
        <van-image
          round
          width="100px"
          height="100px"
          :src="user.head"
        />
        <div class="username">{{user.name}}</div>
        <van-button plain  round hairline size="small" type="info" @click="editinfo">编辑资料</van-button>
    </div>
    <van-cell is-link @click="showPopup">实名核验</van-cell>
    <van-cell is-link @click="showPopup">我的餐饮·特产</van-cell>
    <van-cell is-link @click="showPopup">温馨服务</van-cell>
    <van-cell is-link @click="showPopup">关于</van-cell>
    <van-cell is-link @click="logout">登出</van-cell>
  </div>
</template>

<script>
export default {
  data() {
    return {
      endcity:"杭州",
      background:require("../assets/bac.jpg"),
      user:{
        name:'张三',
        head:require('../assets/mineicon/head.jpg')
      }
    }
  },
  created() {
    if(JSON.parse(sessionStorage.getItem('user'))!==null)
      // 从localstorage获取登录信息
      this.user.name=JSON.parse(sessionStorage.getItem('user')).username;
  },
  methods:{
    editinfo(){
      this.$toast.loading("现在还不可以哦")
    },
    showPopup(){
      this.$toast.loading("功能开发中");
    },
    logout(){
      this.$router.push("/")
    }
  },
  
}
</script>

<style lang="less" scoped>
.bac{
  background-color: #F0F4F3;
  position: fixed;
  height: 1000px;
  width: 100%;
}
.van-nav-bar{
  background-color: rgba(0, 170, 238, 0.886);
}
/deep/.van-nav-bar__title{
  color: white;
}
.headback{
  background: url('../assets/bac.jpg');
  width: 100%;
  height: 220px;
  position: relative;
  .van-button{
    background-color: transparent;
    border-color: white;
    color: white;
    margin-top: 8px;
  }
}
.van-image{
  margin-top: 20px;
}
.username{
  color: white;
  font-size: 20px;
  margin-top: 10px;
}
.van-cell{
  margin: 3px;
}
</style>