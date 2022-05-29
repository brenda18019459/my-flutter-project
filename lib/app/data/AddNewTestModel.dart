import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/app/data/test_grade_model.dart';

class NewTest{
  String testID,testTitle, testName,percentage;
  NewTest({required this.testID,required this.testTitle,required this.testName, required this.percentage});
  Map<String, dynamic> toMap() {
    return {
      'testID': testID,
      'testTitle': testTitle,
      'testName': testName,
      'percentage': percentage,
    };
  }
  NewTest.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      : testID = doc.data()!['testID'],
        testTitle = doc.data()!['testTitle'],
        testName = doc.data()!['testName'],
        percentage = doc.data()!['percentage'];
}