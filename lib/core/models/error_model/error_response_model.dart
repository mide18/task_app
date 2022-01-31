import 'dart:convert';

import 'data.dart';

class ErrorResponseModel {
  final Data data;
  ErrorResponseModel({
    required this.data,
  });

  ErrorResponseModel copyWith({
    Data? data,
  }) {
    return ErrorResponseModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
    };
  }

  factory ErrorResponseModel.fromMap(Map<String, dynamic> map) {
    return ErrorResponseModel(
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorResponseModel.fromJson(String source) => ErrorResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'ErrorResponseModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ErrorResponseModel &&
      other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}