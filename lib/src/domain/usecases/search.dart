import 'package:app_github/src/domain/entities/user.dart';
import 'package:app_github/src/domain/errors/erros.dart';
import 'package:app_github/src/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

mixin Search {
  Future<Either<Failure, User>> getUser(String keyApi);
}

class SearchImpl implements Search {
  final SearchRepository _repository;

  SearchImpl(this._repository);

  @override
  Future<Either<Failure, User>> getUser(String keyApi) async {
    final option = optionOf(keyApi);

    return option.fold(() => Left(InvalidSearchText()), (text) async {
      var result = await _repository.getUser(text);
      return result;
    });
  }
}
