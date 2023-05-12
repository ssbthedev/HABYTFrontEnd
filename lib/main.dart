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
import 'package:flutter/material.dart';
import 'assets/lotus_icons_icons.dart';
import 'homePage.dart';
import 'calendar.dart';
import 'settings.dart';

void main() => runApp(Page1());

class Page1 extends StatefulWidget
{
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1>{
  int selectedPage = 1;
  final _pageOptions = [
    SettingsPage(),
    HomePage(),
    CalendarPage(),
  ];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Scaffold(
          body: _pageOptions[selectedPage],
          floatingActionButton: SizedBox(
            height: 40,
            width: 40,
            child: FittedBox(
              child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: (){
                    setState(() {
                      selectedPage = 1;
                    });
                  },
                  child: const Icon(LotusIcons.logo,
                    size: 40,
                    color: Colors.black,
                  )
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
            currentIndex: selectedPage,
            onTap: (index){
              setState(() {
                selectedPage = index;
              });
            },
          ),
        )
    );
  }
}


