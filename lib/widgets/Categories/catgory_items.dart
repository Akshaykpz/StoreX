import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/item_view.dart';

import 'package:giltezy_2ndproject/widgets/homepage/ItemView/serach.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class CategoryViewPage extends StatefulWidget {
  const CategoryViewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SecondGridState createState() => _SecondGridState();
}

class _SecondGridState extends State<CategoryViewPage> {
  List<String> yourImagesList = [
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061454177.jpg?alt=media&token=d9a6ae39-0c64-4225-8d65-eddc0cebf46f',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061955495.jpg?alt=media&token=6cf45032-357b-40c1-a37d-a5141d3eb47d',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061454177.jpg?alt=media&token=d9a6ae39-0c64-4225-8d65-eddc0cebf46f',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061955495.jpg?alt=media&token=6cf45032-357b-40c1-a37d-a5141d3eb47d',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061454177.jpg?alt=media&token=d9a6ae39-0c64-4225-8d65-eddc0cebf46f',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061955495.jpg?alt=media&token=6cf45032-357b-40c1-a37d-a5141d3eb47d',
  ];

  List<Color> rowColors = [
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.red.shade100,
  ]; // Define row colors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Serach(),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: collection,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No products available.');
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final document = snapshot.data!.docs[index];
                      final productName = document['p_name'];
                      final productPrice = document['p_price'];
                      final rowColor = rowColors[
                          index % rowColors.length]; // Get the row color

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const ItemViews(),
                            //     ));
                          },
                          child: Card(
                            color:
                                rowColor, // Set the row color as the background color
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            elevation: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Stack(
                                  children: [
                                    Image.network(
                                      yourImagesList[index],
                                      height: 130,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      productName,
                                      style: GoogleFonts.dmSerifDisplay(
                                          color: Colors.blue),
                                    ),
                                    Text(
                                      productPrice,
                                      style: GoogleFonts.arbutusSlab(
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
