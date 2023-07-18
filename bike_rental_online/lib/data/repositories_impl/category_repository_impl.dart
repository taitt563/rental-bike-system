import 'package:bike_rental_online/data/models/category_model.dart';
import 'package:bike_rental_online/domain/repositories/category_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await _firebaseFirestore.collection('Category').get();
    final categoryList = snapshot.docs.map((doc) {
      final data = doc.data();
      return CategoryModel(
        id: doc.id,
        name: data['name'],
        description: data['description'],
      );
    }).toList();
    return categoryList;
  }
}
