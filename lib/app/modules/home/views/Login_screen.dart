import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';
import 'package:quiz/app/modules/home/views/forgot_password_screen.dart';
import 'package:quiz/app/modules/home/views/home_view.dart';
import 'package:quiz/app/modules/home/views/signup_screen.dart';

import '../../../../widgets/text_feild.dart';

class LoginScreen extends GetView<HomeController> {
  bool isValidate = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Group 1.png'),
                  fit: BoxFit.fill
                ),

              ),
            child: Padding(
              padding: const EdgeInsets.only(left: 65.0,top: 70),
              child: Text("Login" , style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(

              children: [
                TextFieldWidget(
                  controller: email,
                  hint: "Enter your email",
                  obsecure: false,
                  validate:isValidate,
                ),
                SizedBox(height: 16,),
                TextFieldWidget(
                  controller: pass,
                  hint: "Enter your password",
                  obsecure: true,
                  validate: isValidate,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => ForgotPasswordScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "Forgot password?", style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 54,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color(0XFF07635D)),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),

                            )
                        ),

                      ),
                      onPressed: () {
                        if (email.text == '' || pass.text == '') {
                          controller.isNotValidate();
                          Get.snackbar("Feild required",
                              "Please fill all the TextField",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                        else {
                          controller.isValidate();
                          controller.login(email.text, pass.text);
                        }
                      },
                      child: Text("Login".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),)),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SignUpScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Don't have an account? Signup.", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),

        ],
      ),
    );
  }
}
