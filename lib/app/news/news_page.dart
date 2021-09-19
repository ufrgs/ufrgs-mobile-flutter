import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrgs_mobile/app/news/widgets/news_card.dart';
import 'package:ufrgs_mobile/app/news/widgets/news_row.dart';
import 'package:ufrgs_mobile/models/news.dart';
import 'package:ufrgs_mobile/utils/colors.dart';
import 'news_controller.dart';

class NewsPage extends StatefulWidget {
  final String title;
  const NewsPage({Key key, this.title = "News"}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends ModularState<NewsPage, NewsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/ic_flame.png',
          height: 60,
          color: AppColors.white,
        ),
      ),
      body: Observer(
        builder: (_) => store.loading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                key: store.refreshIndicatorKey,
                onRefresh: () async {
                  await store.loadNews(true);
                },
                child: ListView.separated(
                  separatorBuilder: (_, pos) => Container(height: 10),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: store.list.length,
                  itemBuilder: (context, pos) {
                    News news = store.list[pos];

                    return GestureDetector(
                      child: pos == 0 ? NewsCard(news) : NewsRow(news),
                      onTap: () {
                        Modular.to.pushNamed('newsDetail', arguments: news);
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}
