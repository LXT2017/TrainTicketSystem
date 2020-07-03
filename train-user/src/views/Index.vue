<template>
  <div class="index">
    <!-- 头部搜索框 -->
    <div class="header" :style="{background: backgroundColor}">
      <i class="QR"></i>
     <van-search
     id="searchBar"
     readonly
      v-model="value"
      shape="round"
      background="transparent"
      placeholder="请输入搜索关键词"
      @click="search"
    />
      <van-icon class="chat" name="chat-o" dot  size="22px"/>
    </div>
    

    <div class="bac">
      <!-- 轮播图 -->
    <div class="swipe">
      <van-swipe :autoplay="3000">
      <van-swipe-item v-for="(image, index) in images" :key="index">
        <img v-lazy="image"/>
      </van-swipe-item>
    </van-swipe>
    </div>
    <!-- 订购卡片 -->
    <div class="card">

      <div class="firstline">
        <div class="name1">
         <van-field readonly :value="startcity" @click="selectcity('startcity')"/>
        </div>
        <div  @click="reverse"><i class="reverse"></i></div>
        
        <div class="name1">
          <van-field :value="endcity" readonly @click="selectcity('endcity')"/>
        </div>
      </div>

      <div class="secondline">
        <van-cell title="出发日期" :value="date" @click="show = true" />
        <van-calendar v-model="show" @confirm="onConfirm" :show-confirm="false"  	/>
    </div>
     <el-checkbox-group v-model="checkList">
      <el-checkbox label="只看高铁"></el-checkbox>
      <el-checkbox label="学生票"></el-checkbox>
    </el-checkbox-group>
      <van-button class="query" color="linear-gradient(to right,#29B8EF , #4b4bff)" round @click="query">查询</van-button>
    </div>

    <!-- 小图标按钮 -->
     <div>
       <van-grid :gutter="10" :border="false">
        <van-grid-item v-for="(item,index) in icons" :key="index"
        :icon="item.icon" :text="item.text" :badge="item.badge"/>
      </van-grid>
      </div>
      <!-- 通知栏信息 -->
      <van-notice-bar  left-icon="volume-o" :scrollable="false">
      <van-swipe
        vertical
        class="notice-swipe"
        :autoplay="3000"
        :show-indicators="false"
      >
        <van-swipe-item v-for="(item,index) in news" :key="index">
            {{item.text}}
        </van-swipe-item>
      </van-swipe>
    </van-notice-bar>
    <!-- 最下面大图标 -->
    <van-grid :border="false" :column-num="1" >
    <van-grid-item >
      <div class="gridradius">
      <van-image  :src="lunch" />
      </div>
    </van-grid-item>
  </van-grid>

    <!-- 2行2列 -->
    <van-grid class="gridlast" :column-num="2">
      <van-grid-item v-for="(item,index) in photos" :key="index">
         <div class="gridradius">
      <van-image  :src="item.src"/>
      </div>
      </van-grid-item>
    </van-grid>
      </div>
    
  </div>
</template>

<script>
export default {
  data() {
    return {
    
      backgroundColor:'transparent',
      // 城市
      startcity:'绍兴',
      endcity:'杭州',
      // 日期
      date: '',
      show: false,
      checkList: [],

      
      icons:[{
          badge:'1',
          text:"温馨服务",
          icon:require('../assets/indexicon/serve.png')
      },{
          badge:'',
          text:"车站大屏",
          icon:require('../assets/indexicon/screen.png')
      },{
          badge:'',
          text:"餐饮·特产",
          icon:require('../assets/indexicon/restaurant.png')
      },{
          badge:'',
          text:"全部",
          icon:require('../assets/indexicon/all.png')
      }
      ],
      news:[{
          text:"1000年前的驴友怎么游"
      },{
          text:"横穿中国要花多少钱"
      }
      ],
      value:'',
      images: [
        require('../assets/indexicon/swiper1.jpg'),
        require('../assets/indexicon/swiper2.jpg'),
        require('../assets/indexicon/swiper3.jpg')
      ],
      lunch:require('../assets/indexicon/lunch.jpg'),
      photos:[{
          src:require('../assets/indexicon/grid1.jpg')
      },{
          src:require('../assets/indexicon/grid2.png')
      },{
          src:require('../assets/indexicon/grid3.jpg')
      },{
          src:require('../assets/indexicon/grid4.jpg')
      }],
      count:2 //倒计时
    }
  },
  mounted() {
    //首先，在mounted钩子window添加一个滚动滚动监听事件
    window.addEventListener("scroll", this.handleScroll);
  },
  created(){
    if(sessionStorage.getItem("startcity")!=null){
      this.startcity=sessionStorage.getItem("startcity");
    }
    if(sessionStorage.getItem("endcity")!=null)
      this.endcity=sessionStorage.getItem("endcity");
    this.nowDate();
  },

  methods: {
    //然后在方法中，添加这个handleScroll方法来获取滚动的位置
    handleScroll() {
      let scrollTop =
        window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
      //let offsetTop = document.querySelector("#searchBar").offsetTop;
      //设置背景颜色的透明读
      if (scrollTop) {
        this.backgroundColor = `rgba(0, 170, 238,${scrollTop / (scrollTop + 40)})`;
      } else if (scrollTop == 0) {
        this.backgroundColor = "transparent";
      }
    },
  //由于是在整个window中添加的事件，所以要在页面离开时摧毁掉，否则会报错
  beforeDestroy() {
    window.removeEventListener("scroll", this.handleScroll);
  },

  nowDate(){
    var nowDate = new Date();
    let date = {
        year: nowDate.getFullYear(),
        month: nowDate.getMonth() + 1,
        day: nowDate.getUTCDate()
    }
    this.date = date.year+'-'+date.month+ '-'+date.day;
  },

  formatDate(date) {
      return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getUTCDate() + 1}`;
    },
  onConfirm(date) {
    this.show = false;
    this.date = this.formatDate(date);
  },
  search(){
    this.$toast("尽请期待");

  },
  selectcity(name){
     this.$router.push({
      name: 'citylist',
      params: {
          city: name
        }
      });
  },
  reverse(){
    var temp = this.startcity;
    this.startcity = this.endcity;
    this.endcity=temp;
  },
  query(){
    this.$toast.loading({
    message: '查询中....',
    forbidClick: true,
    });
    var type=2;
    if(this.checkList.indexOf('只看高铁')!=-1){
      type=0;
    }
    sessionStorage.setItem('traintype',type)
    sessionStorage.setItem('startcity',this.startcity);
    sessionStorage.setItem('endcity',this.endcity);
    localStorage.setItem("traindate",this.date);
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
                //跳转的页面写在此处             
                 this.$router.push('querytrain');
            }
          },1000)
     }
  },
  }
}
</script>
<style lang="less" scoped>
.index{
  margin-bottom: 40px;
}

.header{
  position: fixed;
  top: 0;
  left: 0;
  // background-color: transparent;
  height: 45px;
  width: 100%;
  display: flex;
  justify-content: space-between;
   z-index: 1;
}
.QR{
  margin: 10px;
  display: inline-block;
  height: 22px;
  width: 22px;
  background-image: url('../assets/QR.png');
  background-size: cover;
  position: relative;
}
.chat{
  margin: 10px;
  opacity: 0.8;
  color: #eee;
}
.van-search{
  width: 80%;
  padding: 8px 1px;
  opacity: 0.8;
}

.bac{
  position: relative;
  z-index: 0;
}
.swipe{
  height: 458px;
  background-color: #fffffa;
  img[lazy="loaded"] {
		width: 100%;
    height: 202px;
    border-radius:  0% 0% 10% 10%;
  }
  
}
.card{
  margin: 0 6%;
  position: absolute;
  top: 160px;
  // opacity: 0.98;
  background-color: #fffffa;
  height: 280px;
  width: 88%;
  border-radius: 10px ;
  box-shadow:1px 2px 10px 4px #ccc;
}

.firstline{
  border-bottom: 1px solid #ccc;
  margin: 0 20px;
  display: flex;
  justify-content: space-between;
  padding: 10px 5px;
  .name1{
    width: 38%;
    font-size: 30px;
    margin: 5px;
    line-height: 50px;
    font-weight: bold;
  }
  .reverse{
    margin: 20px;
    display: inline-block;
    height: 22px;
    width: 22px;
    background-image: url('../assets/QR.png');
    background-size: cover;
    position: relative;
    background-image: url('../assets/indexicon/reverse.png');
    .van-field{
      padding: 0;
    }
}
/deep/ .van-field__control{
  font-size: 25px;
  text-align: center;
}
}
.secondline{
  padding: 5px 0;
  border-bottom: 1px solid #ccc;
  margin: 0 20px;
  .van-cell{
    background-color: #fffffa;
    color: rgb(170, 165, 165);
  }
}
.el-checkbox-group{
  margin-top: 20px;
}
.query{
  width: 88%;
  margin: 20px;
}



.notice-swipe {
    height: 30px;
    line-height: 30px;
    margin-left:12px;
    color: rgb(160, 156, 156);
  }
.van-notice-bar{
  background-color: whitesmoke;
  margin: 0 10px;
  color: rgb(240, 161, 58);
  border-radius: 10px;
}

.gridradius{
  border-radius:10px;
  overflow: hidden;
}
.gridlast{
  background-color: gray;
}
</style>