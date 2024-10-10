class CategoryModelEntity {
  final List<CategoryModelEntity> category;
  // final String categoryImageUrl;
  // final String categoryTitle;

  CategoryModelEntity({
    required this.category,
    // required this.categoryImageUrl,
    // required this.categoryTitle,
  });

  // ADD BUSINESS LOGIC HERE
  // bool isSameCategory(CategoryEntity other) {
  //   return categoryTitle == other.categoryTitle;
  // }

  // List toCategoryList() {
  //   return [
  //     category
  //     // categoryImageUrl,
  //     // categoryTitle,
  //   ];
  // }
}

class CategoryEntity {
  // final List<CategoryEntity> category;
  final String categoryImageUrl;
  final String categoryTitle;

  CategoryEntity({
    // required this.category,
    required this.categoryImageUrl,
    required this.categoryTitle,
  });

  // ADD BUSINESS LOGIC HERE
  // bool isSameCategory(CategoryEntity other) {
  //   return categoryTitle == other.categoryTitle;
  // }

  List toCategoryList() {
    return [
      // category
      categoryImageUrl,
      categoryTitle,
    ];
  }
}
