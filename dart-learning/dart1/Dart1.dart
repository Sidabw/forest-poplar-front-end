
class Bicycle{

  Bicycle(this.cadence, this.speed, this.gear);//这个方法没有实际的方法体，合法的。
  int cadence;
  int speed;
  int gear;

  int _speed2 = 10; //private 变量的表示形式

  int get speed2 => _speed2;	//private变量的get方法。

  void setSpeed2(int decrement){	//set方法
    _speed2 = decrement;
  }

  @override
  String toString() => 'Bicycle: $speed mph';	//1.单行函数的写法	2.$取值字符串模版
}

void main(){
  var bick = new Bicycle(2, 0, 1);
//   var bick = Bicycle(2, 0, 1); new 是可选的
  print(bick);	// toString 调用
  print(bick.speed);	//public 属性调用
  bick.setSpeed2(11);	//set方法调用
  print(bick.speed2); //private属性get方法调用
  print(bick._speed2);//简写
}