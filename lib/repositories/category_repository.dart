import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:giftify/models/categoryModel.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('category').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
