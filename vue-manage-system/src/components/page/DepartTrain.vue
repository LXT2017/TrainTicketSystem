<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item>
                    <i class="el-icon-lx-calendar"></i> 火车管理
                </el-breadcrumb-item>
                <el-breadcrumb-item>火车车次发布</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="container">
            <div class="handle-box">
                 <el-date-picker
                  v-model="traindate"
                  type="date"
                  placeholder="选择日期"
                  value-format="yyyy-MM-dd"
                  format="yyyy 年 MM 月 dd 日">
                </el-date-picker>
                <el-button type="primary" icon="el-icon-position" @click="handlePublishSelective" class="handle-button">发布已选火车列次</el-button>
                 <el-button type="warning" icon="el-icon-s-promotion" @click="handlePublicAll">发布所有火车列次</el-button>
            </div>
            <el-table 
                :data="tableData"
                border
                class="table"
                ref="multipleTable"
                header-cell-class-name="table-header"
                @selection-change="handleSelectionChange"
            >
                <el-table-column type="selection" width="50" align="center"></el-table-column>
                <el-table-column prop="name" width="80" label="车次" align="center"></el-table-column>
                <el-table-column prop="startcity"  label="出发城市" align="center"></el-table-column>
                <el-table-column prop="starttime" label="出发时间" align="center"></el-table-column>
                <el-table-column prop="endcity" label="到达城市" align="center"></el-table-column>
                <el-table-column prop="endtime" label="到达时间" align="center"></el-table-column>

                 <el-table-column prop="fnum" label="一等票数" align="center"></el-table-column>
                <el-table-column  label="一等票价" align="center">
                   <template slot-scope="scope">
                     <span>￥{{scope.row.fprice}}</span>
                   </template>
                </el-table-column>
            
                 <el-table-column prop="snum" label="二等票数" align="center"></el-table-column>
                <el-table-column label="二等票价" align="center">
                   <template slot-scope="scope">
                     <span>￥{{scope.row.sprice}}</span>
                   </template>
                </el-table-column>
              
        
               
                <el-table-column label="操作" width="180" align="center">
                    <template slot-scope="scope">
                        <el-button
                            type="text"
                            icon="el-icon-s-promotion"
                            @click="handlePublish(scope.$index, scope.row)"
                        >发布</el-button>
                        <el-button
                            type="text"
                            icon="el-icon-edit"
                            @click="handleEdit(scope.$index, scope.row)"
                        >编辑</el-button>
                        <el-button
                            type="text"
                            icon="el-icon-delete"
                            class="red"
                            @click="handleDelete(scope.$index, scope.row)"
                        >删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div class="pagination">
                <el-pagination
                    background
                    layout="total, prev, pager, next"
                    :current-page="query.pageIndex"
                    :page-size="query.pageSize"
                    :total="pageTotal"
                    @current-change="handlePageChange"
                ></el-pagination>
            </div>
        </div>

       <!-- 编辑弹出框 -->
        <el-dialog title="编辑" :visible.sync="editVisible" width="40%">
           <el-form ref="form" :model="form" label-width="80px">
                    <el-form-item label="火车车号" prop='name'>
                        <el-input v-model="form.name" disabled></el-input>
                    </el-form-item>
                    <el-form-item label="出发时间">
                        <el-col :span="24">
                          <el-form-item prop='starttime'>
                            <el-time-picker 
                                placeholder="出发时间"
                                v-model="form.starttime"
                                style="width: 100%;"
                            ></el-time-picker>
                          </el-form-item>
                        </el-col>
                    </el-form-item >
                     <el-form-item label="到达时间">
                        <el-col :span="24">
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
          traindate:'',
            query: {
                condition: "0",
                name: '',
                pageIndex: 1,
                pageSize: 10
            },
            tableData: [{
                id: 1,
                name:'G100',
               startcity:'杭州',
                starttime:'16:37:21',
                endcity:'绍兴',
                endtime:'17:35:54',
                duration:'23分钟',
                fnum:'33',
                snum:'44',
                fprice:33,
                sprice:19

        }
            ],
            pageTotal: 1,
            multipleSelection: [],
            delList: [],
            editVisible: false,
            pageTotal: 10,
            form: {},
            idx: -1,
            id: -1,
            idlist:[]
        };
    },
    created() {
        this.getData();
    },
    methods: {
        // 获取 easy-mock 的模拟数据
        getData() {
            fetch('train/querytrains').then(res =>{
              console.log(res)
              this.tableData = res;
            })
        },
        // 发布已选择的
        handlePublishSelective(){
           if(this.traindate==''||this.multipleSelection==[]){
             this.$message({
              showClose: true,
              message: '请选择时间',
              type: 'error'
          });
          return;
          }
            this.multipleSelection.forEach(element => {
              this.idlist.push(element.trainId)
            });
            
            let that=this;
            let params={
            idlist:this.idlist,
            traindate:this.traindate
          };
          post('/train/departtrainsselective',params).then(res=>{
            that.traindate='';
            that.$refs.multipleTable.clearSelection();
          })
            this.idlist=[]
        },
        // 发布全部
        handlePublicAll() {
           if(this.traindate==''){
             this.$message({
              showClose: true,
              message: '请选择时间',
              type: 'error'
          });
          return;
          }
          let that=this;
          let params={
            id:0,
            traindate:this.traindate
          };
          post('/train/departtrains',this.$qs.stringify(params)).then(res=>{
            that.traindate='';
            that.multipleSelection=[];
          })
        },
        // 发布火车
        handlePublish(index,row){
          if(this.traindate==''){
             this.$message({
              showClose: true,
              message: '请选择时间',
              type: 'error'
          });
          return;
          }

            console.log(this.traindate)
          let params={
              id:row.trainId,
              traindate:this.traindate
          };
          post('/train/departtrains',this.$qs.stringify(params))
          this.$message("发布成功")
        },
        // 删除操作
        handleDelete(index, row) {
            // 二次确认删除
            this.$confirm('确定要删除吗？', '提示', {
                type: 'warning'
            })
                .then(() => {
                    this.$message.success('删除成功');
                    this.tableData.splice(index, 1);
                })
                .catch(() => {});
        },
        // 多选操作
        handleSelectionChange(val) {
            this.multipleSelection = val;
            console.log(this.multipleSelection)
        },
        delAllSelection() {
            const length = this.multipleSelection.length;
            let str = '';
            this.delList = this.delList.concat(this.multipleSelection);
            for (let i = 0; i < length; i++) {
                str += this.multipleSelection[i].name + ' ';
            }
            this.$message.error(`删除了${str}`);
            this.multipleSelection = [];
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
            this.editVisible = false;
            this.$message.success(`修改第 ${this.idx + 1} 行成功`);
            let from = this.form;
            this.form.starttime = this.form.starttime.getHours()+":"+this.form.starttime.getMinutes() +":"+this.form.starttime.getSeconds();
            this.form.endtime = this.form.endtime.getHours()+":"+this.form.endtime.getMinutes() +":"+this.form.endtime.getSeconds();
            console.log(this.form)
            // console.log(this.$qs.stringify(this.form))
            // this.$set(this.tableData, this.idx, this.form);
            // var headers={
            //     contentType: 'application/json;charset=UTF-8'
            // }
            // put('/user/putuser',this.form).then(res=>{
            // })
        },
        // 分页导航
        handlePageChange(val) {
            this.$set(this.query, 'pageIndex', val);
            this.getData(this.query.pageIndex,this.query.condition);
        }
    }
};
</script>

<style scoped>
.handle-box {
    margin-bottom: 20px;
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
.handle-button{
  margin: 0 20px;
}
</style>
