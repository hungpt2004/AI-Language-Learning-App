// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['_id'] as String,
  fullname: json['fullname'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  phoneNumber: json['phoneNumber'] as String,
  dob: json['dob'] as String?,
  accessToken: json['accessToken'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  '_id': instance.id,
  'fullname': instance.fullname,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'dob': instance.dob,
  'accessToken': instance.accessToken,
  'avatarUrl': instance.avatarUrl,
};
