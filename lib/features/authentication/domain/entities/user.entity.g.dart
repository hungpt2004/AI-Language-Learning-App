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
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  '_id': instance.id,
  'fullname': instance.fullname,
  'email': instance.email,
  'password': instance.password,
};
