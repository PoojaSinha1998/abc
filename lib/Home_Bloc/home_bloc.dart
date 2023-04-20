import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/food_model.dart';
import 'package:bloc_architecture/store_data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  StoreData _storeData= StoreData();


  HomeBloc() : super(LoadingHomeInitial()) {
    // on<HomeEvent>((event, emit) {
    //   print("before add event");
    //   if(event is AddHomeEvent)
    //   {print("In Home event");
    //   _mapAddEventToAddState(event,emit);
    //   }
    //   else if(event is RemoveHomeEvent)
    //   {
    //
    //     _mapRemoveEventToRemoveState(event,emit);
    //   }
    //   else
    //     LoadingHomeInitial();
    // });

    on<AddHomeEvent>(_mapAddEventToAddState);
    on<RemoveHomeEvent>(_mapRemoveEventToRemoveState);
  }

//  Stream<HomeState>  mapEventToState(HomeEvent event) async*{
//
//     if(event is AddHomeEvent)
//       {print("In Home event");
//         yield* _mapAddEventToAddState(event);
//       }
//     else if(event is RemoveHomeEvent)
//       {
//
//         yield* _mapRemoveEventToRemoveState(event);
//       }
//     else
//       yield LoadingHomeInitial();
//
// }

  _mapAddEventToAddState(AddHomeEvent event,Emitter<HomeState> emit) {
    emit(LoadingHomeInitial());
    print("In Home event");
    _storeData.storeFoodDetail(event.food.name, event.food.price);
   emit(AddHomeState());


  }

  _mapRemoveEventToRemoveState(RemoveHomeEvent event,Emitter<HomeState> emit) {
    emit( LoadingHomeInitial());
    _storeData.removeFoodItem(event.foodName);

    emit (RemoveHomeState());

  }
}
