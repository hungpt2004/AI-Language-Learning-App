import 'package:json_annotation/json_annotation.dart';

part 'user.entity.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;
  
  @JsonKey(name: 'fullname')
  final String fullname;
  
  @JsonKey(name: 'email')
  final String email;
  
  @JsonKey(name: 'password', includeToJson: false) // Không serialize password
  final String password;
  
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  
  @JsonKey(name: 'dob')
  final String? dob;
  
  @JsonKey(name: 'accessToken')
  final String? accessToken;
  
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  const User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.dob,
    this.accessToken,
    this.avatarUrl,
  });

  // Factory constructor để tạo User từ JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Method để convert User thành JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);

  // Copy with method để tạo User mới với một số field thay đổi
  User copyWith({
    String? id,
    String? fullname,
    String? email,
    String? password,
    String? phoneNumber,
    String? dob,
    String? accessToken,
    String? avatarUrl,
  }) {
    return User(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dob: dob ?? this.dob,
      accessToken: accessToken ?? this.accessToken,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, fullname: $fullname, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
