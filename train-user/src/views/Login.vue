<template>
  <div class="login_container">
    <div class="avatar_box">
      <img src="../assets/login.jpg">
    </div>
    
    <div class="user_input">

     <el-form ref="ruleForm" :model="ruleForm" :rules="rules" abel-width="0px" class="login_form">
      <el-form-item prop="name">
        <el-input class="www" prefix-icon="el-icon-s-custom"  v-model="ruleForm.name" placeholder="用户名"></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input class="www" type="password" prefix-icon="el-icon-lock" v-model="ruleForm.password" placeholder="密码"></el-input>
      </el-form-item>
     </el-form>
    <div class="forget">
      <el-link type="info" :underline=false >忘记密码?</el-link>
    </div>
    <div class="button">
      <el-button class="button1" type="primary" round  @click="login('ruleForm')">登录</el-button>
      <el-button class="button2" type="primary" round @click="register">注册</el-button>
    </div>
    

    </div>
  

    <div class="test">

    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
     ruleForm: {
          name: '',
          password:''
     },
     rules: {
          name: [
            { required: true, message: '请输入用户名', trigger: 'blur' },
            { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '请输入密码', trigger: 'blur' },
            { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
          ]
      },
      user:{
        id: '',
        name:'张三',
        realname:'张三',
        idcard:356564615645,
        status:0,
        type:0
      }
    }
  },
  methods: {
    
      login(formName) {
        // 保存this
        var that=this;
        this.$refs[formName].validate((valid) => {
          if (valid) {
            that.$toast.loading({
              message:"登陆中",
              duration:500
              });
            this.$axios({
              method:"post",
              url:'/user/login',
              data: this.$qs.stringify({
                username:this.ruleForm.name,
                // 加密
                password:this.$md5(this.ruleForm.password)
              }), 
            }).then(function(res){
                // console.log(res);
              if(res.data.code==301){
                that.$notify({ type: 'warning', message: '账号或密码错误' });
              }else if(res.data.code==200){
                 sessionStorage.setItem("user",JSON.stringify(res.data.data));
                that.$router.push("index");
              }
              
            }).catch(function (error) {
        console.log(error);
        });
           
          } else {
            this.$notify({ type: 'warning', message: '登陆失败' });
            console.log('error submit!!');
            return false;
          }
        });
      },
      register(){
        this.$router.push({path:'/register'});
      }
    },
}
</script>

<style lang="less" scope>

.login_container{
   height: 100%;
   width: 100%;
   position: fixed;
   overflow: hidden;
   background: url("../assets/bac.jpg");
}

.avatar_box{
  margin: 50px auto;
  img{
    border-radius: 50%;
    height: 80px;
    width: 80px;
  }
}
.user_input{
  margin: 0 auto;
  width: 80%;
  padding: 5px;
  position: relative;
}

.www input.el-input__inner{
  margin-top:5px;
  height: 50px;
  background-color: transparent ; 
  border:none !important;
  border-bottom: 1px solid white !important;
  padding-left: 40px !important;
  border-radius: 0;
  color: #e3e3e3;
}
.el-input__icon{
  line-height: 55px !important;
}
.el-icon-s-custom:before{
  font-size: 20px;
}
.el-icon-lock:before{
  font-size: 20px;
}
.el-link{
  padding-top:55px ;
  text-decoration: none;
}
.forget{
  margin-top: 20px;
  text-align: right;

}
.el-link{
  font-weight: normal !important;
  color: #d5d8dc !important;
  font-size: 12px !important;
}
.button{
  margin-top: 20px;
  .button1{
    background-color: #ffffff4f;
    border: none;
  }
  .button2{
    margin-left: 0 !important;
    background-color: transparent;
    border-color: white;
    color: #268ac5;
}
}
.el-button{
  width: 80%;
  margin-top: 18px !important;
}
.button /deep/ .button2:focus{
    background-color: transparent ;
    border-color: white  ;
    color: #268ac5 ;
  }
  .button /deep/ .button1:focus{
    background-color: #ffffff4f;
    border: none;
  }

</style>
