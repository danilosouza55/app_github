import 'package:app_github/src/domain/usecases/search.dart';
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

    final result = await _repository.getUser('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');
    result.fold((l) => {}, (r) {
      _logger.i([
        'Test getUser',
        r.toString(),
      ]);
    });

    expect(result.isRight(), true);
  });
}
