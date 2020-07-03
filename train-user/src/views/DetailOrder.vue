<template>
  <div class="bac" v-if="showflag">
    <van-nav-bar
      title="订单详情">
     <template #left>
    <i class="el-icon-arrow-left" @click="back"></i>
  </template>
    </van-nav-bar>
    <!-- 订单卡片 -->
    
  <div class="card">
         <div  class="text item">
          <div class="state">
            <div>{{this.states}}</div>
            <div class="price">￥{{order.price}}</div>
          </div>
          <el-card class="box-card">
              <van-row>
                <van-col span="4" class="otherinfo">{{order.trainname}}</van-col>
                <van-col span="7" class="city">{{order.startcity}}</van-col>
                <van-col span="6"><i class="trainicon" /></van-col>
                <van-col span="7" class="city">{{order.endcity}}</van-col>
              </van-row>
              <van-row >
                <van-col span="7" offset="4" class="times">{{order.traindate}} {{order.starttime}}</van-col>
                <van-col span="6" id="traindate">{{order.duration}}</van-col>
                <van-col span="7"  class="times">{{order.traindate}} {{order.starttime}}</van-col>
              </van-row>
               <van-row >
              <van-col span="8" offset="16" class="otherinfo">{{order.carriage}}车{{order.seat}}座</van-col>
               </van-row>
              <van-divider dashed/>
              <van-row class="userinfo">
                <van-col span="6" >{{order.realname}}</van-col>
                <van-col span="18"  offse="5">身份证:{{order.idcard}}</van-col>
              </van-row>
               <van-row class="userinfo">
                <van-col span="6" >{{order.seattype}}等座</van-col>
                <van-col span="6" offset="6">总价  ￥{{order.price}}</van-col>
              </van-row>
              
             
        </el-card>
         </div>
         <van-button icon=edit type="info" @click="editticket" :disabled="orderstate1">改签</van-button>
         <van-button icon=after-sale type="info" @click="returnticket" :disabled="orderstate2">退票</van-button>
  </div>
  </div>
</template>

<script>
import { Dialog } from 'vant';
export default {
  data() {
    return {
      detailorderid:'',
      showflag:false,
       order:{
        id: 1100000004,
        idcard: "330214568754123589",
        realname: "小李",
        seattype: 2,
        status: 2,
        carriage: 1,
        seat: "01A",
        traindate: "2020-06-23",
        createtime: "2020-06-21T09:51:31.000+0000",
        trainname: "G102",
        price: 25.00,
        orderId: 1,
        duration: "25分种",
        startcity: "杭州",
        starttime: "15:11:55",
        endcity: "宁波",
        endtime: "15:59:52",
        trainid:'1'
      }
    };
  },
  created(){
    if(sessionStorage.getItem('detailorderid')!=null){
      this.detailorderid=sessionStorage.getItem('detailorderid');
      this.queryorder();
    }
  },
  computed:{
    states(){
      var state='';
       if(this.order.status==1)
        state='已预订';
      if(this.order.status==2)
        state='已支付';
      if(this.order.status==3)
        state='已出行';
      if(this.order.status==4)
        state='已退款';
      if(this.order.status==5)
        state='已改签';
      return state;
    },

    orderstate1(){
      if(this.order.status==2){
          return false;
      }
      return true;
    },
    orderstate2(){
      if(this.order.status==5||this.order.status==2){
          return false;
      }
      return true;
    }

  },
  methods: {
    back(){
      this.$router.push("order");
    },
    editticket(){
      sessionStorage.setItem('stratcity',this.order.startcity);
      sessionStorage.setItem('endcity',this.order.endcity);
      this.$router.push('/changeticket');
    },
    returnticket(){
      Dialog.confirm({
      title: '退票确认',
      message: '是否选择退票',
    }).then(() => {
        this.deleteorder();
      }).catch(() => {
        // on cancel
        });
    },
  // 查询订单接口
  queryorder(){
     let that = this;
      // 下单id
      // 接口查询
      this.$axios({
        method:'get',
        url:'/order/getdetailorder',
        params:{
          id:this.detailorderid
        }
      }).then(function(res){
        if(res.data.code==200){
          that.order = res.data.data
           that.showflag=true;
        }
      }).catch(function (error) {
          console.log(error);
      });
  },
  // 删除订单接口
  deleteorder(){
    let that=this;
      this.$axios({
        method:'post',
        url:'/order/deleteorder',
        data:this.order
      }).then(function(res){
        if(res.data.code==200){
          that.$toast("退票成功");
          that.$router.push('/order')
        }
      }).catch(function (error) {
          console.log(error);
      });
  }
}
}
</script>

<style lang="less" scoped>

.bac{
  background-color:#f8f8f8;
  position: fixed;
  height: 100%; 
  width: 100%;
}
.van-nav-bar{
  background-color: rgba(0, 170, 238, 1);
  position: fixed;
  width: 100%;
}
/deep/.van-nav-bar__title{
  color: white;
}
/deep/.van-tab{
  background-color:#f8f8f8;
}
.el-icon-arrow-left{
 margin-left: 0 !important;
 color: white;
 font-size: 22px;
}
/deep/.el-card__body{
  padding:8px;
}

.state{
  display: flex;
  justify-content: space-between;
  padding: 10px 20px;
  font-size: 20px;
  background-color: white;
  border-radius: 10px;
  margin: 0 10px;
}
.price{
  color: red;
}
.card{
  height: 100%;
  padding-top: 55px;
}
.box-card{
  background: #fbfbfb;
  border-radius: 10px;
  margin: 10px;
}
.trainicon{
  background-color: red;
  height: 20px;
  width:65px;
  display: inline-block;
  background: url('../assets/order/arrive1.png') no-repeat;
}
.city{
  font-size: 20px;
  font-weight: bold;
}
.otherinfo{
  font-size: 18px;
  margin-top: 5px;
}
#traindate{
  color: #aaa;
  font-size: 14px;
}
.times{
  color: rgba(0, 170, 238, 1);
  font-size: 13px;
}
.userinfo{
  font-size: 14px;
}
.van-button{
  padding: 0 40px;
  margin: 10px 20px;
}
</style>