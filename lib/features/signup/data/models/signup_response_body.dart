import 'package:json_annotation/json_annotation.dart';

part 'signup_response_body.g.dart';

@JsonSerializable()
class SignupResponseBody {
  final String message;
  @JsonKey(name: "data")
  UserData? userData;
  final bool status;
  final int code;

  SignupResponseBody({required this.message, required this.userData, required this.status, required this.code});

  factory SignupResponseBody.fromJson(Map<String, dynamic> json) => _$SignupResponseBodyFromJson(json);
}

@JsonSerializable()
class UserData {
  final String token;
  @JsonKey(name: "username")
  final String userName;

  UserData({required this.token, required this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
