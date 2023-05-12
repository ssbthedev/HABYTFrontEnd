import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:getwidget/getwidget.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() => runApp(const CalendarPage());

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HABYT'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 300,
                child: Calendar(),
              ),
              Text('Time'),
              SizedBox(
                height: 50,
                child: TimePicker(),
              ),
              Text('How are you feeling today?'),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                height: 50,
                width: 300,
                child: MoodSlider(),
                ),
              ),
              Text('Are you improving?,'),
              YesNoToggle(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text('Notes'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: 200,
                  child: NotesField(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.blue,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.white)
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                formatButtonTextStyle: const TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events,e) {
                print(date.toUtc());
              },

              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            )
          ],
        ),
      ),
    );
  }
}

//Time Picker
class TimePicker extends StatelessWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime datePrint = DateTime.now();
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            GFButton(
              onPressed: () {
                DatePicker.showTime12hPicker(context, showTitleActions: true,
                    onChanged: (date) {
                      print('change $date in time zone ${date.timeZoneOffset.inHours}');
                    }, onConfirm: (date) {
                      print('confirm $date');
                      datePrint = date;
                    }, currentTime: DateTime.now());
              },
              text: "${datePrint.hour}:${datePrint.minute}",
              shape: GFButtonShape.pills,
            ),
          ],
        ),
      ),
    );
  }
}

//Slider
class MoodSlider extends StatefulWidget {
  const MoodSlider({Key? key}) : super(key: key);

  @override
  State<MoodSlider> createState() => _MoodSliderState();
}

class _MoodSliderState extends State<MoodSlider> {
  double _currentSliderValue = 5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 10,
            divisions: 100,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

//Toggle
class YesNoToggle extends StatelessWidget{
  const YesNoToggle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      customWidths: const [90.0, 90.0],
      cornerRadius: 20.0,
      activeBgColors: const [[Colors.green], [Colors.redAccent]],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: const ['YES', 'NO'],
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }
}

//Notes Field
class NotesField extends StatelessWidget{
  const NotesField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Notes',
      ),
    );
  }
}