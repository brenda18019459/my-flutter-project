import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';
import 'package:quiz/app/modules/home/views/home_view.dart';

import '../../../../widgets/text_feild.dart';

class ForgotPasswordScreen extends GetView<HomeController> {
  bool isValidate = false;
  TextEditingController email = TextEditingController();
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
              padding: const EdgeInsets.only(left: 40.0,top: 70),
              child: Text("Forgot\nPassword" , style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          SizedBox(height: 20,),
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
                        if (email.text == '') {
                          controller.isNotValidate();
                          Get.snackbar("Feild required",
                              "Please fill all the TextField",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                        else {
                          controller.isValidate();
                          controller.resetPassword(email.text);
                        }
                      },
                      child: Text("Send Request".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),)),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
