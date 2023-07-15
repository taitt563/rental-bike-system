import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatelessWidget {
  final List<String> iconPaths;
  final List<String> selectedIconPaths;
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomNavigationBar({
    required this.iconPaths,
    required this.selectedIconPaths,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 56.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconPaths.length, (index) {
            return GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: IndexedStack(
                index: index == currentIndex ? 1 : 0,
                children: [
                  SvgPicture.asset(
                    iconPaths[index],
                    height: 24.0,
                    color: Colors.grey,
                  ),
                  SvgPicture.asset(
                    selectedIconPaths[index],
                    height: 24.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
