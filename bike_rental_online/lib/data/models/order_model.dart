class OrderModel {
  final String order_id;
  final String user_id;
  final List<String> bike_id;
  final DateTime startAt;
  final DateTime endAt;
  final double totalAmount;
  final String status;
  final String pickupLocation;
  final String dropLocation;

  OrderModel({
    required this.order_id,
    required this.user_id,
    required this.bike_id,
    required this.startAt,
    required this.endAt,
    required this.totalAmount,
    this.status = 'waiting',
    required this.pickupLocation,
    required this.dropLocation,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      order_id: json['order_id'],
      user_id: json['user_id'],
      bike_id: List<String>.from(json['bike_id']),
      startAt: DateTime.parse(json['startAt']),
      endAt: DateTime.parse(json['endAt']),
      totalAmount: json['totalAmount'],
      status: json['status'] ?? 'waiting',
      pickupLocation: json['pickupLocation'],
      dropLocation: json['dropLocation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': order_id,
      'user_id': user_id,
      'bike_id': bike_id,
      'startAt': startAt.toIso8601String(),
      'endAt': endAt.toIso8601String(),
      'totalAmount': totalAmount,
      'status': status,
      'pickupLocation': pickupLocation,
      'dropLocation': dropLocation,
    };
  }
}
