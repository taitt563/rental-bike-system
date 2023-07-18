import 'package:bike_rental_online/data/models/bikes_model.dart';
import 'package:bike_rental_online/presentation/controllers/bike_controller.dart';
import 'package:bike_rental_online/presentation/controllers/category_controller.dart';
import 'package:bike_rental_online/presentation/controllers/home_controller.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/detail/bike_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController _homeController = Get.find<HomeController>();
  final BikeController _bikeController = Get.find<BikeController>();
  List<String> categoryList = [
    'All',
    'Mountain',
    'Road',
    'City',
    'Hybrid',
    'Cruiser',
    'BMX',
    'Kids',
  ];

  void _showBikeDetail(BikesModel bike) {
    Navigator.pushNamed(
      context,
      AppRoutes.BikeDetail,
      arguments: bike, // Truyền đối tượng xe vào arguments
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                width: 300, // Đặt chiều rộng của Container
                height: 40, // Đặt chiều cao của Container
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(7.0), // Đặt bo góc cho Container
                  border: Border.all(
                      width: 0.5,
                      color: Colors.grey), // Đặt border cho Container
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey.shade600,
                    ),
                    hintText: 'Tìm kiếm...',
                    border: InputBorder.none, // Loại bỏ border của TextField
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.Cart);
              },
              icon: SvgPicture.asset(
                'assets/icons/Cart Icon.svg', // Đường dẫn tới file SVG
                width: 24.0,
                height: 24.0,
                color: Color(0xFFFF7643),
              ),
            ),
            IconButton(
              onPressed: () {
                // TODO: Implement cart functionality
              },
              icon: SvgPicture.asset(
                'assets/icons/Conversation.svg', // Đường dẫn tới file SVG
                width: 24.0,
                height: 24.0,
                color: Color(0xFFFF7643),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 32.0,
          left: 32.0,
          right: 32.0,
        ),
        child: Column(
          children: [
            // SizedBox(
            //   height: 16.0,
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categoryList.length,
                  (index) => GestureDetector(
                    onTap: () => setState(() => selectedIndex = index),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: selectedIndex == index ? 12.0 : 0.0,
                        horizontal: selectedIndex == index ? 22.0 : 0.0,
                      ),
                      margin: EdgeInsets.only(right: 32.0),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Color(0xFFFF7643)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black87,
                            fontSize: 16.0,
                            fontWeight: selectedIndex == index
                                ? FontWeight.w600
                                : FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Obx(
                () {
                  final bikes = _bikeController.bikes;
                  if (bikes.isEmpty) {
                    return Center(child: Text('No bikes available'));
                  } else {
                    return GridView.count(
                      crossAxisCount: 2, // Số cột trong grid
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        bikes.length,
                        (index) {
                          final bike = bikes[index];
                          return GestureDetector(
                            onTap: () => _showBikeDetail(bike),
                            child: Container(
                              width: MediaQuery.of(context).size.width -
                                  64.0, // Đặt chiều rộng của Box
                              height: MediaQuery.of(context).size.height *
                                  0.6, // Đặt chiều cao của Box
                              margin: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 4.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      child: bike.photoUrl != null
                                          ? Image.network(
                                              bike.photoUrl!,
                                              fit: BoxFit.cover,
                                            )
                                          : SizedBox(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          bike.name ?? '',
                                          overflow: TextOverflow
                                              .ellipsis, // Hiển thị dấu "..." cho phần sau
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4.0),
                                        Text(
                                          '\$${bike.price?['1hour']?.toStringAsFixed(2)}/ 1 hour', // Hiển thị giá
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
