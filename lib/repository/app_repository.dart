import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:ufrgs_mobile/models/api/library_status_response.dart';
import 'package:ufrgs_mobile/models/api/login_response.dart';
import 'package:ufrgs_mobile/models/api/tickets_response.dart';
import 'package:ufrgs_mobile/models/library_status.dart';
import 'package:ufrgs_mobile/models/news.dart';
import 'package:ufrgs_mobile/models/ru.dart';
import 'package:ufrgs_mobile/models/ticket.dart';
import 'package:ufrgs_mobile/repository/local_repository.dart';
import 'package:ufrgs_mobile/settings.dart';
import 'package:ufrgs_mobile/utils/api_utils.dart';
import 'package:ufrgs_mobile/utils/dio_utils.dart';

part 'app_repository.g.dart';

@Injectable()
class AppRepository extends Disposable {
  final DioForNative client;
  final LocalRepository localRepository;

  AppRepository(this.client, this.localRepository);

  Future<LoginData> logIn(String user, String password) async {
    final url = '$BASE_URL/v1/token';
    final body = {
      'client_id': CLIENT_ID,
      'client_secret': CLIENT_SECRET,
      'grant_type': GRANT_TYPE,
      'username': user,
      'password': password,
      'scope': SCOPE,
    };

    Response<String> response = await client.post(url, data: body);

    final loginRes = loginResponseFromJson(response.data);
    await localRepository.saveLoginData(loginRes.data);
    return loginRes.data;
  }

  // NEWS ------------------------------------------------
  Future<List<News>> fetchNews({bool force = false}) async {
    final url = '$OPEN_BASE_URL/getNoticias';
    final params = {'v': 1};

    Response<String> response = await client.get(
      url,
      queryParameters: params,
      options:
          force ? dioOptionsRefresh.toOptions() : dioOptionsDefault.toOptions(),
    );

    return newsFromJson(response.data);
  }

  // RU ------------------------------------------------
  Future fetchRuMenu({bool force = false}) async {
    final url = '$OPEN_BASE_URL/getCardapioRU';
    final params = {'v': 10};

    Response<String> response = await client.get(
      url,
      queryParameters: params,
      options:
          force ? dioOptionsRefresh.toOptions() : dioOptionsDefault.toOptions(),
    );

    final entries = ruMenuFromJson(response.data);
    return getRuList(entries);
  }

  Future<List<Tiquete>> getRuTickets() async {
    if (!(await isLoggedIn())) return null;

    final url = '$BASE_URL/v1/r-u-tiquetes/disponiveis';
    final authClient = await autenticateClient(client, localRepository);

    Response<String> response = await authClient.get(
      url,
      options: dioOptionsRefresh.toOptions(),
    );

    return ticketsResponseFromJson(response.data).data.tiquetes;
  }

  // Biblioteca ------------------------------------------------
  Future fetchLibraryLoans() async {
    if (!(await isLoggedIn())) return null;

    final url = '$BASE_URL/v1/biblioteca/emprestimos';
    final authClient = await autenticateClient(client, localRepository);
    Response<String> response = await authClient.get(
      url,
      options: dioOptionsRefresh.toOptions(),
    );

    return response;
  }

  Future renewLibraryLoans() async {
    if (!(await isLoggedIn())) return null;

    final url = '$BASE_URL/v1/biblioteca/emprestimos';
    final authClient = await autenticateClient(client, localRepository);
    Response<String> response = await authClient.post(
      url,
      options: dioOptionsRefresh.toOptions(),
    );

    return response.data;
  }

  Future<StatusData> getAutoRenewStatus() async {
    if (!(await isLoggedIn())) return null;

    final url = '$BASE_URL/v1/biblioteca/usuario/status';
    final authClient = await autenticateClient(client, localRepository);

    Response<String> response = await authClient.get(
      url,
      options: dioOptionsRefresh.toOptions(),
    );

    return libraryStatusResponseFromJson(response.data).data;
  }

  Future<StatusData> changeAutoRenewStatus() async {
    if (!(await isLoggedIn())) return null;

    final url = '$BASE_URL/v1/biblioteca/configura/renovacao';
    final authClient = await autenticateClient(client, localRepository);

    Response<String> response = await authClient.put(
      url,
      options: dioOptionsRefresh.toOptions(),
    );

    return libraryStatusResponseFromJson(response.data).data;
  }

  // Utils ------------------------------------------------
  Future<bool> isLoggedIn() async {
    return localRepository.isLoggedIn();
  }

  @override
  void dispose() {}
}
