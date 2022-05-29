import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';

import '../../../../widgets/text_feild.dart';

class SignUpScreen extends GetView<HomeController> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isValidate=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar : true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                child: Text("Create \nAccount" , style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: name,
                    hint: "Enter your name",
                    obsecure: false,
                    validate:isValidate,
                  ),
                  SizedBox(height: 16,),
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
                    validate:isValidate,
                  ),
                  SizedBox(height: 16,),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
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
                          if(name.text=='' || email.text=='' || pass.text==''){
                            controller.isNotValidate();
                            Get.snackbar("Feild required", "Please fill all the TextField",snackPosition: SnackPosition.BOTTOM );
                          }
                          else{
                            controller.isValidate();
                            controller.createUser(name.text, email.text, pass.text);
                          }

                        },
                        child: Text("Sign Up".toUpperCase(), style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),)),
                  ),
                  // ElevatedButton(
                  //     onPressed: (){
                  //   if(name.text=='' || email.text=='' || pass.text==''){
                  //       controller.isNotValidate();
                  //     Get.snackbar("Feild required", "Please fill all the TextField",snackPosition: SnackPosition.BOTTOM );
                  //   }
                  //   else{
                  //     controller.isValidate();
                  //     controller.createUser(name.text, email.text, pass.text);
                  //   }
                  //
                  // }, child: Text("Sign up")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
