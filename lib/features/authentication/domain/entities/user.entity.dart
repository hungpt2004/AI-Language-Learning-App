import 'package:json_annotation/json_annotation.dart';

part 'user.entity.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;
  String fullname;
  String email;
  String password;
  
  User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.password
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}
