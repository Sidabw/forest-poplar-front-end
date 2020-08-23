main(){
  method1();
  print(Point(1, 2).runtimeType);
  print(Point.origin().x);
  print(Point.fromJson(const{
    'x': 11,
    'y': 12,
  }).x);

}

method1(){
  Person p = null;
  p?.a = 4; //如果p不是null，则设置其a为4
  print('---------------');
}

class Person{
  int a;
  String b;
}

class Point{
  num x, y;
  //普通构造函数
  Point(this.x, this.y);
  //命名构造函数
  Point.origin() {
    x = 0;
    y = 0;
  }
  //初始化列表
  Point.fromJson(Map<String, num> json) : x = json['x'], y = json['y'];
  //初始化列表，验证
  Point.fromValue(this.x, this.y) : assert(x > 0);
  //初始化列表，重指向
  Point.alongXAxis(num x) : this(x, 0);
}