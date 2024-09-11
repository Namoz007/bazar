import 'package:bazar/core/network/dio_network.dart';
import 'package:bazar/core/utils/details/app_details.dart';
import 'package:bazar/data/models/user_model.dart';
import 'package:bazar/domain/entities/user_model.dart';

class UserSources{
  final _dio = DioFile.getInstance().dio;

  Future<UserDetails> getMyUser() async{
    final response = await _dio.get("/users/${AppDetails.model!.id}.json");
    final mp = response.data as Map<String,dynamic>;
    return UserDetails.fromJson(response.data);
  }
  
  Future<UserDetails> editUserDetails(UserDetails model) async{
    await _dio.put("/users/${model.id}.json",data: model.toMap(),);
    return model;
  }
}