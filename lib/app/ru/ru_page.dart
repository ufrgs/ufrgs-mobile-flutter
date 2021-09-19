import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrgs_mobile/app/ru/ru_row.dart';
import 'package:ufrgs_mobile/utils/colors.dart';
import 'ru_controller.dart';

class RuPage extends StatefulWidget {
  final String title;
  const RuPage({Key key, this.title = "Ru"}) : super(key: key);

  @override
  _RuPageState createState() => _RuPageState();
}

class _RuPageState extends ModularState<RuPage, RuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/ic_flame.png',
          height: 60,
          color: AppColors.white,
        ),
        actions: [
          IconButton(
            onPressed: () => store.onTicketClick(context),
            icon: Icon(
              Icons.confirmation_number,
              color: AppColors.white,
            ),
          )
        ],
      ),
      body: Observer(
        builder: (_) => store.loading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                key: store.refreshIndicatorKey,
                onRefresh: () async {
                  await store.getMenus(force: true);
                },
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: store.menus.length,
                  separatorBuilder: (_, __) => Container(height: 8),
                  itemBuilder: (context, pos) {
                    var item = store.menus[pos];
                    return RuRow(item);
                  },
                ),
              ),
      ),
    );
  }
}
