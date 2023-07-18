
import 'package:bike_rental_online/data/models/category_model.dart';

import 'package:bike_rental_online/domain/repositories/category_repository.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final CategoryRepository _categoryRepo = Get.find<CategoryRepository>();
  final String title = 'Categories';
  final RxList<CategoryModel> categories = RxList<CategoryModel>([]);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final categoryList = await _categoryRepo.getCategories();
      categories.value = categoryList;
      return categoryList;
    } catch (e) {
      print('Error fetching categories: $e');
      throw e;
    }
  }
}
