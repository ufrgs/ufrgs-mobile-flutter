import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'main_controller.g.dart';

@Injectable()
class MainController = _MainControllerBase with _$MainController;

abstract class _MainControllerBase with Store {
  @observable
  int selectedPage = 0;

  @action
  void selectPage(int index) {
    selectedPage = index;
  }
}
