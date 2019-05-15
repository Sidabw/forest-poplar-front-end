import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;

  //{}代表可选参数；默认值设定。这一个构造方法可以当作好几个构造方法来用。
  Rectangle({this.origin = const Point(0,0), this.width = 0, this.height});

}

main() {
  Rectangle rectangle = Rectangle();
  print(rectangle.origin.x);
  print(rectangle.height);

  Rectangle rectangle2 = Rectangle(origin: const Point(1, 2), width: 1, height: 2);
  print(rectangle2.origin.x);
  print(rectangle2.height);
}