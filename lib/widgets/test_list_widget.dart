import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/data/test_grade_model.dart';

import '../app/modules/home/controllers/home_controller.dart';
import 'package:quiz/app/modules/home/views/edit_screen.dart';
import '../constant/strings.dart';

class TestListWidget extends StatefulWidget {
  String testName;
  String obtMark, totalMarks;
  int index;
  TestListWidget(
      {required this.testName,
      required this.obtMark,
      required this.totalMarks,
      required this.index});

  @override
  State<TestListWidget> createState() => _TestListWidgetState();
}

class _TestListWidgetState extends State<TestListWidget> {
  int obtainedMarks = 0;
  int totalMarks = 0;
  double percentage = 0.0;
  double newPercentage = 0.0;

  HomeController controller = Get.put(HomeController());
  List<TestGradeModel> list = [];
  // late List<TestGradeModel>? list;
  @override
  void initState() {
    // TODO: implement initState
    this.percentage = percentage;
    this.newPercentage = newPercentage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    obtainedMarks = (int.parse(controller.gradeList[widget.index].obtGrade));
    totalMarks = (int.parse(controller.gradeList[widget.index].totalGarde));
    double getPercentage(int obt, int total) {
      return (obt / total) * 100;
    }

    setState(() {
      percentage = getPercentage(obtainedMarks, totalMarks);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.testName.isEmpty ? "sample" : widget.testName,
                  style: TextStyle(
                      color: Colors.black, fontSize: 16, fontFamily: fontGlory),
                ),
                Text(
                  "${percentage.roundToDouble() == '' ? "New Avergae" : percentage.toStringAsFixed(1)} %",
                  style: TextStyle(
                      color: Colors.black, fontSize: 16, fontFamily: fontGlory),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 8,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
