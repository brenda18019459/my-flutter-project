import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/data/SubjectData.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';
import 'package:quiz/constant/strings.dart';
import 'package:quiz/widgets/number_textfeild.dart';
import 'package:quiz/widgets/text_feild.dart';

class AddSubjectScreen extends GetView<HomeController> {
  final TextEditingController moduleController = TextEditingController();
  final TextEditingController leaderController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController controllerTest = TextEditingController();
  final TextEditingController controllerNum = TextEditingController();
  bool isValidate = false;
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) {
      return DateFormat('dd-MMMM-yyyy').format(date);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add subject"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Module name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontGlory),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  controller: moduleController,
                  hint: "Enter module name",
                  obsecure: false,
                  validate: isValidate),
              SizedBox(
                height: 15,
              ),
              Text(
                "Module leader name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontGlory),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                controller: leaderController,
                hint: "Enter module leader",
                obsecure: false,
                validate: isValidate,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Enter your Aspired Grade",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontGlory),
              ),
              SizedBox(
                height: 10,
              ),
              NumberTextFieldWidget(
                  controller: gradeController,
                  hint: "Should be less then or equal to 100",
                  obsecure: false,
                  validate: isValidate),
              SizedBox(
                height: 12,
              ),
              Card(
                color: Colors.green.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextFieldWidget(
                                  controller: controllerTest,
                                  hint: "Enter test name",
                                  obsecure: false,
                                  validate: false)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Percentage weight",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: fontGlory),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 55,
                            child: TextField(
                              controller: controllerNum,
                              keyboardType: TextInputType.number,
                              cursorHeight: 15,
                              autofocus: false,
                              style: TextStyle(
                                height: 1.0,
                              ),
                              onChanged: (text) {},
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  fillColor: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0.0),
                          ),
                          onPressed: () {
                            controller.selectDate(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextWithoutShadow(
                                text: "Select Date",
                                fontsize: 26,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.event,
                                color: Colors.black,
                                size: 24,
                              ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWithoutShadow(
                            text: "Date Month Year",
                            fontsize: 20,
                            color: Colors.black,
                          ),
                          Obx(() {
                            return Flexible(
                              child: TextWithoutShadow(
                                text: formatDate(controller.selectedDate.value)
                                    .toString(),
                                fontsize: 16,
                                color: Colors.black87,
                              ),
                            );
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0.0),
                          ),
                          onPressed: () {
                            controller.selectTime(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextWithoutShadow(
                                text: "Select Time",
                                fontsize: 26,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.timer,
                                color: Colors.black,
                                size: 24,
                              ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWithoutShadow(
                            text: "Time ",
                            fontsize: 20,
                            color: Colors.black,
                          ),
                          Obx(() {
                            return Flexible(
                              child: TextWithoutShadow(
                                text: MaterialLocalizations.of(context)
                                    .formatTimeOfDay(
                                        controller.selectedTime.value)
                                    .toString(),
                                fontsize: 16,
                                color: Colors.black87,
                              ),
                            );
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      // Obx(() {
                      //   return Flexible(
                      //     child: TextWithoutShadow(
                      //       text: MaterialLocalizations.of(context).formatTimeOfDay(controller.selectedTime.value)
                      //           .toString(),
                      //       fontsize: 16,
                      //       color: Colors.black87,
                      //     ),
                      //   );
                      // }),
                      TextWithoutShadow(
                        text: "Alert",
                        fontsize: 20,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Obx(() {
                return Card(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return TextWithoutShadow(
                            text: controller.examTitle.value,
                            fontsize: 22,
                            color: Colors.black,
                          );
                        }),
                        Flexible(
                          child: CountDownText(
                            due: controller.selectedDate.value.add(Duration(
                                hours: controller.selectedTime.value.hour,
                                minutes: controller.selectedTime.value.minute)),
                            finishedText: "The time has been expired",
                            showLabel: true,
                            longDateName: false,
                            style: TextStyle(
                                color: Colors.black87,
                                fontFamily: fontGlory,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 54,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                      ),
                      onPressed: () {
                        if (moduleController.text == '' ||
                            leaderController.text == '' ||
                            gradeController.text == '' ||
                            controllerNum.text == '' ||
                            controllerTest.text == '') {
                          controller.isNotValidate();
                          Get.snackbar(
                              "Feild required", "Please fill all the TextField",
                              snackPosition: SnackPosition.BOTTOM);
                          print(DateTime.parse(
                              controller.selectedTime.value.toString()));
                        }
                        if (int.parse(gradeController.text) > 100 ||
                            int.parse(controllerNum.text) > 100) {
                          Get.snackbar("Wrong input",
                              "grade value should not greater then 100",
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          Duration fiftyDaysAgo =
                              today.difference(controller.selectedDate.value);
                          final daysLeft = fiftyDaysAgo.inSeconds / 86400;
                          DateTime time = controller.selectedDate.value.add(
                              Duration(
                                  hours: controller.selectedTime.value.hour,
                                  minutes:
                                      controller.selectedTime.value.minute));

                          final shouldSchedule = time.isAfter(DateTime.now());
                          DateTime? subtractedScheduledDateTime =
                              time.subtract(1440.minutes);
                          if (subtractedScheduledDateTime
                              .isBefore(DateTime.now())) {
                            subtractedScheduledDateTime =
                                DateTime.now().add(20.seconds);
                          }

                          SubjectData userData = new SubjectData(
                              uID: controller.list.length.toString(),
                              moduelName: moduleController.text,
                              leaderName: leaderController.text,
                              dayLeft: time.toString(),
                              aspiredGrade: gradeController.text,
                              testName: controllerTest.text,
                              persentageWight: controllerNum.text,
                              currentWeight: 0.0.toString(),
                              timeInMilliseconds: subtractedScheduledDateTime
                                  .millisecondsSinceEpoch);
                          controller.storeSubjectData(userData);
                          moduleController.text = '';
                          leaderController.text = '';
                          gradeController.text = '';
                          controllerTest.text = '';
                          controllerNum.text = '';
                          controller.retreiveSubject();
                        }
                      },
                      child: Text(
                        "Add subject".toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWithoutShadow extends StatelessWidget {
  String text;
  double fontsize;
  Color color;

  TextWithoutShadow(
      {required this.text, required this.fontsize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontFamily: fontGlory,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
