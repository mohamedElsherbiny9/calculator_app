import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}
class HomeScreenState extends State<HomeScreen>{

  int counter =0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$counter",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                counter++;
                print("$counter");
              });
            }, child: Text("increment",
              style: TextStyle(
                fontSize: 24,
              ),
            )),

          ],
        ),
      ),
    );
  }
}



