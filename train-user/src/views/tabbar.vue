<template>
  <div>
    <router-view></router-view>
    <div class="footer">
      <van-tabbar v-model="active">
      <van-tabbar-item v-for="(item,index) in tabbars" :key="index" @click="tab(index,item.path)">
      <span>{{item.name}}</span>
      <template #icon="props">
        <img :src="props.active ? item.active : item.inactive" />
      </template>
    </van-tabbar-item>
   
    </van-tabbar>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      currIndex:0,
      active: 0,
      tabbars: [{
        path: 'index',
        name:'首页',
        active: require('../assets/trainactive.png'),
        inactive: require('../assets/train.png'),
      },
      {
        path: 'order',
        name:'订单',
        active: require('../assets/orderactive.png'),
        inactive: require('../assets/order.png'),
      },
      {
        path:'mine',
        name:'我的',
        active: require('../assets/mineactive.png'),
        inactive: require('../assets/mine.png'),
      }
      ],
    };
  },
  created(){
    // 解决订单详情返回tabbar问题
    if(sessionStorage.getItem('index')){
      this.active=parseInt(sessionStorage.getItem('index'));
      this.currIndex=this.active;
    }
  },
  methods:{
    // 简单判断，防止同一页面点击多次报错
    tab(index, val) {
      if(this.currIndex == index ){
        return;
      }
      sessionStorage.setItem('index',index);
      this.currIndex=index;
      this.$router.push(val);
    }
  }
}
</script>
<style lang="less" scoped>
</style>