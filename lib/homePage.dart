// 7/13/22
// - CURRENT ISSUES:
//   - allow lotus flower nav icon to overflow navbar instead of increasing the navbar height
//   - change height of column elements using media query rather than pixels
//     - look for 'context'?

// 7/14/22
// - CURRENT ISSUES:
//   - allow lotus flower nav icon to overflow navbar instead of increasing the navbar height
//   - change height of column elements using media query rather than pixels
//     - look for 'context'?
//   - round the corners of the progress bars
//   - "incorrect use of parent data widget" error

// https://pub.dev/packages/percent_indicator
// https://medium.com/flutter-community/flutter-understanding-counter-app-ca89de564170
// https://stackoverflow.com/questions/54905388/incorrect-use-of-parent-data-widget-expanded-widgets-must-be-placed-inside-flex
// https://stackoverflow.com/questions/62088984/flutter-app-dies-with-failed-assertion-line-4901-pos-16-child-is-parentdata

import 'dart:async';

import 'calendar.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'assets/lotus_icons_icons.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'HABYT',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffdcf8f1),
      ),
      home: Splash(),

    );
  }
}

class Splash extends StatefulWidget{
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<Splash>{
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'flutterapp')));
    });

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: const Color(0xFF70C2A6),
        child: Stack(
          children: <Widget>[
            Container(
                alignment: const Alignment(0,-.4),
                child: const Image(
                  image: AssetImage('assets/KoiBeg.png'),
                  width: 200,
                  height: 200,
                )
            ),
            Container(
              alignment: const Alignment(0,.5),
              child: const Text(
                'HABYT',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bakerie',
                ),
              ),
            ),
            Container(
              alignment: const Alignment(0,.6),
              child: const Text(
                "Healthy Actions, Better You",
                style: TextStyle(
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int foodAvail = 5;
  int totalGoals = 0;

  bool stepDone = false;
  bool waterDone = false;
  bool sleepDone = false;
  bool veggiesDone = false;

  double stepIncrement = 500; //steps
  double waterIncrement = 1; //cups of water
  double sleepIncrement = 1; //hours
  double veggiesIncrement = 0.5; //cups?

  double stepPlaceholder = 0; //all values start at 0 until the user increases and decreases --> user's current progress
  double waterPlaceholder = 0;
  double sleepPlaceholder = 0;
  double veggiesPlaceholder = 0;

  double totalStep = 0; //sum of all placeholders added
  double totalWater = 0;
  double totalSleep = 0;
  double totalVeggies = 0;

  int goalStep = 10000; //DEFAULT goals --> later to be imported from settings page
  int goalWater = 15;
  int goalSleep = 8;
  double goalVeggies = 3;

  double stepPercent = 0; // total/goal --> how far along they are
  double waterPercent = 0;
  double sleepPercent = 0;
  double veggiesPercent = 0;

  int displayStep = 0; //percent*100
  int displayWater = 0;
  int displaySleep = 0;
  int displayVeggies = 0;

  bool isVisibleStep = false;
  bool isVisibleWater = false;
  bool isVisibleSleep = false;
  bool isVisibleVeggies = false;

  String arrowStep = "-->";
  String arrowWater = "-->";
  String arrowSleep = "-->";
  String arrowVeggies = "-->";

  //when user presses "+" button to increment the placeholder
  void increaseStep(){
    setState((){
      stepPlaceholder += stepIncrement;
    });
  }

  //when "-" is pressed
  void decreaseStep(){ //CANNOT DECREASE IF PLACEHOLDER = 0
    if(stepPlaceholder>0){
      setState((){
        stepPlaceholder -= stepIncrement;
      });
    }
  }

  //when "ADD" is pressed
  void addStep(){ //set bounds so it cannot exceed 100%
    setState((){
      totalStep += stepPlaceholder;
      stepPercent = totalStep/goalStep;
      if(stepPercent >= 1){
        stepPercent = 1;
        if(!stepDone){
          totalGoals++;
          stepDone = true; //chicken
        }
      }
      displayStep = (stepPercent * 100).round();
      stepPlaceholder = 0;
    });
  }

  //when user presses "+" button to increment the placeholder
  void increaseWater(){
    setState((){
      waterPlaceholder += waterIncrement;
    });
  }

  //when "-" is pressed
  void decreaseWater(){ //CANNOT DECREASE IF PLACEHOLDER = 0
    if(waterPlaceholder>0){
      setState((){
        waterPlaceholder -= waterIncrement;
      });
    }
  }

  //when "ADD" is pressed
  void addWater(){ //set bounds so it cannot exceed 100%
    setState((){
      totalWater += waterPlaceholder;
      waterPercent = totalWater/goalWater;
      if(waterPercent >= 1){
        waterPercent = 1;
        if(!waterDone){
          totalGoals++;
          waterDone = true;
        }
      }
      displayWater = (waterPercent * 100).round();
      waterPlaceholder = 0;
    });
  }

  //when user presses "+" button to increment the placeholder
  void increaseSleep(){
    setState((){
      sleepPlaceholder += sleepIncrement;
    });
  }

  //when "-" is pressed
  void decreaseSleep(){ //CANNOT DECREASE IF PLACEHOLDER = 0
    if(sleepPlaceholder>0){
      setState((){
        sleepPlaceholder -= sleepIncrement;
      });
    }
  }

  //when "ADD" is pressed
  void addSleep(){ //set bounds so it cannot exceed 100%
    setState((){
      totalSleep += sleepPlaceholder;
      sleepPercent = totalSleep/goalSleep;
      if(sleepPercent >= 1){
        sleepPercent = 1;
        if(!sleepDone){
          totalGoals++;
          sleepDone = true;
        }
      }
      displaySleep = (sleepPercent * 100).round();
      sleepPlaceholder = 0;
    });
  }

  //when user presses "+" button to increment the placeholder
  void increaseVeggies(){
    setState((){
      veggiesPlaceholder += veggiesIncrement;
    });
  }

  //when "-" is pressed
  void decreaseVeggies(){ //CANNOT DECREASE IF PLACEHOLDER = 0
    if(veggiesPlaceholder>0){
      setState((){
        veggiesPlaceholder -= veggiesIncrement;
      });
    }
  }

  //when "ADD" is pressed
  void addVeggies(){ //set bounds so it cannot exceed 100%
    setState((){
      totalVeggies += veggiesPlaceholder;
      veggiesPercent = totalVeggies/goalVeggies;
      if(veggiesPercent >= 1){
        veggiesPercent = 1;
        if(!veggiesDone){
          totalGoals++;
          veggiesDone = true;
        }
      }
      displayVeggies = (veggiesPercent * 100).round();
      veggiesPlaceholder = 0;
    });
  }

  //when bottom "FOOD" button is pressed
  void decreaseFood(){
    setState((){
      if(foodAvail <= 0){
        foodAvail == 0;
      }else{
        foodAvail--;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/ezgif.com-gif-maker.gif"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Visibility(
                    visible: isVisibleStep,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .025, screenWidth * .045, 0),
                      width: double.infinity,
                      height: screenHeight * .18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.pinkAccent,
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(100, screenHeight * .011, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  'Add:',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                Row(
                                  children: <Widget>[
                                    TextButton(
                                      onPressed: decreaseStep,
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Text("$stepPlaceholder"),
                                    TextButton(
                                      onPressed: increaseStep,
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50), // <-- Radius
                                    ),
                                  ),
                                  onPressed: addStep,
                                  child: const Text(
                                    'ADD',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Current:",
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    //padding: EdgeInsets.only(left: 50, bottom: 0, right: 0, top: 5),
                                    child: Text(
                                      "$totalStep" + "/" + '$goalStep' + " steps",
                                      // style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(screenWidth * .06, screenHeight * .041, screenWidth * .045, 0),
                    child: CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10.0,
                      animation: false,
                      percent: stepPercent,
                      center: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: (){
                          setState((){
                            isVisibleStep = !isVisibleStep;
                            if(arrowStep == "-->"){
                              arrowStep = "<--";
                            }else{
                              arrowStep = "-->";
                            }
                          });
                        },
                        child: Text(
                          "Steps\n" + '$displayStep' + "%" + "\n" + "$arrowStep",
                          textAlign: TextAlign.center,
                          // style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.pink,
                    ),
                  ),
                ],
              ),

              Stack(
                children: <Widget>[
                  Visibility(
                    visible: isVisibleWater,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .025, screenWidth * .045, 0),
                      width: double.infinity,
                      height: screenHeight * .18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(100, screenHeight * .011, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  'Add:',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                Row(
                                  children: <Widget>[
                                    TextButton(
                                      onPressed: decreaseWater,
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Text("$waterPlaceholder"),
                                    TextButton(
                                      onPressed: increaseWater,
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50), // <-- Radius
                                    ),
                                  ),
                                  onPressed: addWater,
                                  child: const Text(
                                    'ADD',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Current:",
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    //padding: EdgeInsets.only(left: 50, bottom: 0, right: 0, top: 5),
                                    child: Text(
                                      "$totalWater" + "/" + '$goalWater' + " cups",
                                      // style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(screenWidth * .06, screenHeight * .041, screenWidth * .045, 0),
                    child: CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10.0,
                      animation: false,
                      percent: waterPercent,
                      center: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: (){
                          setState((){
                            isVisibleWater = !isVisibleWater;
                            if(arrowWater == "-->"){
                              arrowWater = "<--";
                            }else{
                              arrowWater = "-->";
                            }
                          });
                        },
                        child: Text(
                          "Water\n" + '$displayWater' + "%" + "\n" + "$arrowWater",
                          textAlign: TextAlign.center,
                          // style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.blue,
                    ),
                  ),
                ],
              ),

              Stack(
                children: <Widget>[
                  Visibility(
                    visible: isVisibleSleep,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .025, screenWidth * .045, 0),
                      width: double.infinity,
                      height: screenHeight * .18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.yellowAccent,
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(100, screenHeight * .011, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  'Add:',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                Row(
                                  children: <Widget>[
                                    TextButton(
                                      onPressed: decreaseSleep,
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Text("$sleepPlaceholder"),
                                    TextButton(
                                      onPressed: increaseSleep,
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50), // <-- Radius
                                    ),
                                  ),
                                  onPressed: addSleep,
                                  child: const Text(
                                    'ADD',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Current:",
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    //padding: EdgeInsets.only(left: 50, bottom: 0, right: 0, top: 5),
                                    child: Text(
                                      "$totalSleep" + "/" + '$goalSleep' + " hours",
                                      // style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(screenWidth * .06, screenHeight * .041, screenWidth * .045, 0),
                    child: CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10.0,
                      animation: false,
                      percent: sleepPercent,
                      center: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: (){
                          setState((){
                            isVisibleSleep = !isVisibleSleep;
                            if(arrowSleep == "-->"){
                              arrowSleep = "<--";
                            }else{
                              arrowSleep = "-->";
                            }
                          });
                        },
                        child: Text(
                          "Sleep\n" + '$displaySleep' + "%" + "\n" + "$arrowSleep",
                          textAlign: TextAlign.center,
                          // style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.yellow,
                    ),
                  ),
                ],
              ),

              Stack(
                children: <Widget>[
                  Visibility(
                    visible: isVisibleVeggies,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .025, screenWidth * .045, 0),
                      width: double.infinity,
                      height: screenHeight * .18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.lightGreen,
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(100, screenHeight * .011, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  'Add:',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                Row(
                                  children: <Widget>[
                                    TextButton(
                                      onPressed: decreaseVeggies,
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Text("$veggiesPlaceholder"),
                                    TextButton(
                                      onPressed: increaseVeggies,
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50), // <-- Radius
                                    ),
                                  ),
                                  onPressed: addVeggies,
                                  child: const Text(
                                    'ADD',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Current:",
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    //padding: EdgeInsets.only(left: 50, bottom: 0, right: 0, top: 5),
                                    child: Text(
                                      "$totalVeggies" + "/" + '$goalVeggies' + " cups",
                                      // style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(screenWidth * .06, screenHeight * .041, screenWidth * .045, 0),
                    child: CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10.0,
                      animation: false,
                      percent: veggiesPercent,
                      center: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: (){
                          setState((){
                            isVisibleVeggies = !isVisibleVeggies;
                            if(arrowVeggies == "-->"){
                              arrowVeggies = "<--";
                            }else{
                              arrowVeggies = "-->";
                            }
                          });
                        },
                        child: Text(
                          "Veggies\n" + '$displayVeggies' + "%" + "\n" + "$arrowVeggies",
                          textAlign: TextAlign.center,
                          // style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.green,
                    ),
                  ),
                ],
              ),

              Container(
                width: double.infinity,
                height: screenHeight * 0.055,
                margin: EdgeInsets.fromLTRB(screenWidth * .125, screenHeight * .03, screenWidth * .125, 0.0),

                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(250), // <-- Radius
                    ),
                  ),

                  onPressed: decreaseFood,
                  child: const Text(
                    'FEED',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(screenWidth * .15, screenHeight * .015, 0, 25),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: screenWidth * 0.45,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Today: ' + '$totalGoals' + '/4',
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Food available: ' + '$foodAvail',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}