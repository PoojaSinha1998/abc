import 'package:equatable/equatable.dart';

class FoodModel extends Equatable{



   String name;
   int price;

  FoodModel({required this.name, required this.price}):super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  String toString() {
    // TODO: implement toString
    return "Food Name: ${name} and Price: ${price}";
  }


}