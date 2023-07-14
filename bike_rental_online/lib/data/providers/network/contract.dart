import 'package:bike_rental_online/data/providers/network/model/api_results.dart';
import 'package:bike_rental_online/data/providers/network/model/network_model.dart';

abstract class Network {
  Future<ApiResults> callApi({
    required NetworkModel method,
  });
}
