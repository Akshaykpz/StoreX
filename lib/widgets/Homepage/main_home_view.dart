import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:giltezy_2ndproject/utils/theme/logout_button.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/serach.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/chip_list.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/product_items.dart';
import 'package:giltezy_2ndproject/widgets/categories/category_view.dart';
import 'package:giltezy_2ndproject/widgets/splash_screen.dart/logo_view.dart';
import 'package:giltezy_2ndproject/widgets/homepage/ItemView/serach_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<HomePage> {
  int currentIndex = 0;
  ScrollController scrollController = ScrollController();
  late Timer _imageChangeTimer;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showbtmappbar = false;
      } else {
        showbtmappbar = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _imageChangeTimer.cancel();
    super.dispose();
  }
  // Your existing code

// Function to handle navigation to the ProductSearchScreen

// Your existing code

  bool showbtmappbar = true;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchViewPage(),
                              ));
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ))),
              ),
            ],
          ),
          toolbarHeight: 190,
          title: const MyPageView(),
          elevation: 0,
          backgroundColor: Colors.deepPurple[50],
        ),
        SliverFillRemaining(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ,

              const SizedBox(
                height: 30,
              ),
              const ItemsGrid(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Popular',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryItems(),
                          ));
                    },
                    child: const Text('More..'),
                  ),
                ],
              ),
              const Expanded(child: SecondGrid())
            ],
          ),
        )
      ],
    );
  }
}
