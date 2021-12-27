import 'package:app_github/src/domain/entities/user.dart';
import 'package:app_github/src/domain/repositories/search_repository.dart';
import 'package:flutter/material.dart';

class Search extends ChangeNotifier {
  final SearchRepository _repository;
  User? user;
  String key = '';
  bool active = false;

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

    print(result.isRight());
    print(active);
    print(user.toString());

    notifyListeners();
  }
}
