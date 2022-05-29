import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz/app/data/test_grade_model.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';
import 'package:quiz/app/modules/home/views/add_test_attempt_screen.dart';
import 'package:quiz/widgets/test_list_widget.dart';

import '../app/modules/home/views/edit_screen.dart';
import '../constant/strings.dart';

class TestDynamicCard extends StatefulWidget {
  String testTitle, testName;
  String percentage;
  String index;

  TestDynamicCard(
      {required this.testTitle, required this.testName, required this.percentage, required this.index});

  @override
  State<TestDynamicCard> createState() => _TestDynamicCardState();
}

class _TestDynamicCardState extends State<TestDynamicCard> {
  HomeController controller = Get.put(HomeController());
  double newAverage = 0.0;
  double percentage = 0.0;
  int obtainedMarks = 0;
  int totalMarks = 0;
  List<TestGradeModel>? list = [];

  @override
  void initState() {
    // TODO: implement initState
    this.obtainedMarks = obtainedMarks;
    this.totalMarks = totalMarks;
    this.percentage = percentage;
    this.list = list;
    this.newAverage = newAverage;
    super.initState();
  }

  double? CalculateCurrentWeight(String newPercentage, String aspiredWeight) {
    return double.parse(newPercentage) / double.parse(aspiredWeight);
  }

  @override
  Widget build(BuildContext context) {
    controller.getSubTestData(widget.index);
    // print(controller.gradeList.length);
    // controller.getCurrentPercentage(controller.gradeList);
    // controller.setFilterList(widget.index);
    return
      Column(
        children: [
          ListTile(
            leading: Text(widget.testName, style: TextStyle(
              color: Colors.green,
              fontSize: 22,
              fontFamily: fontGlory,
              fontWeight: FontWeight.bold,
            ),),
            trailing: IconButton(
              onPressed: () {
                Get.to(() => AddTestAttempt(), arguments: widget.index);
                print("clicked" + widget.index);
              },
              icon: Icon(Icons.add, color: Colors.black,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Obx(() {
                return Card(
                  color: Colors.green.shade100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Text(controller.list.isEmpty
                              ? "0__%"
                              : "${
                             (double.parse(controller.list[int.parse(widget.index)]
                                 .aspiredGrade.toString())
                              *
                                 double.parse(controller.list[int.parse(widget.index)]
                                     .currentWeight.toString())).round()}%",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: fontGlory
                            ),
                          );
                        }),

                        SizedBox(height: 10,),
                        controller.gradeList.length != 0 ?
                        Column(
                          children:
                          List.generate(
                            controller.gradeList.length, (index) =>
                              TestListWidget(
                                testName: controller.gradeList[index]
                                    .nameGrade,
                                totalMarks: controller.gradeList[index]
                                    .totalGarde,
                                obtMark: controller.gradeList[index].obtGrade,
                                index: index,
                              ),

                          ),
                        )
                            : Text("Add new test"),

                        Text("${widget.percentage}% of Grade",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: fontGlory
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      );
  }
}



