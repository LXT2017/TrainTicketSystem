<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item>
                    <i class="el-icon-lx-calendar"></i> 火车管理
                </el-breadcrumb-item>
                <el-breadcrumb-item>火车添加</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="container">
            <div class="form-box">
                <el-form ref="form" :model="form" label-width="80px">
                    <el-form-item label="火车车号" prop='name'>
                        <el-input v-model="form.name"></el-input>
                    </el-form-item>
                    <el-form-item label="火车类型" prop='type'>
                        <el-select v-model="form.type" placeholder="请选择">
                            <el-option label="高铁" value=0></el-option>
                            <el-option label="动车" value=1></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="火车时间">
                            <!-- <el-date-picker
                                type="date"
                                placeholder="选择日期"
                                v-model="form.date1"
                                value-format="yyyy-MM-dd"
                                style="width: 100%;"
                            ></el-date-picker> -->
                        <el-col :span="11">
                          <el-form-item prop='starttime'>
                            <el-time-picker 
                                placeholder="出发时间"
                                v-model="form.starttime"
                                style="width: 100%;"
                            ></el-time-picker>
                          </el-form-item>
                        </el-col>
                        <el-col class="line" :span="2">-</el-col>
                        <el-col :span="11">
                          <el-form-item prop='endtime'>
                            <el-time-picker
                                placeholder="到达时间"
                                v-model="form.endtime"
                                style="width: 100%;"
                            ></el-time-picker>
                          </el-form-item>
                        </el-col>
                    </el-form-item>

                      <el-row :gutter="20">
                      <el-col :span="12">
                         <el-form-item label="出发城市"  prop='startcity'>
                        <el-input v-model="form.startcity"></el-input>
                         </el-form-item>
                        </el-col>
                      <el-col :span="12">
                        <el-form-item label="到达城市"  prop='endcity'>
                        <el-input v-model="form.endcity"></el-input>
                         </el-form-item>
                        </el-col>
                    </el-row>
                    
                     <el-row :gutter="20">
                      <el-col :span="12">
                         <el-form-item label="一等票价"  prop='fprice'>
                        <el-input v-model="form.fprice"></el-input>
                         </el-form-item>
                        </el-col>
                      <el-col :span="12">
                        <el-form-item prop='fnum' label="一等数量">
                         <el-slider
                          v-model="form.fnum"
                          :step="10">
                        </el-slider> 
                        </el-form-item>
                        </el-col>
                    </el-row>

                     <el-row :gutter="20">
                      <el-col :span="12">
                         <el-form-item label="二等票价" prop='sprice'>
                        <el-input v-model="form.sprice"></el-input>
                         </el-form-item>
                      </el-col>
                        
                      <el-col :span="12">
                        <el-form-item prop='snum' label="二等数量">
                         <el-slider
                          v-model="form.snum"
                          :step="10">
                        </el-slider> 
                         </el-form-item>
                        </el-col>
                      
                    </el-row>


                    <el-form-item>
                        <el-button type="primary" @click="onSubmit">添加火车</el-button>
                        <el-button>取消</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
    </div>
</template>

<script>
 import {post} from '@/api/index';
export default {
    name: 'addtrain',
    data() {
        return {
            form: {
                name: '',
                type: "",
                startcity:'',
                starttime:'',
                endcity:'',
                endtime:'',
                fprice:'',
                fnum:0,
                sprice:'',
                snum:0
            }
        };
    },
    methods: {
        onSubmit() {
         
          var that=this;
            post('/train/addtrain',this.form).then(res=>{
              that.$refs['form'].resetFields()
            })
            this.$message.success('提交成功！');

        }
    }
};
</script>