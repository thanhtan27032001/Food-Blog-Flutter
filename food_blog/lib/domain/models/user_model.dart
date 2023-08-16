part of 'base_model.dart';

enum LoginMethod {
  google('google'),
  email('email');

  const LoginMethod(this.value);

  final String value;
}

@JsonSerializable()
class UserModel {
  late String email;
  late String nickname;
  late String? city;
  late String? intro;
  late String? avatarUrl;
  late String? loginMethod;

  @JsonKey(includeToJson: false)
  late String? id;
  @JsonKey(includeToJson: false)
  late String? numOfFollowing;
  @JsonKey(includeToJson: false)
  late String? numOfFollowed;
  @JsonKey(includeToJson: false)
  late String? numOfRecipe;

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
