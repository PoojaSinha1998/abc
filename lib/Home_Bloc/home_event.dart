part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable{
  HomeEvent([List props= const[]]):super();
}

class AddHomeEvent extends HomeEvent{

  late FoodModel food;


  AddHomeEvent(this.food);


  @override
  // TODO: implement props
  List<Object?> get props => [props];

  @override
  String toString() {
    // TODO: implement toString
    return "AddHomeEvent";
  }

}

class RemoveHomeEvent extends HomeEvent{

 final  String foodName;


   RemoveHomeEvent(this.foodName):super();

  @override
  // TODO: implement props
  List<Object?> get props => [props];

  @override
  String toString() {
    // TODO: implement toString
    return "RemoveHomeEvent";
  }

}
