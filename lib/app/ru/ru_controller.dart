import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrgs_mobile/app/ru/ticket_alert.dart';
import 'package:ufrgs_mobile/models/ru.dart';
import 'package:ufrgs_mobile/repository/app_repository.dart';
import 'package:ufrgs_mobile/utils/message.dart';

part 'ru_controller.g.dart';

@Injectable()
class RuController = _RuControllerBase with _$RuController;

abstract class _RuControllerBase with Store {
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final AppRepository _appRepository;

  _RuControllerBase(this._appRepository) {
    getMenus();
  }

  @observable
  ObservableList<RuMenu> menus = ObservableList();

  @observable
  bool loading = false;

  @action
  void setLoading(bool isLoading) {
    loading = isLoading;
  }

  @action
  Future<void> getMenus({bool force = false}) async {
    setLoading(true);
    try {
      var temp = await _appRepository.fetchRuMenu(force: force);
      menus.addAll(temp);
    } catch (e) {
      print(e);
    }

    setLoading(false);
  }

  Future onTicketClick(BuildContext context) async {
    var res = await _appRepository.isLoggedIn();
    if (res) {
      showDialog(
          context: context,
          builder: (context) => getTicketsAlert(_appRepository.getRuTickets()));
    } else {
      var loggedIn = await Modular.to.pushNamed('login');
      if (loggedIn) {
        onTicketClick(context);
      }
    }
  }
}
