import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "https://reqres.in/api";
  var log = Logger();

  Future get(
    String url,
  ) async {
    url = formatter(url);
    // ignore: prefer_typing_uninitialized_variables, unused_local_variable
    var response;
    try {
      var response = await http.get(Uri.parse(url), headers: {
        "Content-type": "application/json",
      }).timeout(
        const Duration(seconds: 15),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else if (response.statusCode != 200 || response.statusCode != 201) {
        return response;
      }
      log.i(response.body);
      log.i(response.statusCode);
    } on SocketException {
      // print('No Internet: $response');
      return 'No Internet';
      // ignore: unused_catch_clause
    } on TimeoutException catch (e) {
      // print('timeout response: $response');
      return 'Timeout';
      // ignore: unused_catch_clause
    } on Error catch (e) {
      log.i(e);
      return 'Unknown error';
    }
  }

  Future post(String url, Map<String, dynamic> body) async {
    url = formatter(url);
    //print('token: $_jwtToken');
    log.i(url);
    // ignore: prefer_typing_uninitialized_variables, unused_local_variable
    var response;
    try {
      var response = await http
          .post(Uri.parse(url),
              headers: {
                "Content-type": "application/json",
              },
              body: json.encode(body))
          .timeout(const Duration(seconds: 25));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else if (response.statusCode != 200 || response.statusCode != 201) {
        return response;
      }
      log.i(response.body);
      log.i(response.statusCode);
    } on SocketException {
      // print('No Internet: $response');
      return 'No Internet';
      // ignore: unused_catch_clause
    } on TimeoutException catch (e) {
      // print('timeout response: $response');
      return 'Timeout';
      // ignore: unused_catch_clause
    } on Error catch (e) {
      log.i('errrrr: $e');
      return 'Unknown error';
    }
  }

  Future postDynamic(String url, Map<dynamic, dynamic> body) async {
    url = formatter(url);
    //print('token: $_jwtToken');
    log.i(url);
    // ignore: prefer_typing_uninitialized_variables, unused_local_variable
    var response;
    try {
      var response = await http
          .post(Uri.parse(url),
              headers: {
                "Content-type": "application/json",
              },
              body: json.encode(body))
          .timeout(const Duration(seconds: 25));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else if (response.statusCode != 200 || response.statusCode != 201) {
        return response;
      }
      log.i(response.body);
      log.i(response.statusCode);
    } on SocketException {
      // print('No Internet: $response');
      return 'No Internet';
      // ignore: unused_catch_clause
    } on TimeoutException catch (e) {
      // print('timeout response: $response');
      return 'Timeout';
      // ignore: unused_catch_clause
    } on Error catch (e) {
      log.i('errrrr: $e');
      return 'Unknown error';
    }
  }

  Future<http.StreamedResponse> uploadFile(String url, String filePath) async {
    url = formatter(url);

    log.i(url);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    request.headers.addAll({
      "Content-Type": "multipart/form-data",
    });
    var response = request.send();

    return response;
  }

  String formatter(String url) {
    return baseurl + url;
  }
}
