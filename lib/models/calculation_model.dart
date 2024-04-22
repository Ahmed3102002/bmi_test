import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

final String uuid = const Uuid().v4();

class CalculationModel {
  final String id, userId;
  final Timestamp date;
  final int age;
  final double height, weight, bmi;

  CalculationModel({
    required this.age,
    required this.height,
    required this.weight,
    required this.bmi,
  })  : id = uuid,
        userId = FirebaseAuth.instance.currentUser!.uid,
        date = Timestamp.now();

  factory CalculationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CalculationModel(
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      bmi: json['bmi'],
    );
  }
  Map<String, dynamic> toJson(CalculationModel calculationModel) {
    return {
      'id': calculationModel.id,
      'userId': calculationModel.userId,
      'height': calculationModel.height,
      'weight': calculationModel.weight,
      'age': calculationModel.age,
      'bmi': calculationModel.bmi,
      'date': calculationModel.date,
    };
  }
}
