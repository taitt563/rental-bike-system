import 'package:bike_rental_online/data/models/user_model.dart';

abstract class UserRepository {
  Future<void> createUser(UserModel user);
  Future<UserModel?> getCurrentUser();
  Future<void> updateUser(UserModel user);
}
