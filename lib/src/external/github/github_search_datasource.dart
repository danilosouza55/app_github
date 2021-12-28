import 'dart:convert';

import 'package:app_github/src/infra/datasources/search_datasource.dart';
import 'package:app_github/src/infra/models/repo_model.dart';
import 'package:app_github/src/infra/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class GithubSearchDatasource implements SearchDatasource {
  String _keyApi = '';
  final Logger _logger;
  final String _host = 'api.github.com';

  GithubSearchDatasource(
    this._logger,
  );

  String base64() {
    return 'Basic ' + base64Encode(utf8.encode('User:$_keyApi'));
  }

  @override
  Future<UserModel> getUser(String keyApi) async {
    _keyApi = keyApi;

    final url = Uri.https(
      _host,
      'user',
    );
    final headers = {
      'authorization': base64(),
      'Content-Type': 'application/json',
    };

    final resp = await http.get(
      url,
      headers: headers,
    );

    _logger.i([
      'request getUser',
      url.toString(),
      headers,
      jsonDecode(resp.body),
    ]);

    if (resp.statusCode != 200) {
      throw 'Erro no retorno do usuário!';
    }

    return UserModel.fromJson(resp.body);
  }

  @override
  Future<List<RepoModel>> getRepos(String login) async {
    final url = Uri.https(_host, 'users/$login/repos');
    final headers = {
      'authorization': base64(),
      'Content-Type': 'application/json',
    };

    final resp = await http.get(
      url,
      headers: headers,
    );
    print(login);

    _logger.i([
      'request getRepos',
      url.toString(),
      headers,
      jsonDecode(resp.body),
    ]);

    if (resp.statusCode != 200) {
      throw 'Erro no retorno os repositorios!';
    }

    List<RepoModel> repos = [];
    final respBody = jsonDecode(resp.body);

    for (final repo in respBody) {
      repos.add(RepoModel.fromMap(repo));
    }

    return repos;
  }
}
