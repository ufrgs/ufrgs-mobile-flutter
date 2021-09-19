import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrgs_mobile/app/library/library_page.dart';
import 'package:ufrgs_mobile/app/news/news_page.dart';
import 'package:ufrgs_mobile/app/ru/ru_page.dart';
import 'package:ufrgs_mobile/utils/colors.dart';
import 'main_controller.dart';
import 'widgets/bottom_icon.dart';

class MainPage extends StatefulWidget {
  final String title;
  const MainPage({Key key, this.title = "Main"}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ModularState<MainPage, MainController> {
  //use 'controller' variable to access controller
  List<Widget> stack = [
    NewsPage(),
    RuPage(),
    LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: store.selectedPage,
          selectedItemColor: AppColors.red,
          onTap: (int index) {
            store.selectPage(index);
          },
          items: [
            getBottomNavigationItem('assets/ic_news.png', 'Notícias'),
            getBottomNavigationItem('assets/ic_ru.png', 'Restaurante'),
            getBottomNavigationItem('assets/ic_library.png', 'Biblioteca'),
          ],
        ),
        body: IndexedStack(
          index: store.selectedPage,
          children: stack,
        ),
      ),
    );
  }
}
