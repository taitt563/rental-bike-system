import 'package:bike_rental_online/core/constants/colors.dart';
import 'package:bike_rental_online/presentation/controllers/cart_controller.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutMessageView extends StatefulWidget {
  const CheckoutMessageView({super.key});

  @override
  State<CheckoutMessageView> createState() => _CheckoutMessageViewState();
}

class _CheckoutMessageViewState extends State<CheckoutMessageView> {
  final CartController _cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      width: media.width,
      decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: TColors.primaryText,
                  size: 25,
                ),
              )
            ],
          ),
          Image.asset(
            "assets/images/thank_you.png",
            width: media.width * 0.55,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Thank You!",
            style: TextStyle(
                color: TColors.primaryText,
                fontSize: 26,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Vì đơn hàng của bạn",
            style: TextStyle(
                color: TColors.primaryText,
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Đơn đặt hàng của bạn hiện đang được xử lý. Chúng tôi sẽ cho bạn biết sau khi đơn hàng được chọn từ cửa hàng. Kiểm tra tình trạng đơn hàng của bạn",
            textAlign: TextAlign.center,
            style: TextStyle(color: TColors.primaryText, fontSize: 14),
          ),
          const SizedBox(
            height: 35,
          ),
          RoundButton(
              title: "Theo dõi đơn hàng",
              onPressed: () {
                _cartController.cartItems.clear();
                Get.offAllNamed(AppRoutes.Bookmarks);
              }),
          TextButton(
            onPressed: () {
              _cartController.cartItems.clear();
              Get.offAllNamed(AppRoutes.MainTab);
            },
            child: Text(
              "Quay lại",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColors.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
