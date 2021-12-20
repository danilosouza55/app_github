import 'package:app_github/src/domain/entities/user.dart';
import 'package:app_github/src/domain/errors/erros.dart';
import 'package:app_github/src/domain/repositories/search_repository.dart';
import 'package:app_github/src/infra/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource _datasource;

  SearchRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, User>> getUser(String keyApi) async {
    try {
      final list = await _datasource.getUser(keyApi);

      return right(list);
    } catch (e) {
      return left(ErrorSearch());
    }
  }
}
