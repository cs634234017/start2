import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cartax_v2/screens/calculator/calculate_button.dart';
import 'package:flutter_cartax_v2/screens/result/result_screen.dart';
import 'package:flutter_cartax_v2/screens/calculator/type.dart';
import 'package:flutter_cartax_v2/screens/calculator/car.dart';
import 'package:flutter_cartax_v2/screens/calculator/truckvan.dart';
import 'package:flutter_cartax_v2/screens/calculator/calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int carTax = 0;
  int typeIndex = 1;
  int cc = 6;
  int year = 1;
  int kl = 501;

  void changeTypeIndex(int newTypeIndex) {
    setState(() {
      typeIndex = newTypeIndex;
    });
  }

  void changeCC(double newCC) {
    setState(() {
      cc = newCC.toInt();
    });
  }

  void changeYear(int newYear) {
    setState(() {
      year = newYear.toInt();
    });
  }

  void changeKL(double newKL) {
    setState(() {
      kl = newKL.toInt();
    });
  }

  void calculateButtonClick() {
    setState(() {
      if (typeIndex == 1) {
        carTax = Calculator.car(cc: cc, year: year);
      } else if (typeIndex == 2) {
        carTax = Calculator.truck(kl);
      } else if (typeIndex == 3) {
        carTax = Calculator.van(kl);
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(carTax: carTax)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Type(typeIndex: typeIndex, carTypeChange: changeTypeIndex //Code,
            ),
        Car(
            cc: cc,
            year: year,
            changeCC: changeCC,
            changeYear: changeYear), //Code Car Detail
        CalculateButton(
          buttonClickedFunction: calculateButtonClick,
        ),
      ],
    );
  }
}
