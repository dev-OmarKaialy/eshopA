import 'package:eshop_a/core/api/dio/api_client.dart';
import 'package:eshop_a/core/api/endpoints.dart';
import 'package:eshop_a/core/data/models/base_response.dart';
import 'package:eshop_a/core/helper/src/typedef.dart';
import 'package:eshop_a/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteAuthDatasource {
  final ApiClient _client;

  const RemoteAuthDatasource(this._client);

  Future<BaseResponse<UserModel>> register({required BodyMap body}) async {
    final response = await _client.post(Endpoints.register(), data: body);
    return BaseResponse.fromJson(
      json: response.data,
      dataConverter: (body) => UserModel.fromJson(body),
    );
  }

  Future<BaseResponse<UserModel>> login({required BodyMap body}) async {
    final response = await _client.post(Endpoints.login(), data: body);
    return BaseResponse.fromJson(
      json: response.data,
      dataConverter: (body) => UserModel.fromJson(body),
    );
  }
}
