import 'package:bazar/core/utils/helpers/dependency_helpers.dart';
import 'package:bazar/data/datasources/user_sources.dart';
import 'package:bazar/data/models/user_model.dart';

class UserRepositories{
  final _sources = getIt<UserSources>();


  Future<UserDetails> getMyUser() async{
    return await _sources.getMyUser();
  }

}