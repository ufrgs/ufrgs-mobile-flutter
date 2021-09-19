// To parse this JSON data, do
//
//     final ticketsResponse = ticketsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ufrgs_mobile/models/api/api_models.dart';
import 'package:ufrgs_mobile/models/ticket.dart';

TicketsResponse ticketsResponseFromJson(String str) =>
    TicketsResponse.fromJson(json.decode(str));

String ticketsResponseToJson(TicketsResponse data) =>
    json.encode(data.toJson());

class TicketsResponse {
  TicketsResponse({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  final bool success;
  final int code;
  final String message;
  final TicketData data;

  factory TicketsResponse.fromJson(Map<String, dynamic> json) =>
      TicketsResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: TicketData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class TicketData {
  TicketData({
    this.tiquetes,
    this.links,
    this.meta,
  });

  final List<Tiquete> tiquetes;
  final ApiLinks links;
  final ApiMeta meta;

  factory TicketData.fromJson(Map<String, dynamic> json) => TicketData(
        tiquetes: List<Tiquete>.from(
            json["tiquetes"].map((x) => Tiquete.fromJson(x))),
        links: ApiLinks.fromJson(json["_links"]),
        meta: ApiMeta.fromJson(json["_meta"]),
      );

  Map<String, dynamic> toJson() => {
        "tiquetes": List<dynamic>.from(tiquetes.map((x) => x.toJson())),
        "_links": links.toJson(),
        "_meta": meta.toJson(),
      };
}
