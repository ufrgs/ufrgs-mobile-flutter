import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrgs_mobile/models/news.dart';
import 'detail_controller.dart';

class DetailPage extends StatefulWidget {
  final News news;
  const DetailPage(this.news, {Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, DetailController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var expandedHeight = 56.0;
    if (widget.news.imagem != null) {
      double imageWidth = double.parse(widget.news.imagem.width);
      double imageHeight = double.parse(widget.news.imagem.height);

      double screenWidth = MediaQuery.of(context).size.width;

      expandedHeight = screenWidth * imageHeight / imageWidth;
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    store.onShareClick(widget.news);
                  },
                ),
              ],
              expandedHeight: expandedHeight - 50,
              floating: false,
              pinned: widget.news.imagem == null,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      widget.news.imagem != null
                          ? Image.network(
                              widget.news.imagem.url,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: <Color>[Colors.black54, Colors.black26],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              widget.news.titulo,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            Text(
              widget.news.data,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400),
            ),
            Html(
              data: widget.news.texto,
              style: {
                "body":
                    Style(margin: EdgeInsets.all(0), fontSize: FontSize(14)),
              },
              onLinkTap: (url) => store.onLinkClick(url),
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
