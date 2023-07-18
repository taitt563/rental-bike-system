import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String? id;
  final String? name;
  final String? description;

  CategoryModel({
    this.id,
    this.name,
    this.description,
  });

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return CategoryModel(
      id: snapshot.id,
      name: data['name'],
      description: data['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
