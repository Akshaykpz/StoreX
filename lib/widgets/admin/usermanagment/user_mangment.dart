import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/admin/usermanagment/admintext.dart';
import 'package:giltezy_2ndproject/widgets/admin/usermanagment/users_list.dart';

class MyUserManagment extends StatelessWidget {
  const MyUserManagment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Card(
            elevation: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              height: 53,
              width: 400,
              color: Colors.white,
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AdminText(text: 'Users'),
                    AdminText(text: 'Status'),
                  ]),
            ),
          ),
          const UserList(),
          const UserList(),
          const UserList(),
          const UserList()
        ]),
      ),
    );
  }
}