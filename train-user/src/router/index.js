import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Register from '../views/register.vue'
import Tabbar from '../views/tabbar.vue'
import Index from '../views/Index.vue'
import Order from '../views/Order.vue'
import Mine from '../views/Mine.vue'
import Citylist from '../views/CityList.vue'
import Querytrain from '../views/QueryTrain.vue'
import ConfirmOrder from '../views/ConfirmOrder.vue'
import SelectUser from '../views/SelectUser.vue'
import DetailOrder from '../views/DetailOrder.vue'
import ChangeTicket from '../views/ChangeTicket.vue'

Vue.use(VueRouter)

const routes = [{
        path: '/',
        name: 'Login',
        component: Login
    },
    {
        path: '/register',
        name: 'register',
        component: Register
    },
    {
        path: '/citylist',
        name: 'citylist',
        component: Citylist
    },
    {
        path: '/querytrain',
        name: 'querytrain',
        component: Querytrain
    },
    {
        path: '/confirmorder',
        name: 'confirmorder',
        component: ConfirmOrder
    },
    {
        path: '/selectuser',
        name: 'selectuser',
        component: SelectUser
    },
    {
        path: '/detailorder',
        name: 'detailorder',
        component: DetailOrder
    },
    {
        path: '/changeticket',
        name: 'changeticket',
        component: ChangeTicket
    },
    {
        path: '/tabbar',
        name: 'tabbar',
        component: Tabbar,
        children: [{
            path: '/index',
            name: 'index',
            component: Index,
        }, {
            path: '/order',
            name: 'order',
            component: Order,
        }, {
            path: '/mine',
            name: 'mine',
            component: Mine,
        }]
    }

]



const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router