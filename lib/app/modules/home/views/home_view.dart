import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/data/test_grade_model.dart';
import 'package:quiz/app/modules/home/views/add_subject_screen.dart';
import 'package:quiz/app/modules/home/views/edit_screen.dart';
import 'package:quiz/app/modules/home/views/timer_screen.dart';
import 'package:quiz/constant/strings.dart';
import '../../../../constant/colors.dart';
import '../../../../widgets/HomeCardWidget.dart';
import '../../../../widgets/social_cion.dart';
import '../controllers/home_controller.dart';
import '../controllers/notification_Service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    controller.isCurrentUserLogined();
    // NotificationService().initNotification();
    controller.retreiveSubject();
    super.initState();
  }

  final random = new Random();
  @override
  Widget build(BuildContext context) {
    var element = colorList[random.nextInt(colorList.length)];
    // print("fazian"+controller.list[0].currentWeight.toString());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                NotificationService()
                    .showNotification(1, "Title", "description");
                Get.to(() => TimerScreem());
              },
              iconSize: 28,
              icon: Icon(
                Icons.timer,
                color: Colors.black,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => AddSubjectScreen());
                },
                iconSize: 28,
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                )),
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
        body: controller.isCurrentUserLogined() == false
            ? Center(child: Text("Please add Module"))
            : Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                      child: Text(
                        "Courses",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: fontGlory,
                            fontSize: 36),
                      ),
                    ),
                    controller.list.isEmpty
                        ? Center(child: Text("Add Module"))
                        : Expanded(
                            child: ListView.builder(
                                itemCount: controller.list.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return HomeCardWidget(
                                    subjectList: controller.list[index],
                                    onTap: () async {
                                      print("UIDDD" +
                                          controller.list[index].uID
                                              .toString());

                                      controller.getSubTestData(controller
                                          .list[index].uID
                                          .toString());
                                      Get.to(() => EditScreen(), arguments: [
                                        element,
                                        controller.list[index].uID,
                                      ]);
                                    },
                                    color: element,
                                  );
                                }),
                          ),
                  ],
                );
              }));
  }
}
