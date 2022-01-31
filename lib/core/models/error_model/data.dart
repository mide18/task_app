import 'dart:convert';

class Data {
  final String status;
  final String error;
  Data({
    required this.status,
    required this.error,
  });

  Data copyWith({
    String? status,
    String? error,
  }) {
    return Data(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'error': error,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      status: map['status'] ?? '',
      error: map['error'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(status: $status, error: $error)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.status == status &&
      other.error == error;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode;
}