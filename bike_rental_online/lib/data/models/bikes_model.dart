import 'package:cloud_firestore/cloud_firestore.dart';

class BikesModel {
  final String? id;
  final String? name;
  final DocumentReference? categoryID;
  final Map<String, dynamic>? price;
  final String? photoUrl;
  final String? description;
  final int? quantity;
  final bool? status;

  BikesModel({
    this.id,
    this.name,
    this.categoryID,
    this.price,
    this.photoUrl,
    this.description,
    this.quantity,
    this.status,
  });

  factory BikesModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return BikesModel(
      id: snapshot.id,
      name: data['name'],
      categoryID: data['categoryID'],
      price: data['price'],
      photoUrl: data['photoUrl'],
      description: data['description'],
      quantity: data['quantity'],
      status: data['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categoryID': categoryID,
      'price': price,
      'photoUrl': photoUrl,
      'description': description,
      'quantity': quantity,
      'status': status,
    };
  }
}
