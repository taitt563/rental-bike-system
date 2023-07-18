import 'package:bike_rental_online/data/models/bikes_model.dart';
import 'package:bike_rental_online/data/models/category_model.dart';

abstract class BikeRepository {
  Stream<BikesModel> getBike(String id);
  Stream<List<BikesModel>> getBikesStream();
  Stream<List<BikesModel>> getBikesByCategory(CategoryModel category);
}
