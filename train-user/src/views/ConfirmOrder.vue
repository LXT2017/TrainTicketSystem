<template>
  <div class="bac">
    <van-nav-bar
      title="确认订单">
     <template #left>
    <i class="el-icon-arrow-left" @click="back"></i>
  </template>
    </van-nav-bar>
    <div class="traindate">{{this.traindate}}</div>
    <!-- 订单卡片 -->
  <div class="card">
         <div  class="text item">

          <el-card class="box-card">
              <van-row>
                <van-col span="4" class="otherinfo">{{order.name}}</van-col>
                <van-col span="7" class="city">{{order.startcity}}</van-col>
                <van-col span="6"><i class="trainicon" /></van-col>
                <van-col span="7" class="city">{{order.endcity}}</van-col>
              </van-row>
              <van-row >
                <van-col span="7" offset="4" class="times">{{order.starttime}}</van-col>
                <van-col span="6" id="traindate">{{order.duration}}</van-col>
                <van-col span="7"  class="times">{{order.endtime}}</van-col>
              </van-row>
              <van-divider dashed/>
              <el-radio-group v-model="radio" v-if="priceshow">
              <el-radio-button label="1">一等 ￥
                <span class="pricetrue">{{fprice}}</span>
                <span class="price">{{order.fprice}}</span>
              </el-radio-button>
              <el-radio-button label="2">二等 ￥
                <span class="pricetrue">{{sprice}}</span>
                <span class="price">{{order.sprice}}</span>
              </el-radio-button>
              </el-radio-group>
               <el-radio-group v-model="radio" v-else>
              <el-radio-button label="1">一等 ￥{{order.fprice}}</el-radio-button>
              <el-radio-button label="2">二等 ￥{{order.sprice}}</el-radio-button>
              </el-radio-group>
        </el-card>
      </div> 
        <van-field
        readonly
        clickable
        name="picker"
        :value="value"
        label="选择乘客"
        placeholder="点击选择乘车人"
        @click="selectuser"
      />
     </div>


  <van-submit-bar button-text="提交订单" @submit="onSubmit" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      priceshow:false,
      discount:1,
       radio: '1',
        value: '',
      showPicker: false,
      traindate:'2020/5/30',
       order:{
        id:'',
        state:3,
        name:'G100',
        startcity:'杭州',
        starttime:'16.37',
        endcity:'绍兴',
        endtime:'17:35',
        duration:'23',
        fnum:'33',
        snum:'44',
        fprice:33,
        sprice:19
      },
      userlist:[{
        id:'',
        realname:'张三',
        idcard:'330612154722541',
        type:0
      }]
    };
  },
  created(){
      this.traindate=localStorage.getItem('traindate');
      this.order=JSON.parse(localStorage.getItem('trainorder'))
      if(JSON.parse(localStorage.getItem('selectuser'))){
        var user = JSON.parse(localStorage.getItem('selectuser'))
         this.value=user.name+"          "+user.idcard;
      }
      this.getdiscount()
       
  },
  computed: {
    fprice(){
      return this.order.fprice*this.discount;
    },
    sprice(){
      return this.order.sprice*this.discount;
    }
  },
  methods: {
    back(){
      this.$router.go(-1);
    },
    getdiscount(){
      let that=this;
      console.log(this.traindate)
      this.$axios.get('/train/holidaydiscount',{
        params:{traindate:this.traindate}
      }).then(res=>{
        that.discount=res.data.data;
        if(that.discount==1){
          that.priceshow=false;
        }else{
          that.priceshow=true;
        }
      }).catch(error=>{
        console.log(error);
      })
    },
    selectuser(){
      this.$router.push("selectuser");
    },
    onSubmit(){
      // 提交延迟
      this.$toast.loading("提交中");
      let price;
      let seattype;
      if(JSON.parse(localStorage.getItem('selectuser'))==null){
        this.$toast.fail('请输入乘车人')
      }
      let id = JSON.parse(localStorage.getItem('selectuser')).id;
      
      let orderId = JSON.parse(sessionStorage.getItem('user')).id;
      if(this.radio==1){
          price = this.order.fprice*this.discount;
          seattype = 1;
      }else{
        price = this.order.fprice*this.discount;
          price = this.order.sprice;
          seattype = 2;
      }
      let that=this;
      //接口查询
      this.$axios({
        method:'post',
        url:'/order/submitorder',
        data:{
            price:price,
            traindate:this.traindate,
            userId:id,
            trainId:this.order.id,
            seattype:seattype,
            orderId:orderId
        }
      }).then(function(res){
        if(res.data.code==200){
          console.log("插入成功");
          //跳转的页面写在此处             
          that.$router.push('index');
        }else if(res.data.code==501){
           that.$toast("该类票已经售罄");
        }else if(res.data.code==303){
           that.$toast("该用户审核未通过");
        }
      }).catch(function (error) {
          console.log(error);
      });
    // 延迟跳转
      const timejump = 1;
        if(!this.timer){
            this.count = timejump ;
            //this.show = false;
            this.timer = setInterval(()=>{
            if(this.count > 0 && this.count <= timejump ){
                this.count--;
            }else{
                //this.show = true;
                clearInterval(this.timer);
                this.timer = null;
            }
          },1000)
    }
  },
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

.traindate{
  position: fixed;
  top:45px;
  height: 22px;
  font-size: 16px;
  width: 100%;
  background-color:  rgba(0, 170, 238, 1);
  border: none;
  color: whitesmoke;
  z-index: 1;
}

.card{
  height: 100%;
  padding-top: 70px;
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
.ticket{
  font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
  font-size: 13px;
}
.van-field{
  margin: 10px;
  border-radius: 7px;
  width: 95%;
}
.van-submit-bar__button{
  width: 100% ;
}

.price{
  text-decoration: line-through;
  font-size: 10px;
  color: rgb(63, 63, 63);
  margin-left: 5px;
}
.pricetrue{
  font-size: 16px;
  color: rgb(252, 92, 92);
}
</style>