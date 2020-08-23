var app = new Vue({
	el: '#app',
	data: {
	message: 'Hello Vue!!'
	}
})

var app2 = new Vue({
	 el: '#app-2',
	 data: {
     message: '页面加载于 ' + new Date().toLocaleString()
  }
})

var app3 = new Vue({
	el: '#app-3',
	data:{
		seen:true
	}
})

var app4 = new Vue({
	el:'#app-4',
	data:{
		todos:[
			{"text":"brew love sida"},
			{"text":"sida love brew"},
			{"text":"brew marry sida"}
		]
	}
})

var app5 = new Vue({
	el:'#app-5',
	data:{
		message:"hello my vue!"
	},
	methods:{
		sidaMethod:function(){
			this.message = "hello my sida!"
		}
	}
})

var app6 = new Vue({
	el:"#app-6",
	data:{
		message:"hello sida sida ...."
	}
})

