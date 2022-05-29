import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/Utils.dart';
import 'package:quiz/app/data/SubjectData.dart';
import 'package:quiz/app/data/test_grade_model.dart';
import 'package:quiz/app/modules/home/controllers/user_is_signin.dart';
import 'package:quiz/app/modules/home/views/Login_screen.dart';
import 'package:quiz/app/modules/home/views/home_view.dart';

import '../../../data/AddNewTestModel.dart';

class HomeController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  User? currentUser = FirebaseAuth.instance.currentUser;
  double newAverage = 0.0;
  double percentage = 0.0;
  int obtainedMarks = 0;
  int totalMarks = 0;

  // List<SubjectData> list =[];
  RxDouble currenPercentage = 0.0.obs;

  RxList<SubjectData> list = <SubjectData>[].obs;
  RxList<NewTest> testList = <NewTest>[].obs;
  RxList<NewTest> newList = <NewTest>[].obs;
  RxList<TestGradeModel> gradeList = <TestGradeModel>[].obs;
  RxList<SubjectData> filterList = <SubjectData>[].obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  RxString examTitle = "Exam Title".obs;

  /// set filter List
  Future<void> setFilterList(String id) async {
    print("start fiter");
    filterList.value = await list.where((id) => id.uID == '${id}').toList();
    print("end fiter");
  }

  /// Calculate Current percentage
  double getPercentage(int obt, int total) {
    return (obt / total) * 100;
  }

  Future<void> getCurrentPercentage(List<TestGradeModel> list) async {
    print("///////////////// percentage /////");
    obtainedMarks = 0;
    totalMarks = 0;
    currenPercentage.value = 0.0;
    for (int i = 0; i < list.length; i++) {
      obtainedMarks = obtainedMarks + int.parse(list[i].obtGrade.toString());
      print("Obt ${i} : " + list[i].obtGrade.toString());
      totalMarks = totalMarks + int.parse(list[i].totalGarde.toString());
      print("total ${i} : " + list[i].totalGarde.toString());
    }
    print("summ of obt: " + obtainedMarks.toString());
    print("summ of total: " + totalMarks.toString());
    newAverage = getPercentage(obtainedMarks, totalMarks);
    print("newP: " + newAverage.toString());
    currenPercentage.value = newAverage.roundToDouble();
    print("CueenrP: " + currenPercentage.toString());
    print("end percentage: ");
  }

  /// Update CurrentFeild in Firebase
  void updateCurrentWeigh(String id, String weight) {
    print("update call");
    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .collection("subjects")
        .where("uID", isEqualTo: id)
        .get()
        .then((value) {
      value.docs.forEach((documentSnapshot) {
        print(documentSnapshot);
        documentSnapshot.reference.update({"currentWeight": weight});
      });
      print("update end");
    }).catchError((onError) => Get.snackbar("Error", onError));
  }

  bool isCurrentUserLogined() {
    if (currentUser!.uid.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  RxBool isValid = RxBool(false);

  String? get user => _firebaseUser.value?.email;

  Future<void> storeSubjectData(SubjectData userObj) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .collection("subjects")
        .doc()
        .set(userObj.toMap())
        .then(
            (value) => Get.snackbar("Successful", "your data has been stored"))
        .catchError((onError) => Get.snackbar("Eroor", onError));
  }

  Future<List<SubjectData>?> retreiveSubject() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(currentUser!.uid)
        .collection("subjects")
        .orderBy("uID", descending: false)
        .get();
    list.value = snapshot.docs.map((docSnapshot) {
      final subject = SubjectData.fromMap(docSnapshot);
      NotificationUtils.sendNotification(subjectList: subject);
      return subject;
    }).toList();

    // print("Name :" + list[0].moduelName.toString());
    return list;
  }

  /// Store Text Data
  Future<void> storeTestData(NewTest newTest, String tID) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .collection("tests")
        .doc(tID)
        .set(newTest.toMap())
        .then((value) => Get.snackbar("Successful", "your data has been stored",
            backgroundColor: Colors.green))
        .catchError((onError) => Get.snackbar("Eroor", onError));
  }

  /// Get Text Data
//   Future<List<NewTest>?> getTestData(String id) async {
//     QuerySnapshot<Map<String, dynamic>> snapshot =
//     await FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).collection("tests").get();
//     testList.value = snapshot.docs
//         .map((docSnapshot) => NewTest.fromMap(docSnapshot))
//         .toList();
//      print("test list length :"+testList[0].testID.toString());
//     return testList;
//   }

  /// Store Sub Test Data
  void storeSubTestData(TestGradeModel newTest, String testID) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .collection("tests")
        .doc(testID)
        .collection("sebtest")
        .doc()
        .set(newTest.toMap())
        .then((value) => Get.snackbar("Successful", "your data has been stored",
            backgroundColor: Colors.green))
        .catchError((onError) => Get.snackbar("Eroor", onError));
    print("data store end");
  }

  /// Get SUB test Data
  Future<List<TestGradeModel>?> getSubTestData(String id) async {
    print("get sub test function call");
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(currentUser!.uid)
        .collection("tests")
        .doc(id)
        .collection('sebtest')
        .get();
    gradeList.value = snapshot.docs
        .map((docSnapshot) => TestGradeModel.fromMap(docSnapshot))
        .toList();
    print("get lenth :" + gradeList.length.toString());
    return gradeList;
  }

  void isValidate() {
    isValid.value = true;
  }

  void isNotValidate() {
    isValid.value = false;
  }

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    retreiveSubject();
    this.currenPercentage.value = currenPercentage.value;
    // getTestData();
    super.onInit();
  }

  Future<void> createUser(
      String lastname, String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then(
      (value) {
        Get.offAll(LoginScreen());
      },
    ).catchError((onError) {
      Get.snackbar("Error while creating account", "${onError}",
          backgroundColor: Colors.red);
      print(onError);
    });
  }

  Future storeData(String name, String email, String pass) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({"name": name, "email": email, "password": pass}).catchError(
            (onError) => print(onError));
  }

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.to(() => HomeView()))
        .catchError((onError) => Get.snackbar("Error while Signin account",
            "${"seems you don't have account please register account!"}",
            backgroundColor: Colors.red));
  }

  void resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.to(() => LoginScreen());
      Get.snackbar("Check your email", "Please reset your email!");
    }).catchError(
        (onError) => Get.snackbar("Error while Signin account", "${onError}"));
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
      print("date" + selectedDate.value.toString());
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      selectedTime.value = timeOfDay;
    }
  }

  @override
  void onClose() {}
}
