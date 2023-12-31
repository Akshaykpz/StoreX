import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/widgets/admin/appbar.dart';
import 'package:giltezy_2ndproject/widgets/admin/buttons.dart';
import 'package:giltezy_2ndproject/widgets/admin/categorymangment/category_mgt.dart';
import 'package:giltezy_2ndproject/widgets/admin/dashboard/dash_board.dart';
import 'package:giltezy_2ndproject/widgets/admin/productmanagment/add_view.dart';
import 'package:giltezy_2ndproject/widgets/admin/usermanagment/user_mangment.dart';
import 'package:page_transition/page_transition.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppbarUi(),
            const SizedBox(
              height: 60,
            ),

            // HomeBar(),
            AdminButtons(
              onPressedCallback: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const DashBoard(),
                    ));
              },
              text: 'DashBoard',
              icon: Icons.dashboard,
            ),
            AdminButtons(
              onPressedCallback: () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: const MyUserManagment(),
                  )),
              text: 'User Management',
              icon: Icons.account_box,
            ),
            AdminButtons(
                onPressedCallback: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: const MyProductView(),
                      ));
                },
                text: 'Product Management',
                icon: Icons.production_quantity_limits),
            AdminButtons(
              onPressedCallback: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const MyCategory(),
                    ));
              },
              text: 'Category Management',
              icon: Icons.category,
            ),
          ],
        ),
      ),
    );
  }
}
