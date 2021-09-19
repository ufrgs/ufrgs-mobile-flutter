import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:share/share.dart';
import 'package:ufrgs_mobile/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

part 'detail_controller.g.dart';

@Injectable()
class DetailController = _DetailControllerBase with _$DetailController;

abstract class _DetailControllerBase with Store {
  void onShareClick(News news) {
    try {
      var url = news.imageThumb.replaceAll('/image_thumb', '');
      Share.share(news.titulo + '\n\n' + url);
    } catch (e) {
      print(e);
    }
  }

  void onLinkClick(String url) {
    try {
      launch(url);
    } catch (e) {
      print(e);
    }
  }
}
