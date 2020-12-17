import 'package:flutter/material.dart';
import 'package:project_example/constants/app_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(NavigationTab) onTabSelected;

  const CustomBottomNavigationBar({
    Key key,
    this.onTabSelected,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        widget.onTabSelected?.call(NavigationTab.values[index]);

        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex,
      backgroundColor: AppColors.black,
      unselectedItemColor: AppColors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.science),
          label: "Planets",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          label: "Bookmark",
        ),
      ],
    );
  }
}

enum NavigationTab { planets, bookmark }
