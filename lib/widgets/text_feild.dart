import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';

class TextFieldWidget extends StatefulWidget {
  TextEditingController controller;
  String hint;
  bool obsecure;
  bool validate;





  TextFieldWidget({required this.controller, required this.hint,required this.obsecure,required this.validate});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {


  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return
      Obx(() {
        return TextField(
          controller: widget.controller,
          obscureText: widget.obsecure,
          keyboardType: TextInputType.text,
          style: TextStyle(
              height: 0.8,

          ),
          onChanged: (text) {
            controller.examTitle.value=text;
            if ( widget.controller.text == '') {
              controller.isNotValidate();
              print("valid" + controller.isValid.value.toString());
            }
            else {
              controller.isValidate();
            }
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              errorText: controller.isValid.value
                  ? null
                  : 'This Field required',
              hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
              hintText: widget.hint,
              fillColor: Colors.white70),

        );
      });
  }
}
