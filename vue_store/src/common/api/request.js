import { Indicator } from 'mint-ui';
import axios from 'axios'
import store from '@/store'
import router from '@/router'

const service = axios.create({
    timeout:5000
})
service.interceptors.request.use(config=>{
    Indicator.open('加载中...');
    if(store.state.user.token){
        config.headers.token = store.state.user.token;
    }
    return config
})
service.interceptors.response.use(v=>{
    let data = v.data.data;
    if( data.code == 1000 ){
        Indicator.close();
        router.push('/login');
        return Promise.reject(new Error('token过期,重新登录'))
    }
    Indicator.close();
    return data
})
export default {
    $axios:service
}
// export default{
	
// 	common:{
// 		method:'GET',
// 		data:{},
// 		params:{},
//         headers:{}
// 	},
// 	$axios( options={} ){
		
// 		options.method = options.method || this.common.method;
// 		options.data = options.data || this.common.data;
// 		options.params = options.params || this.common.params;
// 		options.headers = options.headers || this.common.headers;
// 		//请求前==》显示加载中...
// 		Indicator.open('加载中...');
        
//         //是否是登录状态
//         if( store.state.user.token ){
//             options.headers.token = store.state.user.token;
            
//         }
        
// 		return axios(options).then(v=>{
// 			let data = v.data.data;
//             //如果token过期，重新登录
//             if( data.code == 1000 ){
//                 Indicator.close();
//                 return router.push('/login');
//             }
//             return new Promise((res,rej)=>{
//                 if( !v ) return rej();
//                 //结束===》关闭加载中
//                 setTimeout(()=>{
//                     Indicator.close();
//                 },500)
//                 res( data );
//             })
            
// 		})
		
// 	}
	
// }