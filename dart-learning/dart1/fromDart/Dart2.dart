//1.函数也是对象，其对应类型是Function。函数可以不声明返回值。Effective Dart 建议公共api
//声明类型。
main(){
  method1('a', 1);
  method2(b: 2, a: 'c');
}

method1(String a, int b) {
  print(a + b.toString());
}

method2({String a, int b}){
  print(a + b.toString());
}