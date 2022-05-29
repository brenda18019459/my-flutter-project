import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/widgets/text-widget.dart';
import '../../../../widgets/social_cion.dart';


class TimerScreem extends StatefulWidget {
  const TimerScreem({Key? key}) : super(key: key);

  @override
  State<TimerScreem> createState() => _TimerScreemState();
}

class _TimerScreemState extends State<TimerScreem> {

  Timer? countdownTimer;
  int _currentValue = 3;
  // List of items in our dropdown menu
  List<int> items = [6, 8, 10, 12, 14, 16, 20];
  Duration myDuration = Duration(minutes:6);
  @override
  void initState() {
    super.initState();
    this._currentValue=_currentValue;
    myDuration=new Duration(minutes: _currentValue);
  }
  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }
  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  List<int> myItems = List<int>.generate(100, (int index) => (index + 1));
    @override
  Widget build(BuildContext context) {
      String strDigits(int n) => n.toString().padLeft(2, '0');
      final days = strDigits(myDuration.inDays);
      // Step 7
      final hours = strDigits(myDuration.inHours.remainder(24));
      final minutes = strDigits(myDuration.inMinutes.remainder(60));
      final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor:Color(0XFFEC1CBE),
        leading: IconButton(
          icon:Icon(Icons.home, color: Colors.black,),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      backgroundColor: Color(0XFFEC1CBE),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Socialicon(
              iconPath: 'assets/images/tik-tok.png',
            ),
            Socialicon(
              iconPath: 'assets/images/instagram.png',
            ),
            Socialicon(
              iconPath: 'assets/images/twitter.png',
            )
          ],
        ),
      ),
        body: Column(
          children: [
            TextWidget(fontSize: 24, text: "Don't give up keep going!",
            color: Colors.black,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset('assets/images/Rectangle 31(1).png',width:170,height:170,fit:BoxFit.cover),
            ),
            Spacer(),
      DropdownButton<int>(
          hint: Text(""),
          value: _currentValue,
          style: TextStyle(
            fontSize: 18
          ),
          dropdownColor: Colors.purple,

          icon: Icon(Icons.arrow_drop_down,size: 24,color: Colors.white,),
          isExpanded: false,
          items: myItems.map((int value) {
            return new DropdownMenuItem<int>(
              value: value,
              child: new Text(value.toString()),
            );
          }).toList(),
          onChanged: (newVal) {
            setState(() {
              _currentValue = newVal!;
              myDuration=Duration(minutes: _currentValue);
            });
          }),

      TextWidget(text:'$hours:$minutes:$seconds', fontSize: 30, color: Colors.black,),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: startTimer, child: Text("START TIMER")),
                ElevatedButton(onPressed: (){
                  if (countdownTimer == null || countdownTimer!.isActive) {
                    stopTimer();
                  }
                }, child: Text("STOP TIMER")),
              ],
            )
          ],
        ),
    )
    );
  }
}
