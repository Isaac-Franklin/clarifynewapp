// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clarifyapp_blocversion/data/categorymodel.dart';
import 'package:clarifyapp_blocversion/data/repository.dart';
import 'package:clarifyapp_blocversion/domain/articlesentity.dart';
import 'package:clarifyapp_blocversion/domain/fetchbycatgoryentity.dart';
import 'package:equatable/equatable.dart';
part 'clarifynews_event.dart';
part 'clarifynews_state.dart';

class ClarifynewsBloc extends Bloc<ClarifynewsEvent, ClarifynewsState> {
  ClarifynewsBloc() : super(ClarifynewsInitial()) {
    on<ClarifynewsLoadingStatusEvent>(_clarifynewsLoadingStatusEvent);
    on<ClarifyLoadCategoriesEvent>(_clarifyLoadCategoriesEvent);
    on<ClarifyEntertainmentStateEvent>(_clarifyEntertainmentStateEvent);
  }

  FutureOr<void> _clarifynewsLoadingStatusEvent(
      ClarifynewsLoadingStatusEvent event, Emitter<ClarifynewsState> emit) {
    emit(const ClarifynewsLoadingStatus(newsLoadStatus: loadStatus.loading));
    Future.delayed(const Duration(seconds: 5));
  }

  FutureOr<void> _clarifyLoadCategoriesEvent(
      ClarifyLoadCategoriesEvent event, Emitter<ClarifynewsState> emit) async {
    emit(const ClarifynewsLoadingStatus(newsLoadStatus: loadStatus.loading));
    Future.delayed(const Duration(seconds: 5));
    List<Category> categories = await CategoryRepository().fetchCategory();
    var response = await NewListRepository().fetchNewsList();
    emit(ClarifyLoadCategoriesState(category: categories, articles: response));
  }

  // FutureOr<void> _clarifyLoadNewsEventStatusEvent(
  //     ClarifyLoadNewsEventStatusEvent event,
  //     Emitter<ClarifynewsState> emit) async {
  //   emit(ClarifyLoadingNewsState());
  //   Future.delayed(const Duration(seconds: 5));
  //   emit(ClarifyLoadNewsState());
  // }

  FutureOr<void> _clarifyEntertainmentStateEvent(
      ClarifyEntertainmentStateEvent event,
      Emitter<ClarifynewsState> emit) async {
    var response = await FetchByCategoryRepository()
        .fetchDataByCategory(event.categoryTitle);
    var responseImages = await FetchCategoryImageRepository()
        .fetchByCategoryImage(event.categoryTitle);
    emit(ClarifyEntertainmentState(
        fetchEntertainmentNews: response, categoryImages: responseImages));
  }
}
