<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item>
                    <i class="el-icon-set-up"></i> 价格管理
                </el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="container">
            <div class="handle-box">
                火车票节假日价格管理
            </div>
            <el-table 
                :data="tableData"
                border
                class="table"
                ref="multipleTable"
                header-cell-class-name="table-header"
            >
                <el-table-column prop="returnprice" label="退票手续费" align="center"></el-table-column>
                <el-table-column prop="discount1" label="周末车票折扣" align="center"></el-table-column>
                 <el-table-column prop="discount2" label="普通假期折扣" align="center"></el-table-column>
                 <el-table-column prop="discount3" label="特殊假期折扣" align="center"></el-table-column>
                 
                <el-table-column label="操作" width="180" align="center">
                    <template slot-scope="scope">
                        <el-button
                            type="text"
                            icon="el-icon-edit"
                            @click="handleEdit(scope.$index, scope.row)"
                        >编辑</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <!-- 单一节假日 -->
             <div class="block">
                <span class="demonstration">单一节假日优惠设置</span>
                <el-date-picker class="datapicker"
                  v-model="single.vacation"
                  type="date"
                  placeholder="选择日期"
                  format="yyyy 年 MM 月 dd 日"
                  value-format="yyyy-MM-dd">
                </el-date-picker>

                <el-select v-model="single.status" placeholder="请选择" class="handle-select mr10">
                    <el-option key=2 label="普通节假日" value=2></el-option>
                    <el-option key=3 label="特殊节假日" value=3></el-option>
                </el-select>
                <el-button type="primary" icon="el-icon-position" @click="singlepublish">发布</el-button>
           </div>
           <!-- 连续假期 -->
           <div class="block">
                <span class="demonstration">连续节假日优惠设置</span>
                <el-date-picker class="datapicker"
                v-model="multiple.vacation"
                type="daterange"
                format="yyyy-MM-dd"
                value-format="yyyy-MM-dd"
                range-separator="至"
                start-placeholder="开始日期"
                end-placeholder="结束日期">
              </el-date-picker>

                <el-select v-model="multiple.status" placeholder="请选择" class="handle-select mr10">
                    <el-option key=2 label="普通节假日" value=2></el-option>
                    <el-option key=3 label="特殊节假日" value=3></el-option>
                </el-select>
                <el-button type="primary" icon="el-icon-position" @click="multiplepublish">发布</el-button>
           </div>
        </div>

        <!-- 编辑弹出框 -->
        <el-dialog title="编辑" :visible.sync="editVisible" width="30%">
            <el-form ref="form" :model="form" label-width="100px">
                <el-form-item label="退票手续费">
                    <el-input v-model="form.returnprice"></el-input>
                </el-form-item>
                <el-form-item label="周末车票折扣">
                    <el-input v-model="form.discount1"></el-input>
                </el-form-item>
                <el-form-item label="普通假期折扣">
                    <el-input v-model="form.discount2"></el-input>
                </el-form-item>
                 <el-form-item label="特殊假期折扣">
                    <el-input v-model="form.discount3"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="editVisible = false">取 消</el-button>
                <el-button type="primary" @click="saveEdit">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
import { fetchData,fetch ,put,post} from '../../api/index';
export default {
    name: 'basetable',
    data() {
        return {
            tableData: [{
              returnprice:0.95,
              discount1:0.9,
              discount2:0.8,
              discount3:0.55
            }],
            editVisible: false,
            form: {},
            idx: -1,
            id: -1,
            single:{
            vacation:'',
            status:'',  
            },
            multiple:{
            vacation:'',
            status:'',  
            }
            
        };
    },
    created() {
        this.getData();
    },
    methods: {
        // 获取 easy-mock 的模拟数据
        getData() {
            fetch('/price/getdiscount').then(res =>{
                this.tableData[0]=res;
            })
        },
        
        // 编辑操作
        handleEdit(index, row) {
            console.log(row)
            this.idx = index;
            this.form = row;
            this.editVisible = true;
        },
        // 保存编辑
        saveEdit() {
            let that=this;
            this.editVisible = false;
            this.$message.success(`修改成功`);
            this.$set(this.tableData, this.idx, this.form);
            post('/price/updatediscount',this.form).then(res=>{
              that.getData();
            })
        },
        // 单一发布
        singlepublish(){
            let that = this;
            console.log(this.single);
            post('/price/postsingleholiday',this.single)
            .then(res=>{
                if(res==200){
                  that.single.vacation='';
                  that.$message({
                  message: '插入成功',
                  type: 'success'
                });
                }else{
                   that.$message.error('操作失败');
                }
            })
        },
        // 一段时间内节假日
        multiplepublish(){
          let that=this;
          console.log(this.multiple);
          post('/price/postmultipleholiday',this.multiple).then(res=>{
            that.multiple.vacation='';
            that.single.vacation='';
                  that.$message({
                  message: '插入成功',
                  type: 'success'
                });
          });
        }
    }
};
</script>

<style scoped>
.handle-box {
    margin-bottom: 20px;
    text-align: center;
}

.handle-select {
    width: 120px;
}

.handle-input {
    width: 300px;
    display: inline-block;
}
.table {
    width: 100%;
    font-size: 14px;
}
.red {
    color: #ff0000;
}
.mr10 {
    margin-right: 10px;
}
.table-td-thumb {
    display: block;
    margin: auto;
    width: 40px;
    height: 40px;
}
.block{
  margin: 20px auto;
  text-align: center;
  display: flex;
  justify-content: center;
}
.datapicker{
  margin: 0 20px;
}
</style>
