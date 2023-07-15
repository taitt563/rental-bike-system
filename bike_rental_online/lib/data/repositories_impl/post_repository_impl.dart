import 'package:bike_rental_online/core/constants/string_constants.dart';
import 'package:bike_rental_online/data/providers/network/contract.dart';
import 'package:bike_rental_online/data/providers/network/model/api_results.dart';
import 'package:bike_rental_online/data/providers/network/model/network_exception.dart';
import 'package:bike_rental_online/data/providers/network/model/network_model.dart';
import 'package:bike_rental_online/data/providers/network/model/network_parameters.dart';
import 'package:bike_rental_online/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final Network network;
  PostRepositoryImpl(this.network);

  @override
  Future<ApiResults> getPhotos() async {
    ApiResults apiResults;

    try {
      apiResults = await network.callApi(
          method: NetworkModel.get(
              networkParameter: NetworkParameter(url: baseUrl + photos)));
    } catch (exception, stacktrace) {
      apiResults = const ApiResults.failure(
          networkException: NetworkException.unknownException());
    }
    return apiResults;
  }
}
