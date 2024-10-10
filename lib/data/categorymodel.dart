import 'package:clarifyapp_blocversion/domain/categoryentity.dart';

class CategoryModel {
  final List category;

  CategoryModel({required this.category});

  CategoryModelEntity toEntity() {
    return CategoryModelEntity(category: []);
  }
}

class Category {
  final String imageurl;
  final String title;

  Category({
    required this.imageurl,
    required this.title,
  });

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryImageUrl: imageurl,
      categoryTitle: title,
    );
  }
}
