<template>
  <div class="backgroud">
    <van-nav-bar
      title="选择城市"
      left-text="返回"
      left-arrow
      @click-left="onClickLeft"
    ></van-nav-bar>

    <form action="/">
  <van-search
    v-model="value"
    show-action
    placeholder="请输入搜索关键词"
    @search="onSearch"
    @cancel="onCancel"
  />

  <van-divider :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }" v-if="history.length!=0">
  历史记录
</van-divider>
  <van-divider :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }">
  热门城市
</van-divider>

<van-grid :gutter="10">
  <van-grid-item v-for="value in hotcity" :key="value" :text="value" @click="selectcity(value)"/>
</van-grid>
</form>
  </div>
</template>

<script>
export default {
data() {
    return {
      value: '',
      history:[],
      hotcity:['杭州','绍兴','宁波','温州','上海','金华','台州','湖州']
    };
  },
  methods:{
    onClickLeft() {
      this.$router.go(-1);
    },
    onSearch(val) {
      this.$toast(val);
    },
    onCancel() {
      this.$toast('取消');
    },
    selectcity(value){
      var name = this.$route.params.city;
      sessionStorage.setItem(name,value);
      this.$router.push({
      name: 'index'
      })
    }
  }
}
</script>

<style lang="less" scoped>
.backgroud{
  background-color: #F7F8FA;
  height: 800px;
  overflow: hidden;
}
/deep/.van-nav-bar{
  color: whitesmoke;
  background-color: #2AB3EF;
}

/deep/.van-grid-item__text{
  font-size: 16px;
}
/deep/.van-nav-bar /deep/.van-icon{
  color: #f4f4f4;
}
</style>