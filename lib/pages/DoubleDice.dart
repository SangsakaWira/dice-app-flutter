import 'package:flutter/material.dart';
import 'dart:math';
import 'package:geolocator/geolocator.dart';

class DoubleDice extends StatefulWidget {
  const DoubleDice({Key? key}) : super(key: key);

  @override
  State<DoubleDice> createState() => _DiceState();
}

class _DiceState extends State<DoubleDice> {

  int limit = 5;
  int randomNumberRight = 1;
  int randomNumberLeft = 1;

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  int getRandomImage(int limit) {
    Random random = Random();
    int randomNumber = random.nextInt(limit) + 1;
    return randomNumber;
  }

  void randomizeDice(){
    randomNumberRight=getRandomImage(limit);
    randomNumberLeft=getRandomImage(limit);
    getLocation();
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