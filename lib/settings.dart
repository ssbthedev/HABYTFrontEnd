import 'package:flutter/material.dart';
import 'assets/lotus_icons_icons.dart';

class SettingsPage extends StatefulWidget{
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{

    bool StepState = true;
    bool SleepState = true;
    bool WaterState = true;
    bool VegetablesState = true;
    bool ExcrciseState = true;

    @override
    Widget build(BuildContext context){
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;

      return Scaffold(

        body: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Column(

                      children: <Widget>[

                        Container(
                          alignment: const Alignment(-.7,0),
                          margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .04, screenWidth * .045, screenHeight * .005),
                          child: const Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'QuickSand',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .015, screenWidth * .015, screenHeight * .005),
                          child: const Text(
                            'Create healthy habits one day at a time.',
                            style: TextStyle(fontSize: 16, fontFamily: 'QuickSand', color: Color(0xff4b4b4b) ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 4,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(screenWidth * .045, 0, screenWidth * .015, screenHeight * .005),
                          child: const Text(
                            'Choose your goals below.',
                            style: TextStyle(fontSize: 16, fontFamily: 'QuickSand', color: Color(0xff4b4b4b) ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),

                  ),

                  Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(0, screenHeight * .06, 0, screenHeight * .005),
                          alignment: const Alignment(0,0),
                          child: const Image(
                            image: AssetImage('assets/KoiFish.png'),
                            width: 235,
                            height: 235,
                          )
                      ),
                      Text(
                          'UserName12',
                          style: TextStyle(fontSize: 20, fontFamily: 'QuickSand')
                      ),

                    ],
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .045, screenWidth * .015, 0),
                        child:const Text(
                          'Steps',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', fontWeight: FontWeight.bold,),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, 0, screenWidth * .015, screenHeight * .005),
                        child:const Text(
                          '10,000 steps a day',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', color: Color(0xff4b4b4b) ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(screenWidth * .35, screenWidth * .085, screenWidth * .015, 0),
                          child: Switch(
                              value: StepState,
                              onChanged: (bool newV) {
                                setState(() {
                                  StepState = newV;
                                });

                              }
                          ),
                        ),
                      ]

                  )
                ],
              ),

              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .045, screenWidth * .015, 0),
                        child:const Text(
                          'Sleep',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', fontWeight: FontWeight.bold,),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, 0, screenWidth * .015, screenHeight * .005),
                        child:const Text(
                          '8 hours of sleep each day',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', color: Color(0xff4b4b4b) ),
                        ),
                      ),
                    ],
                  ),
                  Column(

                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(screenWidth * .22, screenWidth * .085, screenWidth * .015, 0),
                          child: Switch(
                              value: SleepState,
                              onChanged: (bool newV) {
                                setState(() {
                                  SleepState = newV;
                                });

                              }
                          ),
                        ),
                      ]

                  )
                ],
              ),

              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .045, screenWidth * .015, 0),
                        child:const Text(
                          'Water',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', fontWeight: FontWeight.bold,),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, 0, screenWidth * .015, screenHeight * .005),
                        child:const Text(
                          '8 glasses of water each day',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', color: Color(0xff4b4b4b) ),
                        ),
                      ),
                    ],
                  ),
                  Column(

                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(screenWidth * .18, screenWidth * .085, screenWidth * .015, 0),
                          child: Switch(
                              value: WaterState,
                              onChanged: (bool newV) {
                                setState(() {
                                  WaterState = newV;
                                });

                              }
                          ),
                        ),
                      ]

                  )
                ],
              ),

              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .045, screenWidth * .015, 0),
                        child:const Text(
                          'Vegetables',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', fontWeight: FontWeight.bold,),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, 0, screenWidth * .015, screenHeight * .005),
                        child:const Text(
                          '4 servings of vegetables each day',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', color: Color(0xff4b4b4b) ),
                        ),
                      ),
                    ],
                  ),
                  Column(

                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(screenWidth * .065, screenWidth * .085, screenWidth * .015, 0),
                          child: Switch(
                              value: VegetablesState,
                              onChanged: (bool newV) {
                                setState(() {
                                  VegetablesState = newV;
                                });

                              }
                          ),
                        ),
                      ]

                  )
                ],
              ),

              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, screenHeight * .045, screenWidth * .015, 0),
                        child:const Text(
                          'Exercise',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', fontWeight: FontWeight.bold,),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(screenWidth * .045, 0, screenWidth * .014, screenHeight * .065),
                        child:const Text(
                          'Half hour of exercise each day',
                          style: TextStyle(fontSize: 18, fontFamily: 'QuickSand', color: Color(0xff4b4b4b) ),
                        ),
                      ),
                    ],
                  ),
                  Column(

                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(screenWidth * .14, screenWidth * .085, screenWidth * .015, screenHeight * .065),
                          child: Switch(
                              value: ExcrciseState,
                              onChanged: (bool newV) {
                                setState(() {
                                  ExcrciseState = newV;
                                });

                              }
                          ),
                        ),
                      ]

                  )
                ],
              ),
            ],
          ),
        ),


        floatingActionButton: SizedBox(
          height: 75,
          width: 75,
          child: FittedBox(
            child: FloatingActionButton(
                child: Icon(LotusIcons.logo,
                  size: 40,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                onPressed: (){
                  //Lotus Flower Action
                }
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xffecf8f5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/lotusFlowerIcon.png'),
                size: 5.0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: '',
            ),
          ],
          selectedItemColor: const Color(0xff4d8d78),
        ),
      );
    }
}