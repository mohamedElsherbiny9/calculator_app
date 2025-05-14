import 'package:calculator_app/Calculator_Screen.dart';
import 'package:flutter/material.dart';

import 'Home_Screen.dart';

void main(){
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: CalculatorScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        CalculatorScreen.routeName: (context) => CalculatorScreen()

      },
      debugShowCheckedModeBanner: false,

    );
  }

}