import 'package:http/http.dart' as http;

String httpErrorHandler(http.Response response) {
  final statusCode = response.statusCode;
  final message = response.body;
  final reasonPhrase = response.reasonPhrase;
  final String errorMsg =
      "Request Failed\nStatusCode:$statusCode\nreason:$reasonPhrase\nbody:$message";

  return errorMsg;
}
