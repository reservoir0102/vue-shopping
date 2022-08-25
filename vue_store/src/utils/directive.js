export default {
    install(Vue){
        Vue.directive('lazyLoad',{
            inserted(el,binding){
               const observer = new IntersectionObserver(([{isIntersecting}])=>{
                    if(isIntersecting){
                        observer.unobserve(el)
                        console.log(el);
                        el.className = binding.value
                    }
               },{threshold:0.6})
               observer.observe(el)
            }  
        })
    }
}