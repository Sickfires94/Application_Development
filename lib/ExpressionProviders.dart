import 'dart:math';

import 'package:flutter/cupertino.dart';

class screenProvider extends ChangeNotifier{
  List<Term> _terms = [];
  List<Term> get terms => _terms;
  double get result => _evaluateCurrentExpression();

  String get expression => _getExpression();

  String _getExpression(){
    String expression = "";
    for (Term t in _terms){
      expression += t.getTerm();
    }
    return expression;
  }

  String getLastNum(){
    if (_checkIfLastNum()){
      return _terms[_terms.length - 1].getTerm();
    }
    return _terms[_terms.length - 2].getTerm();
  }

  void addDigit(double number){
    if (_checkIfLastNum()){
      (_terms[_terms.length - 1] as numberTerm).addDigit(number);
    }
    else {
      _terms.add(numberTerm(term: (number)));
    }
    notifyListeners();
  }

  void addSymbol(String symbol){
    if( symbol == "." && _terms.length > 2 && ((_terms[_terms.length - 2] as sign).getTerm() == ".")) return;
    if(_checkIfLastNum()){
      _terms.add(sign(term: symbol));
    }
    else{
      _terms[_terms.length - 1] = sign(term: symbol);
    }
    notifyListeners();
  }

  void clearScreen(){
    _terms = [];
    notifyListeners();
  }

  void negateNumber(){
    if (_checkIfLastNum()){
      (_terms[_terms.length - 1] as numberTerm).negateNum();
    }
    else{
      (_terms[_terms.length - 1] as numberTerm).negateNum();
    }
    notifyListeners();
  }

  void percentifyNumber(){
    if (_checkIfLastNum()){
      (_terms[_terms.length - 1] as numberTerm).percentify();
    }
    else {
      double result = _evaluateCurrentExpression();
      addDigit(result);
    }
    notifyListeners();
  }

  // 2 + 15 + 0 + 0 + 2

  double _evaluateCurrentExpression(){
    List<String> operations = [];
    List<double> numbers = [];


    bool skipIter = false;
    // Populate operations and numbers list
    for (int i = 0; i < _terms.length; i++){
      if (skipIter) {
        skipIter = false;
        continue;
      }
        skipIter = false;
        if (i % 2 == 0)
          numbers.add((_terms[i] as numberTerm).term);
        else {
        if ((_terms[i] as sign).term == ".") {
          print("hwello");
          skipIter = true;
          double num = (_terms[i + 1] as numberTerm).term;
          while(num > 1){
            num /= 10.0;
          }
          print(num);
          numbers[numbers.length - 1] += num;
        }
        else
          operations.add((_terms[i] as sign).term);
      }
    }

    // Loop through list and back-propagate multiplication/division operations until none are left
    bool mulDivFound = true;
    while (mulDivFound){
      mulDivFound = false;
      for (int i = 0; i < numbers.length - 1; i++){

        print("******************");
        print(numbers);
        print(operations);

        bool operDone = false;
        if (operations[i] == "x"){
          numbers[i] *= numbers[i + 1];
          operDone = true;
        }
        else  if (operations[i] == "÷"){
          numbers[i] /= numbers[i + 1];
          operDone = true;
        }
        if (operDone){
          mulDivFound = true;

          if (i < operations.length - 1 && (operations[i + 1] == "x" || operations[i + 1] == "÷")){
            numbers[i + 1] = 1;
          }
          else{
            numbers[i + 1] = 0;
            operations[i] = "+";
          }}
        }
      }

      // Loop through List and add/subtract the remaining terms
      double answer = numbers[0];
      for (int i = 1; i < numbers.length; i++) {
        if (operations[i - 1] == "+")
          answer += numbers[i];
        else answer -= numbers[i];
      }
      print("****************************");
      print(answer);
      return answer;
  }



  bool _checkIfLastNum(){
    if(_terms.length == 0) {
      _terms.add(numberTerm(term: 0));
      return true;
    }
    return _terms[_terms.length - 1] is numberTerm;
  }

}

class historyProvider extends ChangeNotifier{
  List<Expression> _history = [];
  List<Expression> get history => _history;

  void addExpression(Expression e){
    _history.add(e);
    notifyListeners();
  }
}

abstract class Term {
  String getTerm();
}

class numberTerm extends Term {
  double term;
  numberTerm({required this.term});

  String getTerm(){
    if (term == term.toInt()) return term.toInt().toString();
    return term.toString();
  }

  void addDigit(double digit){
    term = term * 10 + digit;
  }

  void negateNum(){
    term *= -1;
  }

  void percentify(){
    term /= 100;
  }
}
class sign extends Term {
  final String term;
  sign({required this.term});

  String getTerm(){
    return term;
  }
}

class Expression{
  final String expression;
  final String result;

  Expression({required this.expression, required this.result});
}