// To parse this JSON data, do
//
//     final ruMenu = ruMenuFromJson(jsonString);

import 'dart:convert';

List<RuMenu> getRuList(Map<String, RuMenu> map) {
  List<RuMenu> list = [];
  map.entries.forEach((element) {
    var ru = element.value;
    ru.id = element.key;
    list.add(ru);
  });
  return list;
}

Map<String, RuMenu> ruMenuFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, RuMenu>(k, RuMenu.fromJson(v)));

String ruMenuToJson(Map<String, RuMenu> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class RuMenu {
  RuMenu({
    this.nome,
    this.cardapio,
  });

  String nome;
  String cardapio;
  String id;

  factory RuMenu.fromJson(Map<String, dynamic> json) => RuMenu(
        nome: json["nome"],
        cardapio: json["cardapio"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "cardapio": cardapio,
      };

  String getCardapio() {
    return cardapio.trim();
  }

  String getImageUri() {
    return 'assets/$id.jpg';
  }
}
