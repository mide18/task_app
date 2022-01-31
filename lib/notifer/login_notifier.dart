import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/core/api/http_client.dart';
import 'package:task_manager_app/core/api/parsers/login_parser.dart';
import 'package:task_manager_app/core/api/request_state.dart';
import 'package:task_manager_app/core/api/request_state_notifier.dart';
import 'package:task_manager_app/core/models/login_model/login_response_model.dart';



class LoginRequestStateNotifier
    extends RequestStateNotifier<LoginResponseModel> {

  void login(
      String email,
      String password,
      ) {
    Map<String, String> payload = {
      "email": email,
      "password": password,
    };

    //created loginRequestObject
    RequestRest loginRequestObject =
    RequestRest(endpoint: "/login", payload: payload);

    makeRequest(() {
      return loginRequestObject.executePostRequest(const LoginParser());
    });
  }
}

final loginRequestStateNotifierProvider = StateNotifierProvider<
    LoginRequestStateNotifier,
    RequestState<LoginResponseModel>>((ref) => LoginRequestStateNotifier());
