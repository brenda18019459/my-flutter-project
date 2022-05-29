import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


import 'package:quiz/app/data/test_grade_model.dart';
import 'package:quiz/app/modules/home/views/add_subject_screen.dart';

import 'package:quiz/constant/strings.dart';


import '../../../../widgets/EditCardWidget.dart';

import '../../../../widgets/social_cion.dart';
import '../../../../widgets/test_card_widget.dart';

import '../../../../widgets/text-widget.dart';
import '../controllers/home_controller.dart';

class EditScreen extends GetView<HomeController> {
  // SubjectData argumentList = Get.arguments[0];
  var color = Get.arguments[0];
  String currentIndex = Get.arguments[1];
  List<TestGradeModel>? list = [];
  int testID = 0;
  var Texts = [
    'Test 1',
    'Test 2',
    'Test 3',
  ];
  @override
  Widget build(BuildContext context) {
    // print(currentIndex);
    // controller.getSubTestData(currentIndex);
    if (controller.gradeList.length == 0) {
      controller.getSubTestData(currentIndex);
    }
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.91),
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.91),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 13, top: 16),
              child: Text(
                "Edit",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontGlory),
              ),
            )
          ],
        ),
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
        body: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditCardWidget(
                  onTap: () {},
                  color: color,
                  index: int.parse(currentIndex),
                ),
                TestDynamicCard(
                  testTitle: controller.list[int.parse(currentIndex)].testName
                      .toString(),
                  percentage: controller
                      .list[int.parse(currentIndex)].persentageWight
                      .toString(),
                  testName: controller.list[int.parse(currentIndex)].testName
                      .toString(),
                  index: currentIndex,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextWithoutShadow(
                    fontsize: 22,
                    text: "Notes",
                    color: Colors.green,
                  ),
                ),
                controller.gradeList.length != 0
                    ? Column(
                        children: List.generate(
                            controller.gradeList.length,
                            (index) => NoteCardWidget(
                                  gradList: controller.gradeList[index],
                                )))
                    : Text(""),
              ],
            );
          }),
        ));
  }
}

class NoteCardWidget extends StatelessWidget {
  TestGradeModel gradList;

  NoteCardWidget({required this.gradList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: TextWidget(
                      fontSize: 22,
                      text: gradList.nameGrade,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  gradList.note,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// .
