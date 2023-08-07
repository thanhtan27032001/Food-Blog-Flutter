part of 'base_model.dart';

@JsonSerializable()
class UserModel {
  late String? id;
  late String email;
  late String nickname;
  late String? city;
  late String? intro;
  late String? avatarUrl;

  UserModel({
    this.id,
    required this.email,
    required this.nickname,
    this.city,
    this.intro,
    this.avatarUrl,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
