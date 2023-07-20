import 'package:bike_rental_online/core/constants/colors.dart';
import 'package:flutter/material.dart';

enum RoundButtonType { bgPrimary, textPrimary }

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  final double fontSize;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.fontSize = 16,
      this.type = RoundButtonType.bgPrimary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == RoundButtonType.bgPrimary ? null : Border.all(color: TColors.primary, width: 1),
          color: type == RoundButtonType.bgPrimary ? TColors.primary : TColors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: type == RoundButtonType.bgPrimary ? TColors.white :  TColors.primary, fontSize: fontSize, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}