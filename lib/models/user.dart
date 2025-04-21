// lib/models/user.dart

/// Represents the nested `doctor` object (if any) returned by the API.
class Doctor {
  final int id;
  final String department;

  Doctor({
    required this.id,
    required this.department,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] as int,
      department: json['department'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'department': department,
      };
}

/// Represents a user returned by the API, including optional doctor details.
class User {
  final int id;
  final String email;
  final String name;
  final String phone;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Doctor? doctor;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.doctor,
  });

  /// Creates a new [User] from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      doctor: json['doctor'] != null
          ? Doctor.fromJson(json['doctor'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Serializes this [User] back to JSON.
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'phone': phone,
        'role': role,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        if (doctor != null) 'doctor': doctor!.toJson(),
      };
}
