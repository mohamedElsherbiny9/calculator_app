import 'package:calculator_app/calculator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = "Calculator";

   CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String tvResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculator",
          style: TextStyle(
            fontSize: 30
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text("$tvResult",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30
                  ),),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton("C",onClearClick),
                CalculatorButton("back Space",onBackspaceClick),
              ],
            ),
          ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton("7",OnDigitClick),
                CalculatorButton("8",OnDigitClick),
                CalculatorButton("9",OnDigitClick),
                CalculatorButton("/",OnOperatorClick)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                CalculatorButton("4",OnDigitClick),
                CalculatorButton("5",OnDigitClick),
                CalculatorButton("6",OnDigitClick),
                CalculatorButton("*",OnOperatorClick)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                CalculatorButton("1",OnDigitClick),
                CalculatorButton("2",OnDigitClick),
                CalculatorButton("3",OnDigitClick),
                CalculatorButton("+",OnOperatorClick)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                CalculatorButton(".",OnDigitClick),
                CalculatorButton("0",OnDigitClick),
                CalculatorButton("=",OnEqualClick),
                CalculatorButton("-",OnOperatorClick)
              ],
            ),
          )

        ],
      ),
    );
  }

  void OnEqualClick(String _){
    String newNumber = tvResult;
    String result = calculate(SavedNum,SavedOperator,newNumber);
    setState(() {
      tvResult=result;
    });
    SavedOperator='';
    SavedNum='';


  }

  void OnDigitClick(String digit){
    if(tvResult.contains(("."))&& digit=="."){
      return;
    }
    setState(() {
      tvResult+="$digit";

    });
  }
  String SavedNum = "";
  String SavedOperator ="";
  void OnOperatorClick(String ClickedOprerator){
    if(tvResult.isEmpty){
      return;
    }
    if(SavedNum.isEmpty){
      SavedNum= tvResult;
      SavedOperator=ClickedOprerator;
      setState(() {
        tvResult='';
      });
    }else{
      String newNumber = tvResult;
     String result = calculate(SavedNum,SavedOperator,newNumber);
     SavedNum=tvResult;
     SavedOperator= ClickedOprerator;
     setState(() {
       tvResult='';
     });
    }

  }
  void onClearClick(String) {
    setState(() {
      tvResult = '';
      SavedNum = '';
      SavedOperator = '';
    });
  }
  void onBackspaceClick(String) {
    if (tvResult.isEmpty) return;

    setState(() {
      tvResult = tvResult.substring(0, tvResult.length - 1);
    });
  }



  String calculate(String lhs, String Operator,String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double res =0.0;
    if(Operator=="+"){
      res = n1+n2;
    } else if(Operator=="-"){
      res = n1-n2;
    }else if(Operator=="/"){
      res = n1/n2;
    }else if(Operator=="*"){
      res = n1*n2;
    }
    return res.toString();

  }
}
