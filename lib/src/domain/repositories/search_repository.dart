import 'package:app_github/src/domain/entities/repo.dart';
import 'package:app_github/src/domain/entities/user.dart';
import 'package:app_github/src/domain/errors/erros.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, User>> getUser(String keyApi);

  Future<Either<Failure, List<Repo>>> getRepos(String login);
}
