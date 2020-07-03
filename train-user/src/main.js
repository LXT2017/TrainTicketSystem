import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import Vant from 'vant';
import 'vant/lib/index.css';
import { Lazyload } from 'vant';
import axios from 'axios'
import qs from 'qs'
import md5 from 'js-md5'

Vue.prototype.$md5 = md5;
Vue.prototype.$qs = qs
Vue.prototype.$axios = axios
Vue.prototype.$axios.defaults.baseURL = 'http://localhost:8081/'
    //Lazyload 是 Vue 指令，使用前需要对指令进行注册
Vue.use(Lazyload)
Vue.use(Vant);

Vue.config.productionTip = false
Vue.use(ElementUI);

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')