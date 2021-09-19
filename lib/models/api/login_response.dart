// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  final bool success;
  final int code;
  final String message;
  final LoginData data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class LoginData {
  LoginData({
    this.accessToken,
    this.expiresIn,
    this.tokenType,
    this.scope,
    this.refreshToken,
    this.expires,
    this.expiresTimestamp,
  });

  final String accessToken;
  final int expiresIn;
  final String tokenType;
  final String scope;
  final String refreshToken;
  final DateTime expires;
  final int expiresTimestamp;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
        tokenType: json["token_type"],
        scope: json["scope"],
        refreshToken: json["refresh_token"],
        expires: DateTime.parse(json["expires"]),
        expiresTimestamp: json["expires_timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "expires_in": expiresIn,
        "token_type": tokenType,
        "scope": scope,
        "refresh_token": refreshToken,
        "expires": expires.toIso8601String(),
        "expires_timestamp": expiresTimestamp,
      };
}
