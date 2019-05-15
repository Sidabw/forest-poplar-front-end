
class Bicycle{

  Bicycle(this.cadence, this.speed, this.gear);//这个方法没有实际的方法体，合法的。
  int cadence;
  int speed;
  int gear;
}

void main(){

  var bick = new Bicycle(2, 0, 1);
  print(bick);
}