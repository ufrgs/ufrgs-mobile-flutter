import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ufrgs_mobile/repository/app_repository.dart';
import 'package:ufrgs_mobile/repository/local_repository.dart';
import 'package:ufrgs_mobile/utils/api_utils.dart';
import 'package:ufrgs_mobile/utils/message.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AppRepository _appRepository;

  _LoginControllerBase(this._appRepository);

  @observable
  bool loading = false;

  @action
  String validateUsername(String value) {
    if (value.isEmpty) {
      return 'Por favor digite seu usuário.';
    }
    return null;
  }

  @action
  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Por favor entre com sua senha';
    }
    return null;
  }

  @action
  Future onPressLogin(formKey, String username, String password) async {
    if (formKey.currentState.validate()) {
      loading = true;
      try {
        var data = await _appRepository.logIn(username, password);
        if (data != null) {
          Modular.to.pop(true);
        } else {
          showSnackbarMessage(
              'Erro ao realizar login. Por favor tente novamente.');
        }
      } catch (e) {
        if (e is DioError) {
          showSnackbarMessage(getErrorMessage(e));
        }
        print(e);
      }
      loading = false;
    }
  }
}
