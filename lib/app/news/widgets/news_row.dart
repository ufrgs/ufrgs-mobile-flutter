import 'package:flutter/material.dart';
import 'package:ufrgs_mobile/models/news.dart';

class NewsRow extends StatelessWidget {
  final News news;

  const NewsRow(this.news);

  @override
  Widget build(BuildContext context) {
    double wCard = MediaQuery.of(context).size.width * 0.3;
    double hCard = wCard * 0.7;
    return Container(
      height: hCard,
      child: Row(
        children: [
          news.imagem != null
              ? Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Container(
                    height: hCard,
                    width: wCard,
                    child: Stack(
                      children: [
                        Image.network(
                          news.imagem.url,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: <Color>[Colors.black87, Colors.black26],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          Container(
            width: 8,
          ),
          Flexible(
            child: Text(
              news.titulo,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
