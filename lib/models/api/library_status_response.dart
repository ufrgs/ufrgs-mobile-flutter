// To parse this JSON data, do
//
//     final libraryStatusResponse = libraryStatusResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ufrgs_mobile/models/library_status.dart';

LibraryStatusResponse libraryStatusResponseFromJson(String str) =>
    LibraryStatusResponse.fromJson(json.decode(str));

String libraryStatusResponseToJson(LibraryStatusResponse data) =>
    json.encode(data.toJson());

class LibraryStatusResponse {
  LibraryStatusResponse({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  final bool success;
  final int code;
  final String message;
  final StatusData data;

  factory LibraryStatusResponse.fromJson(Map<String, dynamic> json) =>
      LibraryStatusResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: StatusData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}
