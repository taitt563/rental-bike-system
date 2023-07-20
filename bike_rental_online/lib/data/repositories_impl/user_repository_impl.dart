import 'package:bike_rental_online/data/models/user_model.dart';
import 'package:bike_rental_online/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> createUser(UserModel user) async {
    try {
      await _firebaseFirestore.collection('Users').doc(user.id).set(
            user.toMap(),
          );
    } catch (e) {
      print('Lỗi khi tạo người dùng: $e');
      throw e;
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final firebaseUser = _firebaseAuth.currentUser;
      if (firebaseUser != null) {
        final userSnapshot = await _firebaseFirestore
            .collection('Users')
            .doc(firebaseUser.uid)
            .get();
        if (userSnapshot.exists) {
          final userData = userSnapshot.data() as Map<String, dynamic>;
          final userModel = UserModel.fromMap(userData);
          return userModel;
        }
      }
      return null; // User not found or document doesn't exist
    } catch (e) {
      print('Error fetching current user: $e');
      throw e;
    }
  }
  
  @override
  Future<void> updateUser(UserModel user) async{
    await _firebaseFirestore.collection('Users').doc(user.id).update({
      'fullName': user.name,
      'email': user.email,
      'phoneNumber': user.phoneNumber,
      'address': user.address,
      'password': user.password,
      'avatarUrl': user.avatarUrl,
    });
  }
}
