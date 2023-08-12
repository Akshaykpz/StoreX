import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:giltezy_2ndproject/widgets/Cart/button.dart';
import 'package:giltezy_2ndproject/widgets/Cart/cart_items.dart';
import 'package:giltezy_2ndproject/widgets/Cart/counter_cart.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'My Cart',
            style: kvrheading,
          ),
          SizedBox(
            height: 10,
          ),
          CartItemsviews(
              descriptions: 'Iphone x-mas',
              imagePath: 'assets/images/walling-52H5Nfi5WiE-unsplash.jpg',
              price: '₹23000'),
          SizedBox(
            height: 10,
          ),
          CartItemsviews(
              descriptions: 'Samsung A -13',
              imagePath:
                  'assets/images/ramal-wickramasinghe-OjMyiwfviQ4-unsplash.jpg',
              price: '₹12000'),
          SizedBox(
            height: 10,
          ),
          CartItemsviews(
              descriptions: 'OnePlus Nord 2',
              imagePath: 'assets/images/anh-nhat-yqcloMb3Abw-unsplash.jpg',
              price: '₹42000'),
          SizedBox(
            height: 10,
          ),
          CartItemsviews(
              descriptions: 'Realme XMS',
              imagePath:
                  'assets/images/thai-nguyen-dcSJWwdyAl8-unsplash (1).jpg',
              price: ' ₹45200'),
          SizedBox(
            height: 10,
          ),
          CartItemsviews(
              descriptions: 'Samsung max',
              imagePath: 'assets/images/max-whitehead-nRKzAy4w6mE-unsplash.jpg',
              price: ' ₹24500'),
          CartButton()
        ],
      ),
    );
  }
}