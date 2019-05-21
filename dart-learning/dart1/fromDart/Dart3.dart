//从 词法作用域 开始 ...
main(){
  method1();
  //词法闭包。如下：1 这个值在调用method2Return的时候依然能够访问的到。
  var method2Return = method2(1);
  print(method2Return(2));
  print(method3() == null);
  method4();
  method5();
}

//方法内套方法内套方法
//内部方法在外部访问不到，必须在内部调用
method1() {
  var m1 = 'a';
  method2() {
    var m2 = 'b';
    method3() {
      var m3 = 'c';
      print(m1);
      print(m2);
      print(m3);
    }
    method3();
  }
  method2();
}

method2(num a) {
  return (num b) => a + b; //返回一个函数对象
}

//所有的void方法都会隐式的return 一个 null
method3(){
  print('method3');
  print('--------------------');
}

//运算符
method4(){
  print(5 /2 );   //结果是双浮点类型
  print(5 % 2);   //取余
  print(5 ~/ 2);  //取整
  var a = 1;
  print(a is int);  //is  类型判断
  print((a as int).floor());  //as 类似强转
  var b = null;
  b ??= 'a';  //b 为null时进行赋值操作
  print(b);
  print('--------------------');
}

method5(){
  var callbacks = [];
  for(var i = 0 ; i < 2 ; i ++){
    //往数组中添加函数，即添加对象，这里使用了闭包的概念。
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c());  //拿到每一个，函数，调用。
}

method6(){
  //dart 开启assert --enable-asserts
  
}

