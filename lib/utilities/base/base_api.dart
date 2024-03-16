import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ncc_app/utilities/base/base_values.dart';
import 'package:http/http.dart' show Response, get, patch, post, put;

class BaseApi {
  final BaseValues appValue = BaseValues();
  late int serverPort;
  late String serverIP;

  BaseApi() {
    appValue.getServerUrl().then((value) => serverIP = value);
    appValue.getServerPort().then((value) => serverPort = int.parse(value));
    debugPrint("DEBUG: " + serverIP + " " + serverPort.toString());
  }

  Uri _getUri(String endpoint) {
    return Uri(
        scheme: "http", host: serverIP, port: serverPort, path: endpoint);
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<Response> postRequest(String endpoint,
      [Map<String, dynamic>? data]) async {
    final response = await post(_getUri(endpoint), body: jsonEncode(data));
    return _handleResponse(response);
  }

  Future<Response> getRequest(String endpoint) async {
    final response = await get(_getUri(endpoint));
    return _handleResponse(response);
  }

  Future<Response> putRequest(String endpoint,
      [Map<String, dynamic>? data]) async {
    final response = await put(_getUri(endpoint), body: jsonEncode(data));
    return _handleResponse(response);
  }

  Future<Response> patchRequest(String endpoint,
      [Map<String, dynamic>? data]) async {
    final response = await patch(_getUri(endpoint), body: jsonEncode(data));
    return _handleResponse(response);
  }
}
