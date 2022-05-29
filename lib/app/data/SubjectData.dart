import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/app/Utils.dart';

class SubjectData {
  String? uID,
      moduelName,
      leaderName,
      aspiredGrade,
      dayLeft,
      testName,
      persentageWight,
      currentWeight;
  int timeInMilliseconds;
  SubjectData(
      {required this.uID,
      required this.moduelName,
      required this.leaderName,
      required this.aspiredGrade,
      required this.dayLeft,
      required this.testName,
      required this.persentageWight,
      required this.currentWeight,
      required this.timeInMilliseconds});

  Map<String, dynamic> toMap() {
    return {
      'uID': uID,
      'moduelName': moduelName,
      'leaderName': leaderName,
      'aspiredGrade': aspiredGrade,
      'dayLeft': dayLeft,
      'testName': testName,
      'persentageWight': persentageWight,
      'currentWeight': currentWeight,
      'timeInMilliseconds': timeInMilliseconds,
    };
  }

  SubjectData.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      : uID = doc.data()!['uID'],
        moduelName = doc.data()!['moduelName'],
        leaderName = doc.data()!['leaderName'],
        aspiredGrade = doc.data()!['aspiredGrade'],
        dayLeft = doc.data()!['dayLeft'],
        testName = doc.data()!['testName'],
        persentageWight = doc.data()!['persentageWight'],
        currentWeight = doc.data()!['currentWeight'],
        timeInMilliseconds = doc.data()!['timeInMilliseconds'];
}
