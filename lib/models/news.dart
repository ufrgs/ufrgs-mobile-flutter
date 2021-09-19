// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

List<News> newsFromJson(String str) => List<News>.from(
      json.decode(str).map((x) => News.fromJson(x)),
    );

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    this.titulo,
    this.chamada,
    this.data,
    this.imageThumb,
    this.imageLarge,
    this.imagem,
    this.texto,
  });

  String titulo;
  String chamada;
  String data;
  String imageThumb;
  String imageLarge;
  NewsImage imagem;
  String texto;

  factory News.fromJson(Map<String, dynamic> json) => News(
        titulo: json["titulo"] == null ? null : json["titulo"],
        chamada: json["chamada"] == null ? null : json["chamada"],
        data: json["data"] == null ? null : json["data"],
        imageThumb: json["image_thumb"] == null ? null : json["image_thumb"],
        imageLarge: json["image_large"] == null ? null : json["image_large"],
        imagem: json["imagem"] == null
            ? null
            : json["imagem"] is Map<String, dynamic>
                ? NewsImage.fromJson(json["imagem"])
                : null,
        texto: json["texto"] == null ? null : json["texto"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo == null ? null : titulo,
        "chamada": chamada == null ? null : chamada,
        "data": data == null ? null : data,
        "image_thumb": imageThumb == null ? null : imageThumb,
        "image_large": imageLarge == null ? null : imageLarge,
        "imagem": imagem == null ? null : imagem.toJson(),
        "texto": texto == null ? null : texto,
      };
}

class NewsImage {
  NewsImage({
    this.url,
    this.legenda,
    this.width,
    this.height,
  });

  String url;
  String legenda;
  String width;
  String height;

  factory NewsImage.fromJson(Map<String, dynamic> json) => NewsImage(
        url: json["url"] == null ? null : json["url"],
        legenda: json["legenda"] == null ? null : json["legenda"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "legenda": legenda == null ? null : legenda,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}
