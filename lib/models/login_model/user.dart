import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'avatar.dart';
import 'gender.dart';
import 'phone__number.dart';
import 'provider__name.dart';

class User {
  final String id;
  final String first_name;
  final String last_name;
  final String email;
  final Avatar avatar;
  final Phone_number phone_number;
  final Gender gender;
  final String type;
  final Provider_name provider_name;
  final String email_verified_at;
  final String created_at;
  final String updated_at;
  final List<dynamic> relationships;
  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.avatar,
    required this.phone_number,
    required this.gender,
    required this.type,
    required this.provider_name,
    required this.email_verified_at,
    required this.created_at,
    required this.updated_at,
    required this.relationships,
  });

  User copyWith({
    String? id,
    String? first_name,
    String? last_name,
    String? email,
    Avatar? avatar,
    Phone_number? phone_number,
    Gender? gender,
    String? type,
    Provider_name? provider_name,
    String? email_verified_at,
    String? created_at,
    String? updated_at,
    List<dynamic>? relationships,
  }) {
    return User(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      phone_number: phone_number ?? this.phone_number,
      gender: gender ?? this.gender,
      type: type ?? this.type,
      provider_name: provider_name ?? this.provider_name,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      relationships: relationships ?? this.relationships,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'avatar': avatar.toMap(),
      'phone_number': phone_number.toMap(),
      'gender': gender.toMap(),
      'type': type,
      'provider_name': provider_name.toMap(),
      'email_verified_at': email_verified_at,
      'created_at': created_at,
      'updated_at': updated_at,
      'relationships': relationships,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      email: map['email'] ?? '',
      avatar: Avatar.fromMap(map['avatar']),
      phone_number: Phone_number.fromMap(map['phone_number']),
      gender: Gender.fromMap(map['gender']),
      type: map['type'] ?? '',
      provider_name: Provider_name.fromMap(map['provider_name']),
      email_verified_at: map['email_verified_at'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      relationships: List<dynamic>.from(map['relationships']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, first_name: $first_name, last_name: $last_name, email: $email, avatar: $avatar, phone_number: $phone_number, gender: $gender, type: $type, provider_name: $provider_name, email_verified_at: $email_verified_at, created_at: $created_at, updated_at: $updated_at, relationships: $relationships)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.id == id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.email == email &&
      other.avatar == avatar &&
      other.phone_number == phone_number &&
      other.gender == gender &&
      other.type == type &&
      other.provider_name == provider_name &&
      other.email_verified_at == email_verified_at &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      listEquals(other.relationships, relationships);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      email.hashCode ^
      avatar.hashCode ^
      phone_number.hashCode ^
      gender.hashCode ^
      type.hashCode ^
      provider_name.hashCode ^
      email_verified_at.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      relationships.hashCode;
  }
}