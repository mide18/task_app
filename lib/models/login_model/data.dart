import 'dart:convert';

import 'user.dart';

class Data {
  final String status;
  final String message;
  final User user;
  final String authToken;
  Data({
    required this.status,
    required this.message,
    required this.user,
    required this.authToken,
  });

  Data copyWith({
    String? status,
    String? message,
    User? user,
    String? authToken,
  }) {
    return Data(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
      authToken: authToken ?? this.authToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'user': user.toMap(),
      'authToken': authToken,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      user: User.fromMap(map['user']),
      authToken: map['authToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(status: $status, message: $message, user: $user, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.status == status &&
      other.message == message &&
      other.user == user &&
      other.authToken == authToken;
  }

  @override
  int get hashCode {
    return status.hashCode ^
      message.hashCode ^
      user.hashCode ^
      authToken.hashCode;
  }
}