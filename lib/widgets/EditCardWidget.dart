import 'dart:math';

import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/state_manager.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';
import 'package:quiz/widgets/text-widget.dart';
import '../app/data/SubjectData.dart';
import '../constant/colors.dart';
import '../constant/strings.dart';

class EditCardWidget extends GetView<HomeController> {
  // SubjectData subjectList;
  VoidCallback onTap;
  Color color;
  int index;
  EditCardWidget(
      {required this.onTap, required this.color, required this.index});

  @override
  Widget build(BuildContext context) {
    controller.retreiveSubject();
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  text: controller.list[index].moduelName!,
                  fontSize: 28,
                  color: Colors.white,
                ),
                SizedBox(height: 12,),
                TextWidget(
                  text: controller.list[index].leaderName!,
                  fontSize: 22,
                  color: Colors.white,
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "Days Left: ",
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    CountDownText(
                      due: DateTime.tryParse(controller.list[index].dayLeft.toString()),
                      finishedText: "The time has been expired",
                      showLabel: true,
                      longDateName: false,
                      style: TextStyle(color: Colors.white,
                          fontFamily: fontGlory,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                IntrinsicHeight(
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: Column(
                        children: [
                          TextWidget(
                            text: "Current",
                            fontSize: 22,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5,),
                          Obx(() {
                            return TextWidget(
                              text: controller.list[index].currentWeight == 0.0
                                  ? "__%"
                                  : "${(double.parse(controller.list[index]
        .aspiredGrade.toString())
    *
    double.parse(controller.list[index]
        .currentWeight.toString())).round()}%",
                              fontSize: 28,
                              color: Colors.white,
                            );
                          }),
                        ],
                      )),
                      VerticalDivider(
                        width: 20,
                        thickness: 2,
                        color: Colors.white,
                      ),

                      Flexible(child: Column(
                        children: [
                          TextWidget(
                            text: "Aspired",
                            fontSize: 22,
                            color: Colors.white,
                          ),


                          SizedBox(height: 5,),
                          TextWidget(
                            text: "${controller.list[index].aspiredGrade}%",
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}


// class EditCardWidget extends StatefulWidget {
//
//   @override
//   State<EditCardWidget> createState() => _EditCardWidgetState();
// }
//
// class _EditCardWidgetState extends State<EditCardWidget> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return InkWell(
//       onTap: widget.onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
//           color: widget.color,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 TextWidget(
//                   text: widget.subjectList.moduelName!,
//                   fontSize: 28,
//                 ),
//                 SizedBox(height: 12,),
//                 TextWidget(
//                   text: widget.subjectList.leaderName!,
//                   fontSize: 22,
//                 ),
//                 SizedBox(height: 12,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       text: "Days Left: ",
//                       fontSize: 18,
//                     ),
//                     CountDownText(
//                       due: DateTime.tryParse(widget.subjectList.dayLeft.toString()),
//                       finishedText: "The time has been expired",
//                       showLabel: true,
//                       longDateName: false,
//                       style: TextStyle(color: Colors.white,
//                           fontFamily: fontGlory,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12,),
//                 IntrinsicHeight(
//                   child: Flex(
//                     direction: Axis.horizontal,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Flexible(child: Column(
//                         children: [
//                           TextWidget(
//                             text: "Current",
//                             fontSize: 22,
//                           ),
//                           SizedBox(height: 5,),
//                           TextWidget(
//                             text: "__%",
//                             fontSize: 28,
//                           ),
//                         ],
//                       )),
//                       VerticalDivider(
//                         width: 20,
//                         thickness: 2,
//                         color: Colors.white,
//                       ),
//
//                       Flexible(child: Column(
//                         children: [
//                           TextWidget(
//                             text: "Aspired",
//                             fontSize: 22,
//                           ),
//
//
//                           SizedBox(height: 5,),
//                           TextWidget(
//                             text: "${widget.subjectList.aspiredGrade}%",
//                             fontSize: 26,
//                           ),
//                         ],
//                       )),
//                     ],
//                   ),
//                 ),
//               ],
//
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
