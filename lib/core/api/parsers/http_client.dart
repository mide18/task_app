import 'package:http/http.dart' as http;
import 'package:task_manager_app/constants/components.dart';
import 'package:task_manager_app/core/api/exceptions/exceptions.dart';
import 'dart:convert';
import 'dart:io';
import 'json_parser.dart';

class RequestRest {
  final String endpoint;
  //payload is mapped with string/dynamic.
  final Map<String, dynamic>? payload;

  RequestRest({
    required this.endpoint,
    this.payload = const {},
  });

  //Post Request API
  Future<T> executePostRequest<T>(JsonParser<T> parser,
      {String? authToken}) async {
    final Map<String, String>? header = authToken == null
        ? {"Content-Type": "application/json*", "Accept": "application/json"}
        //Headers fix
        : {
            HttpHeaders.authorizationHeader: "Bearer $authToken",
            "Content-Type": "application/json",
            "Accept": "application/json"
          };

    final String url = '$kBaseUrl$endpoint';

    final uri = Uri.parse(url);
    print('url: = $url');
    try {
      final String requestBody = jsonEncode(payload);

      print("*****************");
      print(requestBody);
      print(payload);
      print(header);
      print("*****************");
      final http.Response response =
          await http.post(uri, body: requestBody, headers: header);

      print("Raw response from http client: ${response.body}");
      print(" status Code: ${response.statusCode}");
      switch (response.statusCode) {
        case 200:
        case 201:
        case 202:
        case 203:
          //response is a map but our parser is expecting a map or json to work successfully
          //so we use jsonDecode() to convert that string in response.body to a map
          return parser.parseFromJson(response.body);
        case 400:
        case 401:
          throw UnAuthorisedException(ErrorModel.fromJson(response.body));
        case 403:
          throw "Sorry, you can only update your own profile.";
        case 405:
          throw "new Error";
        case 419:
          throw TokenMismatchException(ErrorModel.fromJson(response.body));
        case 422:
          throw UnProcessableEntity(ErrorModel.fromJson(response.body));
        case 500:
          throw ServerError(ErrorModel(
              data: Data(
            error: "Internal Server Error",
            status: 'Unsuccessful',
          )));
        default:
          print(response.statusCode);
          throw FetchDataException(
            ErrorModel(
              data: Data(
                error: "Internal Server Error",
                status: 'Unsuccessful',
              ),
            ),
          );
      }
    } on SocketException catch (_) {
      throw "No internet, Check connection and try again";
    } on FormatException {
      throw "Unable to connect to Siyonna";
    }
  }
}
