import 'package:bike_rental_online/data/providers/network/model/network_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_results.freezed.dart';

@freezed
class ApiResults with _$ApiResults {
  //post call api
  const factory ApiResults.success({
    required String data,
    required String url,
    required Map<String, String> headers,
    required int statusCode,
  }) = _ApiResultsSuccess;

  const factory ApiResults.error({
    required String data,
    required String url,
    required Map<String, String> headers,
    required int statusCode,
  }) = _ApiResultsError;

  const factory ApiResults.failure({
    required NetworkException networkException,

  }) = _ApiResultsFailure;
}
