import 'dart:math';

import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/Utils.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';
import 'package:quiz/widgets/text-widget.dart';
import '../app/data/SubjectData.dart';
import '../constant/colors.dart';
import '../constant/strings.dart';

class HomeCardWidget extends StatefulWidget {
  SubjectData subjectList;
  VoidCallback onTap;
  Color color;
  HomeCardWidget(
      {required this.subjectList, required this.onTap, required this.color});

  @override
  State<HomeCardWidget> createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  HomeController controller = Get.find<HomeController>();
  @override
  void initState() {
    controller.retreiveSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        color: widget.color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: widget.subjectList.moduelName!,
                fontSize: 28,
                color: Colors.white,
              ),
              SizedBox(
                height: 12,
              ),
              TextWidget(
                text: widget.subjectList.leaderName!,
                fontSize: 22,
                color: Colors.white,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  TextWidget(
                    text: "Days Left: ",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  CountDownText(
                    due: DateTime.tryParse(
                        widget.subjectList.dayLeft.toString()),
                    finishedText: "The time has been expired",
                    showLabel: true,
                    longDateName: false,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontGlory,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextWidget(
                  text: (double.parse(
                              widget.subjectList.currentWeight.toString()) *
                          100)
                      .toStringAsFixed(1),
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
