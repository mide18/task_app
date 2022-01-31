import 'dart:convert';

import 'data.dart';

class LoginResponseModel {
  final Data data;
  LoginResponseModel({
    required this.data,
  });

  LoginResponseModel copyWith({
    Data? data,
  }) {
    return LoginResponseModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) => LoginResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponseModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginResponseModel &&
      other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}