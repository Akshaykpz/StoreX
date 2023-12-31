import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

// // // Reference to the Firestore collection
// CollectionReference productsCollection =
//     FirebaseFirestore.instance.collection('products');

// Future<void> addProduct(String productName, double productPrice) async {
//   try {
//     await productsCollection.add({
//       'p_name': productName,
//       'p_price': productPrice,
//     });
//   } catch (e) {
//     log('Error adding product: $e');
//   }
// }

// ignore: non_constant_identifier_names
CollectionReference catgoryCollection =
    FirebaseFirestore.instance.collection('category');
final catgoryStream =
    FirebaseFirestore.instance.collection('category').snapshots();

Future<void> addcategory(
    {required String categoryname, required String categoryimage}) async {
  try {
    await catgoryCollection
        .add({'cat_name': categoryname, 'cat_image': categoryimage});
  } catch (e) {
    log('Error adding cateory');
  }
}
