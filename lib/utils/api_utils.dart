import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:ufrgs_mobile/repository/local_repository.dart';

String getErrorMessage(DioError error) {
  try {
    return jsonDecode(error.response.data)['message'];
  } catch (e) {
    return 'Erro, por favor tente novamente em alguns instantes.';
  }
}

Future<DioForNative> autenticateClient(
  DioForNative client,
  LocalRepository localRepository,
) async {
  var loggedIn = await localRepository.isLoggedIn();
  if (!loggedIn) return client;

  var token = (await localRepository.getLoginData()).accessToken;
  client.options.headers = {'Authorization': 'Bearer $token'};
  return client;
}
