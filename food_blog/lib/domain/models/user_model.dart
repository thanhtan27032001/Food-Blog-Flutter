part of 'base_model.dart';

enum LoginMethod {
  google('google'),
  email('email');

  const LoginMethod(this.value);

  final String value;
}

@JsonSerializable()
class UserModel {
  String email;
  String nickname;
  String? city;
  String? intro;
  String? avatarUrl;
  String? loginMethod;

  @JsonKey(includeToJson: false)
  String? id;
  @JsonKey(includeToJson: false)
  int? numOfFollowing;
  @JsonKey(includeToJson: false)
  int? numOfFollowed;
  @JsonKey(includeToJson: false)
  int? numOfRecipe;

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
