import 'package:bike_rental_online/data/models/bikes_model.dart';

class CartModel {
  final BikesModel bike;
  final int quantity;
  final double total;
  final bool status;
  final DateTime startAt;
  final DateTime endAt;
  final String pickupLocation;
  final String dropoffLocation;

  CartModel({
    required this.bike,
    required int quantity,
    required this.total,
    required this.status,
    required this.startAt,
    required this.endAt,
    required this.pickupLocation,
    required this.dropoffLocation,
  }) : quantity = quantity;

  int getQuantity() => quantity;

  CartModel copyWith({
    BikesModel? bike,
    int? quantity,
    double? total,
    bool? status,
    DateTime? startAt,
    DateTime? endAt,
    String? pickupLocation,
    String? dropoffLocation,
  }) {
    return CartModel(
      bike: bike ?? this.bike,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      status: status ?? this.status,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      dropoffLocation: dropoffLocation ?? this.dropoffLocation,
    );
  }
}
