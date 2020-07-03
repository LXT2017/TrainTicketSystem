<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item>
                    <i class="el-icon-lx-cascades"></i> 用户修改
                </el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="container">
            <div class="handle-box">
                <el-button
                    type="primary"
                    icon="el-icon-delete"
                    class="handle-del mr10"
                    @click="delAllSelection"
                >批量删除</el-button>
                <el-select v-model="query.condition" placeholder="全部" class="handle-select mr10">
                    <el-option key=0 label="全部" value=0></el-option>
                    <el-option key=1 label="未审核" value=1></el-option>
                     <el-option key=2 label="已审核" value=2></el-option>
                </el-select>
                <el-input v-model="query.name" placeholder="用户名" class="handle-input mr10"></el-input>
                <el-button type="primary" icon="el-icon-search" @click="handleSearch">搜索</el-button>
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
                <el-table-column prop="id" label="ID" width="50" align="center"></el-table-column>
                <el-table-column prop="username" label="用户名"></el-table-column>
                <el-table-column prop="realname" label="真实姓名" align="center"></el-table-column>
                 <el-table-column prop="idcard" label="身份证" align="center"></el-table-column>
                <el-table-column label="旅客类型" align="center">
                    <template slot-scope="scope">
                        <el-tag
                            :type="scope.row.type===0?'success':(scope.row.state==='1'?'warning':'')"
                        ><span v-if="scope.row.type==0">成人</span>
                        <span v-else>学生</span></el-tag>
                    </template>
                </el-table-column>
                 <el-table-column prop="phone" label="联系方式" align="center"></el-table-column>
                  <el-table-column prop="createdate" label="注册时间" align="center"></el-table-column>
                   <el-table-column prop="country" label="国家" align="center"></el-table-column>
                <el-table-column label="状态" align="center">
                    <template slot-scope="scope">
                        <el-tag
                            :type="scope.row.status==0?'':(scope.row.status==1?'success':'danger')"
                        ><span v-if="scope.row.status==0">待审核</span>
                        <span v-else-if="scope.row.status==1">已通过</span>
                        <span v-else>未通过</span></el-tag>
                    </template>
                </el-table-column>
               
                <el-table-column label="操作" width="180" align="center">
                    <template slot-scope="scope">
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
        <el-dialog title="编辑" :visible.sync="editVisible" width="30%">
            <el-form ref="form" :model="form" label-width="70px">
                <el-form-item label="用户名">
                    <el-input v-model="form.username"></el-input>
                </el-form-item>
                <el-form-item label="真实姓名">
                    <el-input v-model="form.realname"></el-input>
                </el-form-item>
                <el-form-item label="身份证号">
                    <el-input v-model="form.idcard"></el-input>
                </el-form-item>
                 <el-form-item label="旅客类型">
                        <el-radio-group v-model="form.type">
                            <el-radio :label="0">成人</el-radio>
                            <el-radio :label="1">学生</el-radio>
                        </el-radio-group>
                </el-form-item>
                 <el-form-item label="联系方式">
                    <el-input v-model="form.phone"></el-input>
                </el-form-item>
                 <el-form-item label="国家">
                    <el-input v-model="form.country"></el-input>
                </el-form-item>
                <el-form-item label="审核状态">
                        <el-radio-group v-model="form.status">
                            <el-radio :label="0">未审核</el-radio>
                            <el-radio :label="1">已审核</el-radio>
                            <el-radio :label="2">审核不通过</el-radio>
                        </el-radio-group>
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
            query: {
                condition: "0",
                name: '',
                pageIndex: 1,
                pageSize: 6
            },
            tableData: [{
                id: 1,
                username: "匿名用户",
                realname: "张三",
                status: 0,
                idcard: "330621195402324252",
                phone: "173652645242",
                type: 0,
                country: null,
                createdate: "2020-06-17"
        },
        {
                id: 2,
                username: "匿名用户",
                realname: "张三",
                status: 1,
                idcard: "330621195402324252",
                phone: "17365264524572",
                type: 1,
                country: null,
                createdate: "2020-06-17"
        },
        {
                id: 3,
                username: "匿名用户",
                realname: "张三",
                status: 2,
                idcard: "330621195402324252",
                phone: "17365264524572",
                type: 0,
                country: null,
                createdate: "2020-06-17"
        }
            ],
            pageTotal: 4,
            multipleSelection: [],
            delList: [],
            editVisible: false,
            pageTotal: 0,
            form: {},
            idx: -1,
            id: -1
        };
    },
    created() {
        this.getData();
    },
    methods: {
        // 获取 easy-mock 的模拟数据
        getData(index=1,conditions=0,pagesize=6) {
            let param={
                pagenum: index,
                condition: conditions,
                pagesize:pagesize
            };
            fetch('user/queryalluser',param).then(res =>{
                 this.tableData = res.list;
                 this.pageTotal=res.total;
            })
        },
        // 触发搜索按钮
        handleSearch() {
            // this.$set(this.query, 'pageIndex', 1);
            // this.getData();
            console.log(this.query)
            if(this.query.name==''){
                this.getData(1,this.query.condition);
            }else{
                 let param={
                    realname:this.query.name
                };
                fetch('user/vagueusers',param).then(res =>{
                    console.log(res)
                    this.tableData = res;
            })
            }
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
            console.log(this.$qs.stringify(this.form))
            this.$set(this.tableData, this.idx, this.form);
            // var headers={
            //     contentType: 'application/json;charset=UTF-8'
            // }
            put('/user/putuser',this.form).then(res=>{
            })
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
</style>
