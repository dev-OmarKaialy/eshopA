import 'package:example/features/post/presentation/widget/drawer_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 60,
            ),
          ),
          DrawerListTitel(
            icon: Icons.home,
            text: 'الصفحة الرئيسية',
            ontap: () {},
          ),
          const SizedBox(height: 20),
          DrawerListTitel(
            icon: Icons.add_circle_outlined,
            text: 'إشتراك',
            ontap: () {},
          ),
          const SizedBox(height: 20),
          DrawerListTitel(
              icon: Icons.notifications, text: 'الاشعارات', ontap: () {}),
          const SizedBox(
            height: 20,
          ),
          DrawerListTitel(icon: Icons.favorite, text: 'المفضلة', ontap: () {}),
          const SizedBox(
            height: 20,
          ),
          DrawerListTitel(
              icon: Icons.add_circle_outlined, text: 'إشتراك', ontap: () {}),
          const SizedBox(
            height: 20,
          ),
          DrawerListTitel(
              icon: Icons.logout,
              text: 'تسجيل الخروج',
              ontap: () {
                Navigator.pop(context);
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
