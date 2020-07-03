<template>
  <div class="register_container">
    <div class="header">
    <el-row :gutter="20">
      <el-col :span="3" :offset="1"><i class="el-icon-arrow-left" @click="back"></i></el-col>
      <el-col :span="6" :offset="7"><div>注册</div></el-col>
    </el-row>
      </div>

     

    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px" class="demo-ruleForm">

      <el-form-item label="用户名" prop="name">
        <el-input v-model="ruleForm.username" placeholder="字母、数字或'_',3-15位"></el-input>
      </el-form-item>
       <el-form-item  label="密码" prop="password">
        <el-input type="password" v-model="ruleForm.password" placeholder="6-15位"></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop="confirm">
        <el-input type="password" v-model="ruleForm.confirm" placeholder="请再次确认密码"></el-input>
      </el-form-item>


      <el-form-item label="证件类型">
        <el-select type="password" v-model="ruleForm.region" placeholder="请选择" style="width: 100%;">
        <el-option label="中国居民身份证" value="0"></el-option>
        </el-select>
    </el-form-item>

    <el-form-item label="证件号码" prop="idcard">
        <el-input v-model="ruleForm.idcard" placeholder="证件号"></el-input>
      </el-form-item>
    <el-form-item label="真实姓名" prop="realname">
        <el-input v-model="ruleForm.realname" placeholder="请输入真实姓名，以便购票"></el-input>
      </el-form-item>
      <el-form-item label="联系方式" prop="phone">
        <el-input v-model="ruleForm.phone" placeholder="请准确填写您的手机号"></el-input>
      </el-form-item>
      
       <el-form-item label="旅客类型">
        <el-select  v-model="ruleForm.type" placeholder="请选择旅客类型" style="width: 100%;">
        <el-option label="成人" value="0"></el-option>
        <el-option label="学生" value="1"></el-option>
        </el-select>
    </el-form-item>
    <el-form-item>
      <el-checkbox v-model="ruleForm.checked"><el-button type="text" @click="open">我已阅读铁路相关部门协议</el-button></el-checkbox>
    </el-form-item>
      <el-button type="primary" @click="submitForm('ruleForm')">注册</el-button>

</el-form>
  </div>
</template>

<script>

export default {
  data() {
    // eslint-disable-next-line no-unused-vars
    var validatePassword = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm.password) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return {
        
        ruleForm: {
          username: '',
          password: '',
          confirm:'',
          region:'0',
          idcard: '',
          realname: '',
          phone:'',
          type:'0',
          status:0,
          checked: false,
        },
        rules: {
          username: [
            { required: true, message: '请填写用户名', trigger: 'blur' },
            { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '请输入密码', trigger: 'blur' },
            { min: 6, max: 15, message: '长度在 6 到 15 个字符', trigger: 'blur' }
          ],
         confirm: [
            { required: true,validator:validatePassword, trigger: 'blur' }
         ],
         phone:[
           {min: 11, max: 11, message: '请输入正确的手机号', trigger: 'blur'}
         ]
        }
      };
    },
    methods: {
      open() {
        this.$dialog.alert({
        message: '铁路协议，xxxxxxx',
      }).then(() => {
        // on close
      });
      },
      back(){
        this.$router.go(-1)
      },
      submitForm(formName) {
        let that = this;
        if(!this.ruleForm.checked){
          this.$notify({ type: 'warning', message: '请勾选用户协议' });
          return;
        }

        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$toast.loading({
            duration:300,
            message: '注册中',
            forbidClick: true,
          });
            that.ruleForm.password=that.$md5(that.ruleForm.password);
            this.$axios({
              method:'post',
              url:'/user/register',
              data: this.ruleForm
            }).then(function(res){
              console.log(res)
              if(res.data.code==200){
                that.$notify({ type: 'success', message: '注册成功' });
                that.$router.push("/")
              }else if(res.data.code==302){
                 that.$notify({ type: 'warning', message: '用户名已被注册' });
              }else{
                that.$notify({ type: 'warning', message: '注册失败' });
              }
            }).catch(function (error) {
              console.log(error);
              });
          } else {
            this.$notify({ type: 'warning', message: '注册失败' });
            console.log('error submit!!');
            return false;
          }
        });
      },
      
    }
}
</script>
<style lang="less" scoped>
.el-row {
    margin-bottom: 20px;
    &:last-child {
      margin-bottom: 0;
    }
  }
.register_container{
   height: 100%;
   width: 100%;
   overflow: hidden;
   position: absolute;
   background: url("../assets/bac.jpg") no-repeat;
   background-size: 100% 100%;
}
.el-icon-arrow-left{
 margin-left: 0 !important;
}
.header{
  text-align: left;
  background-color:#8ec1f757;
  font-size: 20px;
  color: white;
  line-height: 50px;
}

.el-form{

  margin: 20px auto;
  width: 92%;
}
.el-form /deep/ .el-input__icon{
  line-height: 40px !important;
}
.el-form /deep/ .el-form-item__label{
  color: #d0d0d0 !important;
}
.el-form /deep/ .el-form-item__content{
  text-align: left;
  margin: 0;
}
.el-form-item{
  margin-bottom: 20px;
}
.el-button{
  margin-top: 0 !important;
}
</style>