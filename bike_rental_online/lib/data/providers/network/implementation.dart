import 'dart:io';

import 'package:bike_rental_online/data/providers/network/contract.dart';
import 'package:bike_rental_online/data/providers/network/http/http_contract.dart';
import 'package:bike_rental_online/data/providers/network/model/api_results.dart';
import 'package:bike_rental_online/data/providers/network/model/network_exception.dart';
import 'package:bike_rental_online/data/providers/network/model/network_model.dart';
import 'package:http/http.dart' as http;

class NetworkImplementation extends Network {
  HttpNetwork httpNetwork;
  NetworkImplementation(this.httpNetwork);
  @override
  Future<ApiResults> callApi({required NetworkModel method}) async {
    try {
      http.Response response = await httpNetwork.getResponse(method: method);
      String body = response.body;
      String url = response.request?.url.toString() ?? "";
      int statusCode = response.statusCode;
      Map<String, String> headers = response.headers;

      if (httpNetwork.validStatusCode(statusCode)) {
        return ApiResults.success(
            data: body, url: url, headers: headers, statusCode: statusCode);
      } else {
        return ApiResults.error(
            data: body, url: url, headers: headers, statusCode: statusCode);
      }
    } on HttpException {
      return const ApiResults.failure(
          networkException: NetworkException.httpException());
    } on FormatException {
      return const ApiResults.failure(
          networkException: NetworkException.formatException());
    } catch (exception) {
      return httpNetwork.unknownException;
    }
  }
}
