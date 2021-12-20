import 'package:app_github/src/infra/models/user_model.dart';

abstract class SearchDatasource {
  Future<UserModel> getUser(String keyApi);
}
