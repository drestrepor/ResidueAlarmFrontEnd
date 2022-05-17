import 'dart:convert';

RegisterResponseModel registerResponseModel(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel.dart({
    required this.email,
    required this.name,
  });
  late final String email;
  late final String name;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['name'] = name;
    return _data;
  }
}
