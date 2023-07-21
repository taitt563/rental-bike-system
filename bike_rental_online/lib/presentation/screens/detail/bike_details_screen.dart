import 'package:bike_rental_online/core/constants/colors.dart';
import 'package:bike_rental_online/data/models/bikes_model.dart';
import 'package:bike_rental_online/presentation/controllers/cart_controller.dart';
import 'package:bike_rental_online/presentation/controllers/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as FlutterMaterial;
import 'package:get/get.dart';

class BikeDetailScreen extends StatelessWidget {
  final BikesModel bike;

  final BikeDetailController _bikeDetailController;
  final CartController _cartController = Get.find<CartController>();

  BikeDetailScreen({required this.bike})
      : _bikeDetailController = Get.put(BikeDetailController(bike: bike));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    bike.photoUrl ?? '',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          FlutterMaterial.Colors.transparent,
                          FlutterMaterial.Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: FlutterMaterial.Colors.transparent,
            elevation: 0.0,
            pinned: true,
            floating: false,
            snap: false,
            // Thiết lập thuộc tính desiredAppBarHeight để tăng kích thước của AppBar khi cuộn
            // Có thể điều chỉnh giá trị này để phù hợp với yêu cầu của bạn
            stretch: true,
            onStretchTrigger: () async {},
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: FlutterMaterial.Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.0),
                      Text(
                        bike.name ?? '',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Text(
                      //   '1 day',
                      //   style: TextStyle(
                      //     fontSize: 18.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      Text(
                        '\$${bike.price?['days']?.toStringAsFixed(2) ?? ''}/ per day',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(color: TColors.textfield),
                        height: 8,
                      ),
                      SizedBox(height: 16.0),
                      // Thêm các thông tin khác của xe
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bike.description ?? '',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(color: TColors.textfield),
                        height: 8,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Pricing:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '1 Hour - \$${bike.price?['1hour']?.toStringAsFixed(2) ?? ''}',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '2 Hours - \$${bike.price?['2hours']?.toStringAsFixed(2) ?? ''}',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '24 Hours - \$${bike.price?['24hours']?.toStringAsFixed(2) ?? ''}',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '2 to 6 Days - \$${bike.price?['days']?.toStringAsFixed(2) ?? ''} per day',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '7 Days - \$${bike.price?['7days']?.toStringAsFixed(2) ?? ''} per day',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(color: TColors.textfield),
                        height: 8,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'All bikes are cleaned and maintained after each use to ensure the best experience for you!',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Accessories (such as baskets) are rentable in-store. Please drop us a message after your booking if you would like to rent one.',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            if (true)
              const BoxShadow(
                color: FlutterMaterial.Colors.black12,
                blurRadius: 2,
              ),
          ],
        ),
        child: BottomAppBar(
          color: FlutterMaterial.Colors.white,
          elevation: 0,
          child: Container(
            height: 56.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _cartController.addToCart(bike);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        side: BorderSide(color: FlutterMaterial.Colors.blue),
                      ),
                      primary: FlutterMaterial.Colors.white,
                      onPrimary: FlutterMaterial.Colors.blue,
                      padding: EdgeInsets.all(13.0), // Đặt kích thước của nút
                    ),
                    child: Text('Add to Cart'),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Rent Now functionality
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      backgroundColor: Color(0xFFFF7643),
                      onPrimary: FlutterMaterial.Colors.white,
                      padding: EdgeInsets.all(13.0), // Đặt kích thước của nút
                    ),
                    child: Text('Rent Now'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
