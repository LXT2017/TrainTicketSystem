<template>
  <div>
       <van-nav-bar
      title="选择乘客">
     <template #left>
    <i class="el-icon-arrow-left" @click="back"></i>
  </template>
    </van-nav-bar>
    
    <van-pull-refresh v-model="isLoading" @refresh="onRefresh"  v-if="showflag">
      <van-icon name="add-o" /><div class="adduser" @click="add">添加乘车人</div>
      <div class="flush">下拉刷新可获取乘车人最新状态</div>
      <div v-for="(item,index) in userlist" :key="index" @click="select(index)">
        <van-row  gutter="20">
        <van-col span="8">{{item.name}}</van-col>
        <van-col span="8">{{item.idcard}}</van-col>
        <van-col span="8">
          <span v-if="item.type==0">成人</span>
          <span v-else>学生</span>
        </van-col>
      </van-row>
      </div>
      <div class="test"></div>
    </van-pull-refresh>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showflag:false,
      isLoading: false,
      userlist:[{
        id:'',
        name:'张三',
        idcard:'330612154722541',
        type:0
      },{
        id:'',
        name:'李四',
        idcard:'330612154722541',
        type:1
      }]
    }
  },
  created(){
    // 获取数据
      // 接口查询
    let that = this;
    if(JSON.parse(sessionStorage.getItem('user'))){
       var id = JSON.parse(sessionStorage.getItem('user')).id;
      }

    // 接口
    this.$axios({
      method:'get',
      url:'/user/querypassenger',
      params:{
         id:id
      }
    }).then(function(res){
      // console.log(res);
      if(res.data.code==200){
        that.userlist=res.data.data;
        // 调用后渲染
        that.showflag=true;
      }
    }).catch(function (error) {
        console.log(error);
        });
        
  },
  methods:{
    onRefresh() {
      setTimeout(() => {
        this.$toast('刷新成功');
        this.isLoading = false;
        this.count++;
      }, 1000);
    },
    add(){
      this.$toast('功能完善中')
    },
    back(){
      this.$router.go(-1);
    },
    select(index){
      localStorage.setItem('selectuser',JSON.stringify(this.userlist[index]));
      this.$router.go(-1);
    }
  }
}
</script>

<style lang="less" scoped>
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
.van-pull-refresh{
  height: 100%;
  padding-top: 45px;
}
.van-icon{
  font-size: 13px;
}
.adduser{
  display: inline-block;
  height: 40px;
  line-height: 43px;
}
.flush{
  background-color: #fbfbfb;
  height: 22px;
  font-size: 12px;
  line-height: 23px;
}
.van-row{
  padding: 10px 0;
  background-color: #fcfefc;
  border-bottom: 1px solid #f1f1f1;
  line-height: 23px;
}
.test{
  height: 80px;
}
</style>