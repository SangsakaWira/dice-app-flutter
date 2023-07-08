import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body:  const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DiceState();
}

class _DiceState extends State<DicePage> {

  int limit = 5;
  int randomNumberRight = 1;
  int randomNumberLeft = 1;

  int getRandomImage(int limit) {
    Random random = Random();
    int randomNumber = random.nextInt(limit) + 1;
    return randomNumber;
  }

  void randomizeDice(){
    randomNumberRight=getRandomImage(limit);
    randomNumberLeft=getRandomImage(limit);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed:(){
                 setState(() {
                   randomizeDice();
                 });
                },child: Image.asset('images/dice$randomNumberLeft.png')),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed:(){
                  setState(() {
                    randomizeDice();
                  });
                },child: Image.asset('images/dice$randomNumberRight.png')),
              )),
        ],
      ),
    );
  }
}

