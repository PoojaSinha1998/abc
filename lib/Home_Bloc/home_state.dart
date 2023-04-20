part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable{
  List<Object?> get props => [];
}

class LoadingHomeInitial extends HomeState {
  // @override
  // // TODO: implement props
  // List<Object?> get props => [props];

  @override
  String toString() {
    // TODO: implement toString
    return "LoadingState";
  }
}

class AddHomeState extends HomeState{
  // @override
  // // TODO: implement props
  // List<Object?> get props =>  [props];

  @override
  String toString() {
    // TODO: implement toString
    return "AddHomeState";
  }

}

class RemoveHomeState extends HomeState{
  // @override
  // // TODO: implement props
  // List<Object?> get props =>  [props];

  @override
  String toString() {
    // TODO: implement toString
    return "RemoveHomeState";
  }

}


