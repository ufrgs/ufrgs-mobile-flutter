import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'library_controller.g.dart';

@Injectable()
class LibraryController = _LibraryControllerBase with _$LibraryController;

abstract class _LibraryControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
