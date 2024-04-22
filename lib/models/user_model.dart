import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name, id, email;
  final int age;

  UserModel({
    required this.age,
    required this.name,
    required this.email,
  }) : id = FirebaseAuth.instance.currentUser!.uid;

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserModel(
      age: json['age'],
      name: json['name'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson(UserModel userModel) {
    return {
      'id': userModel.id,
      'name': userModel.name,
      'email': userModel.email,
      'age': userModel.age,
    };
  }
}
