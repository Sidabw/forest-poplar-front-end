import 'dart:math';

abstract class Shape {
  num get area;//猜测：属性自动生成...

  factory Shape(String type){ //使用factory关键字，对应main中的3
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2); //pi pow均为dart:mart库的属性和方法
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}


main() {
  //1.
  Shape circle = Circle(2);
  final square = Square(2);//直接使用final 而不用Shape.效果是一样的。
  print(circle.area);
  print(square.area);

  //2.
  final circle2 = shapeFactory("circle");
  print(circle2.area);

  //3.
  final circle3 = Shape("circle");
  print(circle3.area);

}

//这个方法是在所有类之外。
Shape shapeFactory(String type){
  if (type == 'circle') return Circle(2);
  if (type == 'square') return Square(2);
  throw 'Can\'t create $type.';
}

//接口相关：Dart 语言并没有提供 interface 关键字，但是每一个类都隐式地定义了一个接口。
//implements Circle 就必须“添加” 对应实例变量
class CircleMock implements Circle{
  num area;
  num radius;
}