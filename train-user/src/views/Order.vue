<template>
  <div class="bac" v-if="showflag">
     <van-nav-bar title="我的订单"></van-nav-bar>    
      <!-- 刷新组件 -->
      <van-pull-refresh v-model="isLoading" @refresh="onRefresh">

      <van-tabs v-model="active" animated @change="changeactive">
      <van-tab v-for="(itemz,indexz) in tabs" :key="indexz" :title="itemz">

         <div v-if="ordernum[indexz]===0"> <van-empty description="来到了没有出行的荒野" /></div>
         <div  class="text item" v-for="(item,index) in orderlist" :key="index" @click="detail(item.id)">

          <el-card class="box-card" v-if="indexz==0||indexz==item.status||(indexz==2&&item.status==5)">
              <van-row><van-col span="4" class="otherinfo">{{item.trainname}}</van-col></van-row>
              <van-row>
                <van-col span="8" class="city">{{item.startcity}}</van-col>
                <van-col span="8"><i class="trainicon" /></van-col>
                <van-col span="8" class="city">{{item.endcity}}</van-col>
              </van-row>
              <van-row class="otherinfo">
                <van-col span="8">{{item.starttime}}</van-col>
                <van-col span="8">{{item.traindate}}</van-col>
                <van-col span="8">{{item.endtime}}</van-col>
              </van-row>
              <van-row>
                <van-col span="8" class="otherinfo">{{item.carriage}}车{{item.seat}}座</van-col>
                <van-col span="8" offset="8" class="otherinfo">合计<span class="price">￥{{item.price}}</span></van-col>
               
                 <van-col span="8" class="otherinfo">{{item.realname}}</van-col>
                <van-col span="8" offset="8" class="otherinfo">
                  <van-button class="delbutton" plain  round hairline size="small" type="info" @click.stop="delorder(item)">删除订单</van-button>
                  </van-col>
              </van-row>
        </el-card>
        

      </div>
     
       
        
      </van-tab>
    </van-tabs>
    </van-pull-refresh>
  </div>
</template>

<script>
import { Dialog } from 'vant';
export default {
  data() {
    return {
      ordernum:[0,0,0,0,0],
      showflag:false,
      active:2,
       count: 0,
      isLoading: false,
      tabs:["全部","待付款","待出行","已完成","已退款"],
      orderlist:[{
        id:'1',
        status:2,
        trainname:'G100',
        startcity:'杭州',
        starttime:'16.37',
        endcity:'绍兴',
        endtime:'17:35',
        price:25.3,
        traindate:"2020-10-05",
        carriage:1,
        seat:'01A',
        trainid:'1'
      }]

    };
  },
  created(){
    if(sessionStorage.getItem('orderactive')){
      this.active=sessionStorage.getItem('orderactive')
    }
   this.queryOrders();
  },
  methods: {
    changeactive(){
      sessionStorage.setItem('orderactive',this.active);
    },
    countordernum(){
      for (let index = 0; index < this.orderlist.length; index++) {
        if(this.orderlist[index].status==1)
          this.ordernum[1]+=1;
        if(this.orderlist[index].status==2||this.orderlist[index].status==5)
          this.ordernum[2]+=1;
        if(this.orderlist[index].status==3)
          this.ordernum[3]+=1;
        if(this.orderlist[index].status==4)
          this.ordernum[4]+=1;
      }
    this.ordernum[0]=this.orderlist.length;
    },

    // 下拉刷新
    onRefresh() {
      this.queryOrders();
      setTimeout(() => {
        this.$toast('刷新成功');
        this.isLoading = false;
      }, 1000);
    },



    // 删除订单
    delorder(val){
     
      console.log(val)
      let that = this;
      Dialog.confirm({
      message: '是否删除该订单',
    }).then(() => {
       var date = new Date();
      var nowdate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
      if(new Date(val.traindate)>=new Date(nowdate)&&val.status!=4){
          this.$toast.fail("该订单尚未出行，不可删除");
          return;
      }     
      this.$axios({
        method:'post',
        url:'/order/delorder',
        data:this.$qs.stringify({id:val.id})
      }).then(function(){
        that.queryOrders();
       that.$toast("删除成功");
      }).catch(function (error) {
          console.log(error);
      });
    }).catch(() => {
        // on cancel
      });
    
    },

    // 订单详情
    detail(id){
      sessionStorage.setItem('detailorderid',id);
     this.$router.push({
      name: 'detailorder'
      })
    },


    queryOrders(){
      let that = this;
      // 下单id
      let orderId = JSON.parse(sessionStorage.getItem('user')).id;
      // 接口查询
      this.$axios({
        method:'get',
        url:'/order/queryorders',
        params:{
          orderId:orderId
        }
      }).then(function(res){
        // console.log(res)
        if(res.data.code==200){
          that.orderlist = res.data.data
          that.countordernum();
          that.showflag=true;
        }
      }).catch(function (error) {
          console.log(error);
      });

    }
  },


}
</script>

<style lang="less" scoped>
.bac{
  background-color:#f8f8f8;
  position: relative;
  //height: 100%;
  padding-bottom: 40vh; 
}
.van-pull-refresh{
  height: 100%;
  padding: 45px 0;
}
.van-nav-bar{
  background-color: rgba(0, 170, 238, 1);
    position: fixed;
  width: 100%;
  z-index: 99;
}
/deep/.van-nav-bar__title{
  color: white;
}
/deep/.van-tab{
  background-color:#f8f8f8;
}
/deep/.el-card__body{
  padding:8px;
}
.van-pull-refresh{
  height: 100%;
}
.box-card{
  background: #fbfbfb;
  border-radius: 10px;
  margin: 15px;
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
  font-size: 14px;
  margin-top: 5px;
}
.price{
  font-size: 17px;
}
.delbutton{
  margin-top: 10px;
}
</style>