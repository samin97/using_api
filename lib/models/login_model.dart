import 'dart:convert';

LoginModel loginModelFormJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String email;
  String password;

  LoginModel({ required this.email, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(email: json['Email'], password: json['Password'] ?? '');

  Map<String, dynamic> toJson() => {
        'Email': email,
        'Password': password,
      };
}
