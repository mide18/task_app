import 'package:task_manager_app/core/models/login_model/login_response_model.dart';

import '../json_parser.dart';

class LoginParser extends JsonParser<LoginResponseModel> {
  const LoginParser();

  @override
  Future<LoginResponseModel> parseFromJson(json) async {
    return LoginResponseModel.fromJson(json);
  }
}
