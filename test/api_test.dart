import 'package:app_github/src/external/github/github_search_datasource.dart';
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
    final user = await _api.getUser('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');

    _logger.i([
      'Test getUser',
      user.toString(),
    ]);

    expect(user.name.isEmpty, false);
  });
}
