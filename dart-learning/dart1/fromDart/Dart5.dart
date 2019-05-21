main(){
  var vector = Vector(1, 2);
  var vector2 = Vector(1, 2);
  print((vector2 - vector).x.toString() + '-' + (vector2 - vector).y.toString());
}
class Vector {
  final int x, y;
  Vector(this.x, this.y);
  //对象之间的 + 运算
  Vector operator +(Vector v) =>Vector(x + v.x, y + v.y);
  //对象之间的 - 运算
  Vector operator -(Vector v) =>Vector(x - v.x, y - v.y);

}
//TODO mixin ???