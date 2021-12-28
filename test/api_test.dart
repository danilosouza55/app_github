import 'package:app_github/src/external/github/github_search_datasource.dart';
import 'package:app_github/src/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

main() {
  final _logger = Logger(
      printer: PrettyPrinter(
    methodCount: 0,
  ));

  final _api = GithubSearchDatasource(
    _logger,
  );

  test('user', () async {
    final _repository = SearchRepositoryImpl(_api);

    final result = await _repository.getUser('');
    result.fold((l) => {}, (r) {
      _logger.i([
        'Test user',
        r.toString(),
      ]);
    });

    expect(result.isRight(), true);
  });

  test('repos', () async {
    final _repository = SearchRepositoryImpl(_api);

    final user = await _api.getUser('');

    final result = await _repository.getRepos(user.login);
    result.fold((l) => {}, (r) {
      _logger.i([
        'Test repos',
        r.toString(),
      ]);
    });

    expect(result.isRight(), true);
  });
}
