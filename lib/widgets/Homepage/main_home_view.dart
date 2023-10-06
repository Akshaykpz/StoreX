import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:giltezy_2ndproject/utils/theme/logout_button.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/serach.dart';
import 'package:giltezy_2ndproject/widgets/categories/category_view.dart';

import 'items.dart';
import 'chip_list.dart';

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

  bool showbtmappbar = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // backgroundColor: Colors.transparent,
        body: CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverFillRemaining(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Serach(),
              const SizedBox(
                height: 19,
              ),
              const MyPageView(),
              // CarouselSlider(
              //   items: camera.map((
              //     imageUrl,
              //   ) {
              //     return Container(
              //       width: 390.w,
              //       height: 60.h, // Adjust this height as needed
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(18).r,
              //         image: DecorationImage(
              //           fit: BoxFit.cover,
              //           image: AssetImage(imageUrl),
              //         ),
              //       ),
              //     );
              //   }).toList(),
              //   options: CarouselOptions(
              //     height: 170.h, // Set the desired height of the carousel
              //     autoPlay: true,
              //     enlargeCenterPage: true,
              //     onPageChanged: (index, reason) {
              //       setState(() {
              //         currentIndex = index;
              //       });
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              const ItemsGrid(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
    ));
  }
}
