import 'package:app_github/src/infra/models/repo_model.dart';
import 'package:app_github/src/infra/models/user_model.dart';

abstract class SearchDatasource {
  Future<UserModel> getUser(String keyApi);

  Future<List<RepoModel>> getRepos(String login);
}
