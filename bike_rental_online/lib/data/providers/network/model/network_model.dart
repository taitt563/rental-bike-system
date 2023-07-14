import 'package:bike_rental_online/data/providers/network/model/network_parameters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_model.freezed.dart';

@freezed
class NetworkModel with _$NetworkModel {
  //post call api
  const factory NetworkModel.post(
      {required NetworkParameter networkParameter}) = _NetworkModelPost;

  //get call api
  const factory NetworkModel.get({required NetworkParameter networkParameter}) =
      _NetworkModelGet;
}
