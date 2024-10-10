import 'package:clarifyapp_blocversion/presentation/bloc/clarifynews_bloc.dart';
import 'package:clarifyapp_blocversion/presentation/widgets/appbar.dart';
import 'package:clarifyapp_blocversion/presentation/widgets/newtiles.dart';
import 'package:clarifyapp_blocversion/presentation/widgets/newscategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;

  void refreshPage() {
    setState(() {
      current++;
    });
  }

  @override
  void initState() {
    context.read<ClarifynewsBloc>().add(ClarifyLoadCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: const AppBarItem(
          appTitle: 'Clarify News App',
        ),
      ),

      // body
      body: BlocBuilder<ClarifynewsBloc, ClarifynewsState>(
        buildWhen: (previous, current) =>
            current is ClarifynewsLoadingStatus ||
            current is ClarifyLoadingNewsState ||
            current is ClarifyLoadNewsState ||
            current is ClarifyLoadCategoriesState,
        builder: (context, state) {
          if (state is ClarifynewsLoadingStatus &&
              state.newsLoadStatus == loadStatus.loading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....'),
                  SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else if (state is ClarifynewsLoadingStatus &&
              state.newsLoadStatus == loadStatus.error) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Error loading data'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    return refreshPage();
                  },
                  child: const Text('Click to refresh'),
                )
              ],
            );
          } else if (state is ClarifyLoadCategoriesState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.category.length,
                      itemBuilder: (context, index) => Container(
                        child: NewsCategoryCards(
                          cartegoryImg: state.category[index].imageurl,
                          categoryTitle: state.category[index].title,
                          categoryName: state.category[index].title,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 650,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.articles.length,
                          itemBuilder: (context, index) {
                            return NewsTile(
                              newsTitle: state.articles[index].title,
                              newsImageText: state.articles[index].urlToImage,
                              newsDescription:
                                  state.articles[index].description,
                              newsLink: state.articles[index].articleUrl,
                              newsContent: state.articles[index].content,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Column(
                children: [
                  Text('Loading...'),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
