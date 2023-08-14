part of 'base_model.dart';

enum LoginMethod {
  draft('google'),
  public('email');

  const LoginMethod(this.value);

  final String value;
}

@JsonSerializable()
class UserModel {
  late String? id;
  late String email;
  late String nickname;
  late String? city;
  late String? intro;
  late String? avatarUrl;
  late String? loginMethod;

  UserModel({
    this.id,
    required this.email,
    required this.nickname,
    this.city,
    this.intro,
    this.avatarUrl,
    this.loginMethod,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
