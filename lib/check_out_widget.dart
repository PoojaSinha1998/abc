import 'package:bloc_architecture/Home_Bloc/home_bloc.dart';
import 'package:bloc_architecture/store_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutWidget extends StatefulWidget {
  const CheckOutWidget({Key? key}) : super(key: key);

  @override
  State<CheckOutWidget> createState() => _CheckOutWidgetState();
}

class _CheckOutWidgetState extends State<CheckOutWidget> {

  @override
  void initState() {
    // TODO: implement initState
    updateTotal();
    Future.delayed(Duration(seconds:3),()=>print("Hi"));
    super.initState();
  }



  StoreData storeData = StoreData();
  int total = 0;

  void updateTotal() {
    var foodTotal = storeData.retriveData();
    foodTotal.forEach((key, value) {
      total = total + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = storeData.retriveData();
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: data.keys.length,
                itemBuilder: (BuildContext context, int count) {
                  String key = data.keys.elementAt(count);
                  return ListTile(
                    title: Text("${key}"),
                    subtitle: Text("${data[key]}"),
                  );
                }),
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if(state is AddHomeState){
                  // AddHomeState.
                }
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Text("${total}"),
                    Text("Rs"),

                  ],
                );
              },
            )

          ],
        )


    );
  }
}
