import 'package:bloc_architecture/Home_Bloc/home_bloc.dart';
import 'package:bloc_architecture/check_out_widget.dart';
import 'package:bloc_architecture/food_model.dart';
import 'package:bloc_architecture/store_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWidget extends StatelessWidget {
  List<String> foodName = ["Burrito", "Meet Ball"];
  List<String> foodImage = [
    "https://media.istockphoto.com/id/483120255/photo/asian-oranage-chicken-with-green-onions.jpg?s=612x612&w=0&k=20&c=0T_g_J5OSnmCei1Slgr1128wzAhzceRvLjd94R3gkgs=",
    "https://media.istockphoto.com/id/483120255/photo/asian-oranage-chicken-with-green-onions.jpg?s=612x612&w=0&k=20&c=0T_g_J5OSnmCei1Slgr1128wzAhzceRvLjd94R3gkgs="
  ];
  List<int> foodPrice = [200, 400];
  var total = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    HomeBloc _homeBloc = BlocProvider.of<HomeBloc>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Food Order"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/checkoutpage');
                },
                child: Column(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                      if (state is AddHomeState) {
                        total++;
                      } else {
                        total--;
                        if (total < 0) {
                          total = 0;
                        }
                      }
                      print("Add total: ${total}");
                      return Container(
                        margin: EdgeInsets.only(right: 50),
                        child: Column(
                          children: [
                            Text(total.toString()),
                            Icon(Icons.shopping_cart),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView.builder(
              itemCount: foodName.length,
              itemBuilder: (BuildContext context, int count) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(foodImage[count]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(foodName[count]),
                          Text(foodPrice[count].toString()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: () {
                                print("Add ${foodName[count]} ${foodPrice[count]}");
                                _homeBloc.add(AddHomeEvent(FoodModel(
                                    name: foodName[count],
                                    price: foodPrice[count])));
                                // addTocart(foodName[count], foodPrice[count]);
                              },
                              child: Icon(Icons.add)),
                          GestureDetector(
                              onTap: () {
                                print("Minus");
                                _homeBloc.add(RemoveHomeEvent(foodName[count]));
                                // removeFromCart(foodName[count]);
                              },
                              child: Icon(Icons.remove)),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/checkoutpage': (BuildContext context) => new CheckOutWidget(),
      },
    );
  }
}
