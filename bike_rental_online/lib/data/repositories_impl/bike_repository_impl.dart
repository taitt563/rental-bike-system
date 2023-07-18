import 'package:bike_rental_online/data/models/bikes_model.dart';
import 'package:bike_rental_online/data/models/category_model.dart';
import 'package:bike_rental_online/domain/repositories/bike_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BikeRepositoryImpl extends BikeRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<BikesModel> getBike(String id) {
    return _firebaseFirestore
        .collection('Bikes')
        .doc(id)
        .snapshots()
        .map((snapshot) => BikesModel.fromSnapshot(snapshot));
  }

  @override
  Stream<List<BikesModel>> getBikesStream() {
    final stream = _firebaseFirestore.collection('Bikes').snapshots();
    return stream.map((snapshot) =>
        snapshot.docs.map((doc) => BikesModel.fromSnapshot(doc)).toList());
  }

  @override
  Stream<List<BikesModel>> getBikesByCategory(CategoryModel category) {
    final stream = _firebaseFirestore
        .collection('Bikes')
        .where('categoryID', isEqualTo: category.id)
        .snapshots();

    return stream.map((snapshot) =>
        snapshot.docs.map((doc) => BikesModel.fromSnapshot(doc)).toList());
  }
}
