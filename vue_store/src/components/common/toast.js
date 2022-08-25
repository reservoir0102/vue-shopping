import Toast from './Toast.vue'
import Vue from 'vue'
const div = document.createElement('div')

let timer = null
export default (msg,duration=1500)=>{
    const instance = Vue.extend(Toast)
    
    let toast = new instance()
    
    
    toast.msg = msg
  
    toast.$mount(div)
    //toast.duration = duration
    document.body.appendChild(toast.$el)
    
    timer = setTimeout(()=>{
        document.body.removeChild(toast.$el)
        
        timer = null
    },duration)
}