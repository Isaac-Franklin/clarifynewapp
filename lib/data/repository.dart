// ignore_for_file: avoid_print

import 'dart:async';

import 'package:clarifyapp_blocversion/data/apiconstant.dart';
import 'package:clarifyapp_blocversion/data/bycategorymodel.dart';
import 'package:clarifyapp_blocversion/data/categorymodel.dart';
import 'package:clarifyapp_blocversion/data/model.dart';
import 'package:clarifyapp_blocversion/domain/articlesentity.dart';
import 'package:clarifyapp_blocversion/domain/categoryentity.dart';
import 'package:clarifyapp_blocversion/domain/fetchbycatgoryentity.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio();

class CategoryRepository {
  Future<List<Category>> fetchCategory() async {
    return [
      Category(
          title: "General",
          imageurl:
              "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
      Category(
          title: "Entertainment",
          imageurl:
              "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
      Category(
          title: "Business",
          imageurl:
              "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"),
      Category(
          title: "Health",
          imageurl:
              "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80"),
      Category(
          title: "Science",
          imageurl:
              "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80"),
      Category(
          title: "Sports",
          imageurl:
              "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"),
    ];
  }

  CategoryModelEntity toEntity(CategoryModel categoryModel) {
    return categoryModel.toEntity();
  }
}

class NewListRepository {
  Future<List<ArticlesEntity>> fetchNewsList([String? category]) async {
    List<ArticlesEntity> fetchNews = [];
    try {
      final response = await dio.get(loadNewsCategoriesEndpoint(category));

      if (response.data != null && response.data['articles'] != null) {
        for (var articleData in response.data['articles']) {
          if (articleData['title'] != null &&
              !articleData['title'].toString().contains('Removed')) {
            Article articles = Article(
              title: articleData['title'] ?? '',
              author: articleData['author'] ?? '',
              description: articleData['description'] ?? '',
              urlToImage: articleData['urlToImage'] ?? '',
              publshedAt: DateTime.parse(articleData['publishedAt'] ?? ''),
              content: articleData['content'] ?? '',
              articleUrl: articleData['url'] ?? '',
            );

            // ArticlesEntity toEntity(Article articlesEntity) {
            //   return articlesEntity.toEntity(articles);
            // }
            fetchNews.add(articles.toEntity(articles));
          }
        }
      } else {
        print('No articles found or invalid response format');
        throw Exception("Failed to load categories");
      }
    } catch (error) {
      print(error.toString());
    }
    return fetchNews;
  }
}

class FetchByCategoryRepository {
  Future<List<FetchByCategoryEntity>> fetchDataByCategory(
      String category) async {
    List<FetchByCategoryEntity> fetchByCategoryData = [];
    try {
      final response = await dio.get(fetchByCategory(category));
      if (response.data != null && response.data['articles'] != null) {
        for (var categoryData in response.data['articles']) {
          if (categoryData['title'] != null &&
              !categoryData['title'].toString().contains('Removed')) {
            FetchByCategory fetchByCategoryMain = FetchByCategory(
              title: categoryData['title'] ?? '',
              author: categoryData['author'] ?? '',
              description: categoryData['description'] ?? '',
              urlToImage: categoryData['urlToImage'] ?? '',
              publshedAt: DateTime.parse(categoryData['publishedAt'] ?? ''),
              content: categoryData['content'] ?? '',
              articleUrl: categoryData['url'] ?? '',
            );
            // print(categoryData);
            fetchByCategoryData.add(fetchByCategoryMain.toEntity());
          }
        }
      } else {
        throw Exception("Failed to load categories");
      }
    } catch (error) {
      print(error.toString());
    }
    return fetchByCategoryData;
  }
}

class FetchCategoryImageRepository {
  Future<List<FetchByCategoryEntityImage>> fetchByCategoryImage(
      String category) async {
    List<FetchByCategoryEntityImage> fetchByCategoryImageData = [];
    try {
      final response = await dio.get(fetchByCategory(category));
      if (response.data != null && response.data['articles'] != null) {
        for (var categoryData in response.data['articles']) {
          if (categoryData['title'] != null) {
            FetchByCategoryImage fetchByCategoryImageMain =
                FetchByCategoryImage(
              urlToImage: categoryData['urlToImage'] ?? '',
            );
            // print(categoryData);
            fetchByCategoryImageData.add(fetchByCategoryImageMain.toEntity());
          }
        }
      } else {
        throw Exception("Failed to load category images");
      }
    } catch (error) {
      print(error.toString());
    }

    return fetchByCategoryImageData;
  }
}
