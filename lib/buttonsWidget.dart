import 'package:first_app/ExpressionProviders.dart';
import 'package:first_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class buttonsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return numberButtonBuilder();
  }

}

class numberButtonBuilder extends StatelessWidget{
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Wrap(
      spacing: 10,
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 10,

      children: [
        // Row 1
        clearButton(),
        negateButton(),
        percentageButton(),
        symbolButton(symbol: "÷"),



        // Row 2
        numberButton(number: 7),
        numberButton(number: 8),
        numberButton(number: 9),
        symbolButton(symbol: "x"),

        // Row 3
        numberButton(number: 4),
        numberButton(number: 5),
        numberButton(number: 6),
        symbolButton(symbol: "-"),

        // Row 4
        numberButton(number: 1),
        numberButton(number: 2),
        numberButton(number: 3),
        symbolButton(symbol: "+"),

        // Row 5
        zeroButton(),
        decimalButton(),
        equalsButton(),
          ],
        ),);
  }
}

class CalculatorButton extends StatelessWidget{
  final term;
  final onPress;
  final Color buttonColor;
  final Color textColor;
  final double width_size;
  CalculatorButton({required this.term, required this.onPress, required this.buttonColor, required this.textColor,  required this.width_size});

  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        fixedSize: Size(80.0 * width_size, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),),

      onPressed: onPress,

      child: Align(
        //alignment: Alignment.centerLeft,

        child: Text(
          term.toString(),
          textAlign: TextAlign.left,
          style: TextStyle(
            color: textColor,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
      ),),);
  }
}

class numberButton extends StatelessWidget{
  final int number;
  numberButton({required this.number});

  Widget build(BuildContext context) {
    return CalculatorButton(term: number, onPress: () => context.read<screenProvider>().addDigit(number * 1.00), buttonColor: Colors.grey.shade800, textColor: Colors.white, width_size: 1);
  }
}

// class zeroButton extends StatelessWidget{
//   Widget build(BuildContext context) {
//     return CalculatorButton(term: 0, onPress: () => context.read<screenProvider>().addDigit(0 * 1.00), buttonColor: Colors.grey.shade800, textColor: Colors.white, width_size: 2.1);
//   }
// }

class decimalButton extends StatelessWidget{
  Widget build(BuildContext context) {
    return  CalculatorButton(term: ".", onPress: () => context.read<screenProvider>().addSymbol("."), buttonColor: Colors.grey.shade800, textColor: Colors.white, width_size: 1);
  }
}

class symbolButton extends StatelessWidget{
  final String symbol;
  symbolButton({required this.symbol});

  Widget build(BuildContext context) {
    return  CalculatorButton(term: symbol, onPress: () => context.read<screenProvider>().addSymbol(symbol), buttonColor: Colors.orange, textColor: Colors.white, width_size: 1);
  }
}

class clearButton extends StatelessWidget{
  Widget build(BuildContext context) {
    return  CalculatorButton(term: "AC", onPress: () => context.read<screenProvider>().clearScreen(), buttonColor: Colors.grey, textColor: Colors.black, width_size: 1);
  }
}

class negateButton extends StatelessWidget{
  Widget build(BuildContext context) {
    return  CalculatorButton(term: "+/-", onPress: () => context.read<screenProvider>().negateNumber(), buttonColor: Colors.grey, textColor: Colors.black, width_size: 1);
  }
}

class percentageButton extends StatelessWidget{
  Widget build(BuildContext context) {
    return  CalculatorButton(term: "%", onPress: () => context.read<screenProvider>().percentifyNumber(), buttonColor: Colors.grey, textColor: Colors.black, width_size: 1);
  }
}

class equalsButton extends StatelessWidget{
  Widget build(BuildContext context) {
    return  CalculatorButton(term: "=",
        onPress: ()
        {
          double result = context.read<screenProvider>().result;
          String expression = context.read<screenProvider>().expression;
          context.read<screenProvider>().clearScreen();
          context.read<screenProvider>().addDigit(result);
          Expression e = Expression(expression: expression, result: result.toString());
          context.read<historyProvider>().addExpression(e);
        },
        buttonColor: Colors.orange, textColor: Colors.white, width_size: 1);
  }

}

class zeroButton extends StatelessWidget{

  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey.shade800,
        fixedSize: Size(80.0 * 2.1, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),),

      onPressed: () => context.read<screenProvider>().addDigit(0 * 1.00),

      child: Padding(
        padding: EdgeInsets.all(5),
    child: Align(
        alignment: Alignment.centerLeft,
        

        child: Text(
          0.toString(),
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),),),);
  }

}




