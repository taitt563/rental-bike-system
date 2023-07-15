import 'package:bike_rental_online/data/providers/network/model/api_results.dart';

abstract class PostRepository {
  Future<ApiResults> getPhotos();
}
