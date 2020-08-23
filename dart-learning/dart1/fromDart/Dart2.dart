//1.函数也是对象，其对应类型是Function。函数可以不声明返回值。Effective Dart 建议公共api声明类型。
main(List<String> arguments){
  // 带参数的main这样运行：dart Dart2.dart 1 test
//  print(arguments[0]);
//  print(arguments[1]);

  method1('a', 1);
  method2(a: 'c',b: 2);
  method2(a: 'c');
//  method3('a', 'a');
  method3('a');
  method4(a: 'a');
  method6();

  var list = [1, 2, 3];
  list.forEach(printElement);

  //lambda表达式函数
  var loudify = (msg) => '!!!${msg.toUpperCase()}!!!!';
  print(loudify('aaaa'));
}

method1(String a, int b) {
  print(a + b.toString());
  print("---------------------------------------------------");
}

//指定参数名调用时的方式声明：
//如果调用函数的时候想通过(b: 2, a: 'c') 这种指定参数名的调用方式，那函数的参数列表声明就必须如下：
//@required 不能用？？ TODO  ？？？
method2({String a, int b}) {
  print(a);
  print(b);
  print("---------------------------------------------------");
}

//可选参数 []
method3(String a, [String b]) {
  print(a);
  print(b == null);
  print("---------------------------------------------------");
}

//参数默认值
method4({String a , String b = 'b'}) {
  print(a);
  print(b);
  print("---------------------------------------------------");
}

//综合一下 以下写法是错误的
//只能在可选[]中加上默认值，而不能在{}加上[]。因为{}本身就是可选的啊...
//method5({String a, String b, [String c = 'c']}){
//  print(a);
//  print(b);
//  print(c);
//}

//list 和 map 的默认值
method6(
    {List<int> list = const [1, 2, 3],
      Map<String, int> map = const {
      'a': 1,
      'b': 2,
      'c': 3,
      }}){
  print(list);
  print(map);
}

//类似jdk1.8的Consumer的使用
printElement(int element){
  print(element);
}
