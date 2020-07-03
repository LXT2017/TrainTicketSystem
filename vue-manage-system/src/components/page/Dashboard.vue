<template>
    <div>
        <el-row :gutter="20">
            <el-col :span="8">
                <el-card shadow="hover" class="mgb20" style="height:252px;">
                    <div class="user-info">
                        <img src="@/assets/img/img.jpg" class="user-avator" alt />
                        <div class="user-info-cont">
                            <div class="user-info-name">{{name}}</div>
                            <div>{{role}}</div>
                        </div>
                    </div>
                    <div class="user-info-list">
                        上次登录时间：
                        <span>2020-6-25</span>
                    </div>
                    <div class="user-info-list">
                        上次登录地点：
                        <span>杭州</span>
                    </div>
                </el-card>
                <el-card shadow="hover" style="height:220px;">
                    <div slot="header" class="clearfix">
                        <span>旅客类型比例</span>
                    </div>普通成人旅客
                    <el-progress :percentage="passengerproportion[0]" color="#42b983"></el-progress>学生旅客
                    <el-progress :percentage="passengerproportion[1]" color="#f1e05a"></el-progress>军人旅客
                    <el-progress :percentage="passengerproportion[2]"></el-progress>
                </el-card>
            </el-col>
            <el-col :span="16">
                <el-row :gutter="20" class="mgb20">
                    <el-col :span="8">
                        <el-card shadow="hover" :body-style="{padding: '0px'}">
                            <div class="grid-content grid-con-1">
                                <i class="el-icon-lx-people grid-con-icon"></i>
                                <div class="grid-cont-right">
                                    <div class="grid-num">{{board.userregisters}}</div>
                                    <div>用户注册数</div>
                                </div>
                            </div>
                        </el-card>
                    </el-col>
                    <el-col :span="8">
                        <el-card shadow="hover" :body-style="{padding: '0px'}">
                            <div class="grid-content grid-con-2">
                                <i class="el-icon-lx-notice grid-con-icon"></i>
                                <div class="grid-cont-right">
                                    <div class="grid-num">{{board.notice}}</div>
                                    <div>系统消息</div>
                                </div>
                            </div>
                        </el-card>
                    </el-col>
                    <el-col :span="8">
                        <el-card shadow="hover" :body-style="{padding: '0px'}">
                            <div class="grid-content grid-con-3">
                                <i class="el-icon-lx-recharge grid-con-icon"></i>
                                <div class="grid-cont-right">
                                    <div class="grid-num">￥{{board.pricenum}}</div>
                                    <div>当日交易额</div>
                                </div>
                            </div>
                        </el-card>
                    </el-col>
                </el-row>
                <el-card shadow="hover" style="height:373px;">
                    <div slot="header" class="clearfix">
                        <span>待办事项</span>
                    </div>
                    待办内容
                    <el-input size="mini" v-model="input" placeholder="请输入内容" class="addtodo"></el-input>
                      <el-button style="float: right; padding: 3px 0" type="text" @click="addthing">添加</el-button>
                    <el-table :show-header="false" :data="todoList" style="width:100%;">
                        <el-table-column width="40">
                            <template slot-scope="scope">
                                <el-checkbox v-model="scope.row.status"></el-checkbox>
                            </template>
                        </el-table-column>
                        <el-table-column>
                            <template slot-scope="scope">
                                <div
                                    class="todo-item"
                                    :class="{'todo-item-del': scope.row.status}">{{scope.row.title}}
                                    </div>
                            </template>
                        </el-table-column>
                        <el-table-column width="60">
                            <template slot-scope="scope">
                                <i class="el-icon-delete" @click='deltodo(scope.$index,scope.row)'></i>
                            </template>
                        </el-table-column>
                    </el-table>
                </el-card>
            </el-col>
        </el-row>
        <el-row :gutter="20">
            <el-col :span="12">
                <el-card shadow="hover">
                    <schart ref="bar" class="schart" canvasId="bar" :options="options"></schart>
                </el-card>
            </el-col>
            <el-col :span="12">
                <el-card shadow="hover">
                    <schart ref="line" class="schart" canvasId="line" :options="options2"></schart>
                </el-card>
            </el-col>
        </el-row>
    </div>
</template>

<script>
import Schart from 'vue-schart';
import bus from '../common/bus';
import {fetch} from '../../api/index'
export default {
    name: 'dashboard',
    data() {
        return {
            date:'',
            board:{
            // 用户注册数
            userregisters:400000,
            // 消息通知数
            notice:332,
            // 当日交易额
            pricenum:501234,
            // 乘客比例
            },
            
            passengerproportion:[71.3,26.1,3.3],
            input:'',
            name: localStorage.getItem('ms_username'),
            todoList: [
        
                {
                    title: '今天完成火车趟数增加',
                    status: false
                },
                {
                    title: '修改一等二等座位价格',
                    status: false
                },
                {
                    title: '紧急停止某班列车',
                    status: false
                },
                {
                    title: '审核注册用户名',
                    status: true
                }
            ],
            data: [
                {
                    name: '2018/09/04',
                    value: 1083
                },
                {
                    name: '2018/09/05',
                    value: 941
                },
                {
                    name: '2018/09/06',
                    value: 1139
                },
                {
                    name: '2018/09/07',
                    value: 816
                },
                {
                    name: '2018/09/08',
                    value: 327
                },
                {
                    name: '2018/09/09',
                    value: 228
                },
                {
                    name: '2018/09/10',
                    value: 1065
                }
            ],
            options: {
                type: 'bar',
                title: {
                    text: '最近一周各类火车类型售票情况'
                },
                xRorate: 25,
                labels: ['周一', '周二', '周三', '周四', '周五','周六','周日'],
                datasets: [
                    {
                        label: '高铁',
                        data: [234, 278, 270, 190, 230,443,465]
                    },
                    {
                        label: '动车',
                        data: [164, 178, 190, 135, 160,234,432]
                    }
                ]
            },
            options2: {
                type: 'line',
                title: {
                    text: '最近几个月各类火车销售额收入'
                },
                labels: ['1月', '2月', '3月', '4月', '5月'],
                datasets: [
                    {
                        label: '高铁',
                        data: [234, 278, 270, 190, 230]
                    },
                    {
                        label: '动车',
                        data: [164, 178, 150, 135, 160]
                    }
                ]
            }
        };
    },
    components: {
        Schart
    },
    created() {
        if(JSON.parse(localStorage.getItem('todolist')))
            this.todoList=JSON.parse(localStorage.getItem('todolist'));
        

        this.getTodayPrice();
    },
    computed: {
        role() {
            return this.name === 'admin' ? '超级管理员' : '普通用户';
        }
    },
    // created() {
    //     this.handleListener();
    //     this.changeDate();
    // },
    // activated() {
    //     this.handleListener();
    // },
    // deactivated() {
    //     window.removeEventListener('resize', this.renderChart);
    //     bus.$off('collapse', this.handleBus);
    // },
    methods: {
        // 获取当天交易额
        getTodayPrice(){
            let that = this;
            this.nowDate();
            fetch('/price/gettodaytotalprice',{
                orderdate:this.date
            }).then(res=>{
                if(res==null)
                    res=0;
                that.board.pricenum=res;
            })
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
        addthing(){
            this.todoList.push({ title: this.input,
                    status: false});
            this.input='';
            localStorage.setItem('todolist',JSON.stringify(this.todoList));
        },

        deltodo(index, row){
           console.log(index, row);
           this.todoList.splice(index,1);
        },
        changeDate() {
            const now = new Date().getTime();
            this.data.forEach((item, index) => {
                const date = new Date(now - (6 - index) * 86400000);
                item.name = `${date.getFullYear()}/${date.getMonth() + 1}/${date.getDate()}`;
            });
        }
        // handleListener() {
        //     bus.$on('collapse', this.handleBus);
        //     // 调用renderChart方法对图表进行重新渲染
        //     window.addEventListener('resize', this.renderChart);
        // },
        // handleBus(msg) {
        //     setTimeout(() => {
        //         this.renderChart();
        //     }, 200);
        // },
        // renderChart() {
        //     this.$refs.bar.renderChart();
        //     this.$refs.line.renderChart();
        // }
    }
};
</script>


<style scoped>
.el-row {
    margin-bottom: 20px;
}

.grid-content {
    display: flex;
    align-items: center;
    height: 100px;
}

.grid-cont-right {
    flex: 1;
    text-align: center;
    font-size: 14px;
    color: #999;
}

.grid-num {
    font-size: 30px;
    font-weight: bold;
}

.grid-con-icon {
    font-size: 50px;
    width: 100px;
    height: 100px;
    text-align: center;
    line-height: 100px;
    color: #fff;
}

.grid-con-1 .grid-con-icon {
    background: rgb(45, 140, 240);
}

.grid-con-1 .grid-num {
    color: rgb(45, 140, 240);
}

.grid-con-2 .grid-con-icon {
    background: rgb(100, 213, 114);
}

.grid-con-2 .grid-num {
    color: rgb(45, 140, 240);
}

.grid-con-3 .grid-con-icon {
    background: rgb(242, 94, 67);
}

.grid-con-3 .grid-num {
    color: rgb(242, 94, 67);
}

.user-info {
    display: flex;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 2px solid #ccc;
    margin-bottom: 20px;
}

.user-avator {
    width: 120px;
    height: 120px;
    border-radius: 50%;
}

.user-info-cont {
    padding-left: 50px;
    flex: 1;
    font-size: 14px;
    color: #999;
}

.user-info-cont div:first-child {
    font-size: 30px;
    color: #222;
}

.user-info-list {
    font-size: 14px;
    color: #999;
    line-height: 25px;
}

.user-info-list span {
    margin-left: 70px;
}

.mgb20 {
    margin-bottom: 20px;
}

.todo-item {
    font-size: 14px;
}

.todo-item-del {
    text-decoration: line-through;
    color: #999;
}

.schart {
    width: 100%;
    height: 300px;
}

.addtodo{
    width: 50%;
    margin-left: 8%;
}
</style>
