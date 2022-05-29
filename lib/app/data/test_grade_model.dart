import 'package:cloud_firestore/cloud_firestore.dart';

class TestGradeModel {
  String gradeID,nameGrade,obtGrade, totalGarde,note;
  TestGradeModel({required this.gradeID,required this.nameGrade,required this.obtGrade,required this.totalGarde
  ,required this.note
  });
  Map<String, dynamic> toMap() {
    return {
      'gradeID': gradeID,
      'nameGrade': nameGrade,
      'obtGrade': obtGrade,
      'totalGarde': totalGarde,
      'note': note,


    };
  }
  TestGradeModel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      : gradeID = doc.data()!['gradeID'],
        nameGrade = doc.data()!['nameGrade'],
        obtGrade = doc.data()!['obtGrade'],
        totalGarde = doc.data()!['totalGarde'],
        note = doc.data()!['note'];



}