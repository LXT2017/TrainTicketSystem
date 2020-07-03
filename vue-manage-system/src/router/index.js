import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

export default new Router({
    routes: [{
            path: '/',
            redirect: '/dashboard'
        },
        {
            path: '/',
            component: () =>
                import ( /* webpackChunkName: "home" */ '../components/common/Home.vue'),
            meta: { title: '自述文件' },
            children: [{
                    path: '/dashboard',
                    component: () =>
                        import ( /* webpackChunkName: "dashboard" */ '../components/page/Dashboard.vue'),
                    meta: { title: '系统首页' }
                },
                {
                    path: '/table',
                    component: () =>
                        import ( /* webpackChunkName: "table" */ '../components/page/BaseTable.vue'),
                    meta: { title: '用户管理' }
                },
                {
                    path: '/tabs',
                    component: () =>
                        import ( /* webpackChunkName: "tabs" */ '../components/page/Tabs.vue'),
                    meta: { title: '消息通知' }
                },
                {
                    path: '/addtrain',
                    component: () =>
                        import ( /* webpackChunkName: "form" */ '../components/page/AddTrain.vue'),
                    meta: { title: '火车添加' }
                },
                {
                    path: '/departtrain',
                    component: () =>
                        import ( /* webpackChunkName: "form" */ '../components/page/DepartTrain.vue'),
                    meta: { title: '火车车次发布' }
                },
                {
                    path: '/pricemanage',
                    component: () =>
                        import ( /* webpackChunkName: "form" */ '../components/page/PriceManage.vue'),
                    meta: { title: '车票价格管理' }
                },

                {
                    path: '/404',
                    component: () =>
                        import ( /* webpackChunkName: "404" */ '../components/page/404.vue'),
                    meta: { title: '404' }
                },
                {
                    path: '/403',
                    component: () =>
                        import ( /* webpackChunkName: "403" */ '../components/page/403.vue'),
                    meta: { title: '403' }
                },
            ]
        },
        {
            path: '/login',
            component: () =>
                import ( /* webpackChunkName: "login" */ '../components/page/Login.vue'),
            meta: { title: '登录' }
        },
        {
            path: '*',
            redirect: '/404'
        }
    ]
});