import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrgs_mobile/models/news.dart';
import 'package:ufrgs_mobile/repository/app_repository.dart';

part 'news_controller.g.dart';

@Injectable()
class NewsController = _NewsControllerBase with _$NewsController;

abstract class _NewsControllerBase with Store {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final AppRepository _repository;

  _NewsControllerBase(this._repository) {
    setLoading(true);
    loadNews(false);
  }

  @observable
  bool loading = false;

  @observable
  ObservableList<News> list = ObservableList();

  @action
  void setLoading(bool isLoading) {
    loading = isLoading;
  }

  @action
  Future<void> loadNews(bool force) async {
    try {
      list.clear();
      var news = await _repository.fetchNews(force: force);
      list.addAll(news);
    } catch (e) {
      print(e);
    }

    setLoading(false);
  }
}
