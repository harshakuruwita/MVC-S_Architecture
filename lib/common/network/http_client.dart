import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:owwn_coding_challenge/common/network/api_exceptions.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  Future<dynamic> postRequst(
      String url, dynamic body, Map<String, String>? headers) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response =
          await http.post(Uri.parse(url), body: body, headers: headers);

      responseJson = json.decode(response.body.toString());
    } catch (e) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getRequst(String url, Map<String, String>? headers) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      responseJson = json.decode(response.body.toString());
    } catch (e) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
