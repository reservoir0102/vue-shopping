<template>
	<div class='list'>
		<header>
			<div class='returns'>
				<i class='iconfont icon-fanhui'></i>
			</div>
			<div class='search'>
				<i class='iconfont icon-fangdajing'></i>
				<span>搜您喜欢的...</span>
			</div>
			<div class='go-home'>
				<img src="@/assets/images/home.png" alt="">
			</div>
		</header>
		<section>
			<div class='list-l'>
				<div class="border"
				:style="{transform:`translateY(${this.crtIdx*50}px)`}"></div>
				<ul class='l-item'>
					<li  
					v-for="(item,index) in titleList" 
					:key="item.id"
					@click="handleChange(index)">{{item.name}}</li>
					 
				</ul>
			</div>
			
			<div class='list-r' ref="right">
				<div>
				<ul v-for="(item,index) in contentList" :key="index" class="shop-list">
					<li  v-for="item1 in item" :key="item1.id">
						<h2>{{item1.name}}</h2>
						<ul class='r-content'>
							<li v-for="itemList in item1.list" :key="itemList.id">
								<img :src="itemList.imgUrl" alt="">
								<span>{{itemList.name}}</span>
							</li>
							
						</ul>
					</li>
				</ul>
				<div class="shop-list append-height" style="height:424px"></div>
				</div>
			</div>
			
		</section>
		<Tabbar></Tabbar> 
	</div>
</template>

<script>
import Tabbar from '@/components/common/Tabbar.vue'
import http from '@/common/api/request.js'
import BetterScroll from 'better-scroll'
export default {
  name: "List",
  components:{
  	Tabbar
  },
  data(){
	  return{
		  titleList:[],
		  contentList:[],
		  rightBScroll:'',//右侧滑动BScroll
		  allHeight:[],//承载右侧每一块的高度值
		  //scrollY:0,//右侧滚动距离
		  crtIdx:0
	  }
  },
  created(){
	  this.getCateList()
  },
  computed:{
	//   crtIdx(){
	// 	  if(this.scrollY<=0) return 0
		  
	// 		return this.allHeight.findIndex((item,i,array)=>{
					
	// 			return this.scrollY>=item && this.scrollY<=array[i+1]
	// 		})
		  	  
	//   }
	//   currentList(){
	// 	  return this.contentList[this.crtIdx]
	//   },
	//  borderStyle(){
	// 	 return {
	// 		 transform:`translateY(${this.crtIdx*50}px)`
	// 	 }
	//  }
  },
  methods:{
	  handleChange(index){
		  this.crtIdx=index
		  this.rightBScroll.scrollTo(0,-this.allHeight[index],300)
		//   this.$nextTick(()=>{
		// 	  console.log(this.scrollY);
		//   })
		  
	  },
	 async getCateList(){
		let res= await http.$axios({
			  url:"/api/goods/list"
		  })
		this.titleList=res.map(item=>{
			return {
				id:item.id,
				name:item.name
			}
		})
		this.contentList=res.map(item=>item.data)
		this.$nextTick(()=>{
			//右侧滑动
			this.rightBScroll = new BetterScroll(this.$refs.right,{
				click:true,
				bounce:false,
				probeType:3
			});
			//let hight=0
			//this.allHeight.push(hight)
			let uls=this.$refs.right.getElementsByClassName('shop-list')
			Array.from(uls).forEach(item=>{
				//hight+=item.clientHeight
				this.allHeight.push(item.offsetTop)
			})
			//this.allHeight.push(Infinity)
			console.log(this.allHeight);
			this.rightBScroll.on('scroll',pos=>{
				let moveY = Math.abs(pos.y)
				
				if(moveY>this.allHeight[this.allHeight.length-2]){
					
					this.crtIdx=this.allHeight.length-2
				}else{
					this.crtIdx=this.allHeight.findIndex((item,i,array)=>{
					
	 				return moveY>=item && moveY<array[i+1]
	 				})
				}
				
				//console.log(pos.y);
			})
		})
		 
	}
  }
};
</script>
<style scoped lang='scss'>
.list{
	display: flex;
	flex-direction: column;
	width: 100vw;
	height: 100vh;
	overflow: hidden;
}
header{
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 1.173333rem;
	
	background-color: #b0352f;
	.returns{
		line-height: 1.173333rem;
		padding:0 0.533333rem;
		i{
			color:#fff;
			font-size:0.693333rem;
		}
	}
	.search{
		display: flex;
		align-items: center;
		flex: 1;
		padding:0.16rem 0.266666rem;
		background-color: #FFFFFF;
		border-radius: 0.64rem;
		i{
			padding-right: 0.16rem;
			color:#666;
			font-size:0.48rem;
		}
		span{
			color:#666;
			font-size:0.373333rem;
		}
	}
	.go-home{
		padding: 0 0.266666rem;
		line-height: 1.173333rem;
		img{
			width: 0.48rem;
			height: 0.48rem;
		}
	}
}
section{
	display: flex;
	flex:1;
	overflow:hidden;
}
.list-l{
	 display: flex;
	width: 2.48rem;
	background-color: #fff;
	border-right: 1px solid #CCCCCC;
	overflow: hidden;
	.border{
		width: 2px;
		height: 1.3333rem;
		transition: all .5s;
		background-color: #b54f4a;
	}
	.l-item{
		display: flex;
		flex: 1;
		
		flex-direction: column;
		// justify-content: center;
		align-items: center;
		li{
			width: 100%;
			line-height: 1.333333rem;
			text-align: center;
			font-size:0.373333rem;
			
			// &.active{
			// 	color:#b54f4a;
			// 	border-left:6px solid #b54f4a;
			// }
		}
	}
}

.list-r{
	flex:1;
	overflow: hidden;
	position: relative;
	.shop-list{
		text-align: center;
		h2{
			padding:0.533333rem 0;
			font-size:0.64rem;
			font-weight: 400;
		}
		.r-content{
			display: flex;
			flex-wrap: wrap;
			li{
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				width: 33.33%;
				padding:0.266666rem 0;
				img{
					width: 1.413333rem;
					height: 1.413333rem;
				}
				span{
					font-size:0.426666rem;
				}
			}
		}
	}
}
::v-deep.tabbar{
	border-top:1px solid #CCCCCC;
}
</style>


