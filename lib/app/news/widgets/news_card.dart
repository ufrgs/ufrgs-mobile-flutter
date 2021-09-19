import 'package:flutter/material.dart';
import 'package:ufrgs_mobile/models/news.dart';
import 'package:ufrgs_mobile/utils/colors.dart';

class NewsCard extends StatelessWidget {
  final News news;

  NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Container(
        height: 200,
        child: Stack(
          children: [
            news.imagem != null
                ? Image.network(
                    news.imagem.url,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[Colors.black87, Colors.black26],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    news.titulo,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                  Container(height: news.chamada.isEmpty ? 8 : 0),
                  news.chamada.isEmpty
                      ? Text(
                          news.chamada,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
