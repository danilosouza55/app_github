import 'package:app_github/src/app_provider.dart';
import 'package:app_github/src/presenter/page/home_page.dart';
import 'package:app_github/src/presenter/page/login_page.dart';
import 'package:app_github/src/presenter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'domain/usecases/search.dart';
import 'external/github/github_search_datasource.dart';
import 'infra/repositories/search_repository_impl.dart';

class AppModule extends StatelessWidget {
  AppModule({Key? key}) : super(key: key);

  final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  Search _buildSearch() {
    final _api = GithubSearchDatasource(
      _logger,
    );

    final _repository = SearchRepositoryImpl(_api);
    return Search(_repository);
  }

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      logger: _logger,
      child: ChangeNotifierProvider(
        create: (context) => _buildSearch(),
        child: MaterialApp(
          title: 'App GitHub Meta',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          initialRoute: '/login',
          routes: {
            '/': (context) => const HomePage(),
            '/login': (context) => const LoginPage()
          },
        ),
      ),
    );
  }
}
