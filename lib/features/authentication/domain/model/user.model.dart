import 'package:carenet_attendance_app/features/authentication/data/entities/user.entity.dart';

/// Domain model cho User
/// Chuyển đổi từ Entity sang Model nếu cần thêm business logic
class UserModel {
  final String id;
  final String fullname;
  final String email;
  final String phoneNumber;
  final String? dob;
  final String? accessToken;
  final String? avatarUrl;

  const UserModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    this.dob,
    this.accessToken,
    this.avatarUrl,
  });

  // Tạo UserModel từ User Entity
  factory UserModel.fromEntity(User entity) {
    return UserModel(
      id: entity.id,
      fullname: entity.fullname,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      dob: entity.dob,
      accessToken: entity.accessToken,
      avatarUrl: entity.avatarUrl,
    );
  }

  // Chuyển UserModel thành User Entity
  User toEntity() {
    return User(
      id: id,
      fullname: fullname,
      email: email,
      password: '',
      phoneNumber: phoneNumber,
      dob: dob,
      accessToken: accessToken,
      avatarUrl: avatarUrl,
    );
  }

  // Business logic methods
  String get displayName => fullname.isEmpty ? email : fullname;
  
  bool get hasAvatar => avatarUrl != null && avatarUrl!.isNotEmpty;
  
  bool get hasValidPhone => phoneNumber.isNotEmpty && phoneNumber.length >= 10;

  @override
  String toString() {
    return 'UserModel(id: $id, fullname: $fullname, email: $email)';
  }
}