import 'package:bike_rental_online/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getCategories();
}
