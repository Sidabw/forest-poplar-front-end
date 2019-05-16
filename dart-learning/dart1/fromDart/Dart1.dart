//1.dart虽然是strong typed language,but type annotations are optional because
// Dart can infer types (类型推断)
//2.dart中,null functions 都是object
//3.TODO  final 和 const 的区别？？？
//4.TODO  dynamic 和 object 的区别？？？


main(){
//  int lineCount; //int type default value is null
//  assert(lineCount == null);
test1();
}

//内建变量学习 Number String Boolean List (也被称为 Array) Map Set
//Rune (用于在字符串中表示 Unicode 字符) Symbol
test1(){
  //1.Dart 语言的 Number 有两种类型:int64 double64
  var x = 1;
  var hex = 0xDEADBEEF; //可以用16 8 进制表示int
  print(hex);

  double y = 1; //相当于是 1.0
  double exponents = 1.42e5;
  print(exponents);

  //num 和 string 的相互转换
  var parse = int.parse('1');
  var parse2 = double.parse('1.1');
  var string = 1.toString();  //不需要Java的包装类
  var string2 = 1.1.toString();

  //2.字符串可以通过 ${expression} 的方式内嵌表达式。 如果表达式是一个标识符，则 {} 可以省略。
  var s = 'sida';
  print('${s.toUpperCase()} is a beauty!');
  var s2 = 'sida';
  print(s.toLowerCase() == s2.toLowerCase()); //不需要equals 直接 ==
  var s3 = "aa\na";
  var s4 = r"aa\na";  //使用r前缀代表原始raw字符串
  print(s3);
  print(s4);

  //3.Boolean
  var b1 = 0 / 0;
  print(b1.isNaN);  //NaN not-a-number

  //4.list
  var list1 = [1, 2, 3];
  var list2 = const [1, 2, 3];
  print(list1.length);
  print(list1[0]);
  print(list1 == list2);  //false

  //5.set.
  var set1 = {'aa', 'bb', 'cc', 'cc'};
  var set2 = const {'aa', 'bb', 'cc'};
  var set3 = <String>{};  //如果只写{}, 编译器会认为你是创建了一个map
  set3.addAll(set1);
  print(set1.length); //3

  //6.map
  var map1 = {
    'a':'aa',
    1:'c',  //后边都得有这个 ,
  };
  var map2 = Map();
  map2['a'] = 'aa'; //这种赋值方式同Java不太一样
  map2[1] = 'c';
  print(map1[1]);
  //7.Rune UTF-32相关 //8.Symbol


}