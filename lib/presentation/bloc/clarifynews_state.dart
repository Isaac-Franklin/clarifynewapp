part of 'clarifynews_bloc.dart';

enum loadStatus { loading, success, error }

sealed class ClarifynewsState extends Equatable {
  const ClarifynewsState();

  @override
  List<Object> get props => [];
}

final class ClarifynewsInitial extends ClarifynewsState {}

final class ClarifynewsLoadingStatus extends ClarifynewsState {
  final loadStatus newsLoadStatus;

  const ClarifynewsLoadingStatus({required this.newsLoadStatus});
}

class ClarifyLoadCategoriesState extends ClarifynewsState {
  final List<Category> category;
  final List<ArticlesEntity> articles;

  const ClarifyLoadCategoriesState({
    required this.category,
    required this.articles,
  });
}

class ClarifyLoadingNewsState extends ClarifynewsState {}

class ClarifyLoadNewsState extends ClarifynewsState {}

class ClarifyEntertainmentState extends ClarifynewsState {
  final List<FetchByCategoryEntity> fetchEntertainmentNews;
  final List<FetchByCategoryEntityImage> categoryImages;

  const ClarifyEntertainmentState(
      {required this.fetchEntertainmentNews, required this.categoryImages});
}
