import 'package:bike_rental_online/core/constants/colors.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List notificationArr = [
    {
      "title": "Đơn đặt hàng của bạn đang chuẩn bị",
      "time": "Now",
    },
    {
      "title": "Đơn đặt hàng của bạn đã giao thành công",
      "time": "1 h ago",
    },
    {
      "title": "Đơn đặt hàng của bạn đang chuẩn bị",
      "time": "3 h ago",
    },
    {
      "title": "Đơn đặt hàng của bạn đã giao thành công",
      "time": "5 h ago",
    },
    {
      "title": "Đơn đặt hàng của bạn đang chuẩn bị",
      "time": "05 Jun 2023",
    },
    {
      "title": "Đơn đặt hàng của bạn đã giao thành công",
      "time": "05 Jun 2023",
    },
    {
      "title": "Đơn đặt hàng của bạn đang chuẩn bị",
      "time": "06 Jun 2023",
    },
    {
      "title": "Đơn đặt hàng của bạn đã giao thành công",
      "time": "06 Jun 2023",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Row(
      //     children: [
      //       Expanded(
      //           child: Text(
      //         "Thông báo",
      //         style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 20,
      //             fontWeight: FontWeight.normal),
      //       )),
      //       IconButton(
      //         onPressed: () {
      //           Get.toNamed(AppRoutes.Cart);
      //         },
      //         icon: SvgPicture.asset(
      //           'assets/icons/Cart Icon.svg', // Đường dẫn tới file SVG
      //           width: 24.0,
      //           height: 24.0,
      //           color: Color(0xFFFF7643),
      //         ),
      //       ),
      //     ],
      //   ),
      //   bottom: PreferredSize(
      //     child: Container(
      //       height: 1.0,
      //       color: Colors.grey.withOpacity(0.5),
      //     ),
      //     preferredSize: Size.fromHeight(1.0),
      //   ),
      // ),
      appBar: AppBarWidget(
          scaffoldKey: scaffoldKey, title: "Thông báo", showDrawer: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 46,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Row(
              //     children: [
              //       IconButton(
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //         icon: Image.asset("assets/images/btn_back.png",
              //             width: 20, height: 20),
              //       ),
              //       const SizedBox(
              //         width: 8,
              //       ),
              //       Expanded(
              //         child: Text(
              //           "Notifications",
              //           style: TextStyle(
              //               color: TColors.primaryText,
              //               fontSize: 20,
              //               fontWeight: FontWeight.w800),
              //         ),
              //       ),
              //       IconButton(
              //         onPressed: () {
              //           // Navigator.push(
              //           //     context,
              //           //     MaterialPageRoute(
              //           //         builder: (context) => const MyOrderView()));
              //         },
              //         icon: Image.asset(
              //           "assets/images/shopping_cart.png",
              //           width: 25,
              //           height: 25,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: notificationArr.length,
                separatorBuilder: ((context, index) => Divider(
                      indent: 25,
                      endIndent: 25,
                      color: TColors.secondaryText.withOpacity(0.4),
                      height: 1,
                    )),
                itemBuilder: ((context, index) {
                  var cObj = notificationArr[index] as Map? ?? {};
                  return Container(
                    decoration: BoxDecoration(
                        color:
                            index % 2 == 0 ? TColors.white : TColors.textfield),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: TColors.primary,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cObj["title"].toString(),
                                style: TextStyle(
                                    color: TColors.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                cObj["time"].toString(),
                                style: TextStyle(
                                    color: TColors.secondaryText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
