// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;

  User({
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };

  User copyWith({
    String email,
    String password,
  }) =>
      User(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
