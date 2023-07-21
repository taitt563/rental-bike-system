import 'package:bike_rental_online/core/constants/colors.dart';
import 'package:bike_rental_online/presentation/screens/checkout/add_card_screen.dart';
import 'package:bike_rental_online/presentation/screens/checkout/checkout_message_screen.dart';
import 'package:bike_rental_online/presentation/screens/components/round_button.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List paymentArr = [
    {"name": "Cash on delivery", "icon": "assets/images/cash.png"},
    {"name": "**** **** **** 2187", "icon": "assets/images/visa_icon.png"},
    {"name": "test@gmail.com", "icon": "assets/images/paypal.png"},
  ];

  int selectMethod = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phương thức thanh toán"),
      ),
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Địa chỉ trả xe",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: TColors.secondaryText, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Chờ cập nhật",
                            style: TextStyle(
                                color: TColors.primaryText,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           const ChangeAddressView()),
                            // );
                          },
                          child: Text(
                            "Chỉnh sửa",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColors.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: TColors.textfield),
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phương thức thanh toán",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColors.secondaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (context) {
                                  return AddCardScreen();
                                });
                          },
                          icon: Icon(Icons.add, color: TColors.primary),
                          label: Text(
                            "Thêm Credit Card",
                            style: TextStyle(
                                color: TColors.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: paymentArr.length,
                        itemBuilder: (context, index) {
                          var pObj = paymentArr[index] as Map? ?? {};
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                                color: TColors.textfield,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: TColors.secondaryText
                                        .withOpacity(0.2))),
                            child: Row(
                              children: [
                                Image.asset(pObj["icon"].toString(),
                                    width: 50, height: 20, fit: BoxFit.contain),
                                // const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    pObj["name"],
                                    style: TextStyle(
                                        color: TColors.primaryText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),

                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectMethod = index;
                                    });
                                  },
                                  child: Icon(
                                    selectMethod == index
                                        ? Icons.radio_button_on
                                        : Icons.radio_button_off,
                                    color: TColors.primary,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: TColors.textfield),
                height: 8,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const SizedBox(
              //         height: 15,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "Sub Total",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: TColors.primaryText,
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //           Text(
              //             "\$68",
              //             style: TextStyle(
              //                 color: TColors.primaryText,
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w700),
              //           )
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 8,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "Delivery Cost",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: TColors.primaryText,
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //           Text(
              //             "\$2",
              //             style: TextStyle(
              //                 color: TColors.primaryText,
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w700),
              //           )
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 8,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "Discount",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: TColors.primaryText,
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //           Text(
              //             "-\$4",
              //             style: TextStyle(
              //                 color: TColors.primaryText,
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w700),
              //           )
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 15,
              //       ),
              //       Divider(
              //         color: TColors.secondaryText.withOpacity(0.5),
              //         height: 1,
              //       ),
              //       const SizedBox(
              //         height: 15,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "Total",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: TColors.primaryText,
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //           Text(
              //             "\$66",
              //             style: TextStyle(
              //                 color: TColors.primaryText,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w700),
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   decoration: BoxDecoration(color: TColors.textfield),
              //   height: 8,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: RoundButton(
                    title: "Đặt xe",
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) {
                            return CheckoutMessageView();
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
