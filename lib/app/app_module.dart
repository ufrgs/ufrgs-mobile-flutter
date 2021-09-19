import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:ufrgs_mobile/app/app_controller.dart';
import 'package:ufrgs_mobile/app/library/library_controller.dart';
import 'package:ufrgs_mobile/app/login/login_controller.dart';
import 'package:ufrgs_mobile/app/login/login_page.dart';
import 'package:ufrgs_mobile/app/main/main_controller.dart';
import 'package:ufrgs_mobile/app/main/main_page.dart';
import 'package:ufrgs_mobile/app/news/detail/detail_controller.dart';
import 'package:ufrgs_mobile/app/news/detail/detail_page.dart';
import 'package:ufrgs_mobile/app/news/news_controller.dart';
import 'package:ufrgs_mobile/app/ru/ru_controller.dart';
import 'package:ufrgs_mobile/repository/app_repository.dart';
import 'package:ufrgs_mobile/repository/local_repository.dart';
import 'package:ufrgs_mobile/utils/dio_utils.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => DioForNative()
        ..interceptors.addAll([
          DioCacheInterceptor(options: dioOptionsDefault),
          LogInterceptor(responseBody: true, requestBody: true),
        ]),
    ),
    $AppRepository,
    $LocalRepository,
    $AppController,
    $MainController,
    $LibraryController,
    $NewsController,
    $RuController,
    $DetailController,
    $LoginController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => MainPage()),
    ChildRoute('/newsDetail', child: (_, args) => DetailPage(args.data)),
    ChildRoute('/login', child: (_, args) => LoginPage()),
  ];
}
