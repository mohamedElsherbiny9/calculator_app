import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnClick = void Function(String digit);
class CalculatorButton extends StatelessWidget {
  String text;
  OnClick onclick;
   CalculatorButton(this.text,this.onclick,{super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Container(
          margin: EdgeInsets.all(2),
          child: ElevatedButton(onPressed: (){
            onclick.call(text);
          },
              child: Text(text,
                style: TextStyle(
                  fontSize: 32
                ),
              )),
        ),
    );

  }

}
