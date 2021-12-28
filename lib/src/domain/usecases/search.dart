import 'package:app_github/src/domain/entities/repo.dart';
import 'package:app_github/src/domain/entities/user.dart';
import 'package:app_github/src/domain/repositories/search_repository.dart';
import 'package:flutter/material.dart';

class Search extends ChangeNotifier {
  final SearchRepository _repository;
  User? user;
  String key = '';
  bool active = false;
  List<Repo> repos = [];

  Search(this._repository);

  getUser(String keyApi) async {
    key = keyApi;
    final result = await _repository.getUser(keyApi);

    result.fold((l) {
      active = false;
    }, (r) {
      user = r;
      active = true;
    });

    notifyListeners();
  }

  getRepos() async {
    final result = await _repository.getRepos(user!.login);

    result.fold((l) {}, (r) {
      repos = r;
    });

    notifyListeners();
  }
}
