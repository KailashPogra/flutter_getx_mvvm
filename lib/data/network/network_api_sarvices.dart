// import 'dart:async';
import 'dart:convert';
import 'dart:io';
//import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/app_exception.dart';
import 'package:getx_mvvm/data/network/base_api_sarvices.dart';
import 'package:http/http.dart' as http;

class NetworkApi extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(minutes: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeout {
      throw RequestTimeout();
    } on ServerException {
      throw ServerException();
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(url);
      print(data);
    }
    try {
      final response = await http
          .post(Uri.parse(url),
              // if data is in row format then we need to write jsonEncode
              // we need to asking it from backend developer
              headers: {
                'Content-Type': 'application/json',
              },
              body: data)
          .timeout(const Duration(minutes: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeout {
      throw RequestTimeout();
    } on ServerException {
      throw ServerException();
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidInputException;
      default:
        throw FatchDataException(
            'error occured while comunicating to  server${response.statusCode}');
    }
  }
}
