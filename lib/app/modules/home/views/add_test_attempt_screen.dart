import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/data/test_grade_model.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';
import 'package:quiz/app/modules/home/views/edit_screen.dart';
import 'package:quiz/constant/strings.dart';
import 'package:quiz/widgets/text_feild.dart';

class AddTestAttempt extends GetView<HomeController> {
  TextEditingController controllerTest = TextEditingController();
  TextEditingController controllerObt = TextEditingController();
  TextEditingController controllerGrade = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String argument = Get.arguments;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XFFF1EEEE),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        backgroundColor: Color(0XFFF1EEEE),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon:Icon(Icons.arrow_back,color: Colors.black,)),
      ),
     body: SingleChildScrollView(
       padding: const EdgeInsets.all(12.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Test Name", style: TextStyle(
               fontWeight: FontWeight.bold,
               fontFamily: fontGlory,
               color: Colors.green,
               fontSize: 26
           ),),
               SizedBox(height: 12,),
               Card(
                 color: Colors.white,
                 child: Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Column(
                     children: [
                       TextFieldWidget(controller: controllerTest, hint: "Enter your test name", obsecure: false, validate: false),
                       SizedBox(height: 12,),
                       Row(
                         children: [
                           NumberTextFeild(controllerNum: controllerObt,
                           hint: "40",
                           ),

                           Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Text("/", style: TextStyle(
                               color: Colors.black87,
                               fontSize: 36
                             ),),
                           ),
                           NumberTextFeild(controllerNum: controllerGrade,
                           hint: "100",
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
           Card(
             color: Colors.white,
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
                 children: [
                   Text("Notes", style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontFamily: fontGlory,
                       color: Colors.black87,
                       fontSize: 20
                   ),),
                   TextField(
                     style: TextStyle(
                       fontSize: 14
                     ),
                     maxLines: 4,
                     controller: noteController,
                     decoration: const InputDecoration(
                       border: InputBorder.none,
                       focusedBorder: InputBorder.none,
                       enabledBorder: InputBorder.none,
                       errorBorder: InputBorder.none,
                       disabledBorder: InputBorder.none,
                       hintText: "Enter your note..."
                     ),
                   ),
                 ],
               ),
             ),
           ),
           SizedBox(height: 10,),
           SizedBox(
             width: MediaQuery.of(context).size.width,
             child: ElevatedButton(
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(
                       Colors.green),
                   shape: MaterialStateProperty.all<
                       RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0),

                       )
                   ),

                 ),
                 onPressed: () async {
                   if (controllerTest.text == '' || controllerGrade.text == '' || controllerObt.text=='' || noteController.text=='' ) {
                     Get.snackbar("Feild required",
                         "Please fill all the TextField",
                         backgroundColor: Colors.red,
                         snackPosition: SnackPosition.BOTTOM);

                     // print('///////////////');
                     // controller.getSubTestData(argument);
                     // // print("grad length: "+controller.gradeList.length.toString());
                     // controller.getCurrentPercentage(controller.gradeList);
                     // // print("haz"+controller.currenPercentage.value.toString());
                     // // controller.updateCurrentWeigh(argument.toString(), controller.currenPercentage.toString());
                     // // controller.retreiveSubject();
                     // // print(controller.list[0].currentWeight);
                     // print("current :"+controller.currenPercentage.toString());
                     // String aspired = controller.list[int.parse(argument)].aspiredGrade.toString();
                     // print("before aspired"+aspired);
                     // // print("asspred before"+double.parse(controller.list[int.parse(int.parse(argument.toString()))].aspiredGrade));
                     // double currentPercentage = (controller.currenPercentage/double.parse(aspired));
                     // print("aspred :"+currentPercentage.toStringAsFixed(2));
                     // print('///////////////');

                   }
                   if( int.parse(controllerGrade.text) > 100 || int.parse(controllerObt.text) > 100){
                     Get.snackbar("Wrong input",
                         "grade value should not greater then 100",
                         snackPosition: SnackPosition.BOTTOM);
                   }
                   else {
                     TestGradeModel obj = new TestGradeModel(
                       gradeID: argument,
                       nameGrade: controllerTest.text,
                       obtGrade: controllerObt.text,
                       totalGarde: controllerGrade.text,
                       note: noteController.text,
                     );
                     controller.storeSubTestData(obj,argument);
                    await  controller.getSubTestData(argument.toString());
                     await controller.getCurrentPercentage(controller.gradeList);
                     String aspired = await controller.list[int.parse(argument)].aspiredGrade.toString();
                     print("before aspired"+aspired);
                     double currentPercentage = await (controller.currenPercentage/double.parse(aspired));
                     print("after aspired"+aspired);
                     print("after current"+currentPercentage.toString());
                      controller.updateCurrentWeigh(argument.toString(), currentPercentage.toStringAsFixed(2));
                       controller.retreiveSubject();
                     // controller.getSubTestData(argument.toString());
                           Get.back();
                   }

                 },
                 child: Text("Add grade", style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontFamily: fontGlory,
                   color: Colors.white,
                   fontSize: 22
                 ),
                 )
             ),
           ),
         ],
       ),
     ),
    );
  }
}

class NumberTextFeild extends StatelessWidget {
  const NumberTextFeild({
    Key? key,
    required this.controllerNum,
    required this.hint,
  }) : super(key: key);

  final TextEditingController controllerNum;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          hintText: hint,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5), fontSize: 16),
            fillColor: Colors.white70),
      ),
    );
  }
}
