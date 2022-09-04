// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:diaco/Model/get_list.dart';
import 'package:diaco/Model/post_message.dart';
import 'package:diaco/exceptions/diaco_exception.dart';
import 'package:diaco/server/http_error_handler.dart';
import 'package:http/http.dart' as http;

class DiacoApiServices {
  final http.Client client;

  DiacoApiServices({
    required this.client,
  });

  Future<GetList> getListOfMessages() async {
    var url = "https://front-challenge.devliom.ir?from=10";
    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        throw DiacoException(httpErrorHandler(response));
      }
      final responseBody = json.decode(response.body);
      final GetList list = GetList.fromJson(responseBody);
      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetList> setListOfMessages(PostMessage model) async {
    var url = "https://front-challenge.devliom.ir";

    try {
      final http.Response response = await http.post(Uri.parse(url),
          body: jsonEncode(model.toJson()),
          headers: <String, String>{'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        throw DiacoException(httpErrorHandler(response));
      }
      final responseBody = json.decode(response.body);
      final GetList list = GetList.fromJson(responseBody);
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
