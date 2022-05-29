import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';
import 'package:quiz/app/modules/home/views/Login_screen.dart';
import 'package:quiz/app/modules/home/views/home_view.dart';
import 'package:quiz/app/modules/home/views/signup_screen.dart';

class IsSignIn extends GetView<HomeController> {
  const IsSignIn({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // controller.isCurrentUserLogined();
    return Obx(() {
      return controller.user != null ? HomeView() : LoginScreen();
    });


  }
}
