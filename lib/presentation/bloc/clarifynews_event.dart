part of 'clarifynews_bloc.dart';

sealed class ClarifynewsEvent extends Equatable {
  const ClarifynewsEvent();

  @override
  List<Object> get props => [];
}

class ClarifynewsLoadingStatusEvent extends ClarifynewsEvent {}

class ClarifynewsErrorEvent extends ClarifynewsEvent {}

class ClarifyLoadCategoriesEvent extends ClarifynewsEvent {}

class ClarifyLoadNewsEventStatusEvent extends ClarifynewsEvent {}

class ClarifyEntertainmentStateEvent extends ClarifynewsEvent {
  final String categoryTitle;

  const ClarifyEntertainmentStateEvent({required this.categoryTitle});
}
