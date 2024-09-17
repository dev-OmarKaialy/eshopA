import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CurvedNavigationBarWidget extends StatefulWidget {
  const CurvedNavigationBarWidget({super.key});

  @override
  State<CurvedNavigationBarWidget> createState() =>
      _CurvedNavigationBarWidgetState();
}

class _CurvedNavigationBarWidgetState extends State<CurvedNavigationBarWidget> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  final List<Widget> _widgetOptions = <Widget>[
    // const HomePage(),
    // const MapPage(),
    // ServicesScreen(),
    // const NotificationsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (BuildContext context, int currentIndex, Widget? child) {
          return _widgetOptions.elementAt(currentIndex);
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home_outlined),
          Icon(Icons.location_on_outlined),
          Icon(Icons.info_outline),
          Icon(Icons.notifications_none_sharp),
        ],
        onTap: (int value) {
          _currentIndexNotifier.value = value;
        },
        index: _currentIndexNotifier.value,
        backgroundColor: AppColors.primaryColor,
        height: 59.h,
        color: AppColors.white,
      ),
    );
  }
}
