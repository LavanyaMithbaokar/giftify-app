import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giftify/models/categoryModel.dart';
import 'package:giftify/repositories/category_repository.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(
        allCategories
            .where(
                (category) => category.isFeatured && category.parentId.isEmpty)
            .take(8)
            .toList(),
      );
    } catch (e) {
      Get.snackbar(
        'Oh snap!',
        e.toString(),
        isDismissible: true,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade600,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
      );
    } finally {}
  }
}
