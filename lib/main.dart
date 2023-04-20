import 'package:bloc_architecture/Home_Bloc/home_bloc.dart';
import 'package:bloc_architecture/check_out_widget.dart';
import 'package:bloc_architecture/home_page.dart';
import 'package:bloc_architecture/store_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const FoodMainWidget());
}

class FoodMainWidget extends StatefulWidget {
  const FoodMainWidget({Key? key}) : super(key: key);

  @override
  State<FoodMainWidget> createState() => _FoodMainWidgetState();
}

class _FoodMainWidgetState extends State<FoodMainWidget> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        home: HomePageWidget(),
        routes: <String, WidgetBuilder>{
          '/checkoutpage': (BuildContext context) => new CheckOutWidget(),
        },
      ),
    );
  }
}


