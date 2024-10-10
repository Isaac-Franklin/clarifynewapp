import 'package:clarifyapp_blocversion/presentation/bloc/clarifynews_bloc.dart';
import 'package:clarifyapp_blocversion/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartEntertainmentPage extends StatelessWidget {
  const StartEntertainmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClarifynewsBloc(),
      child: const Entertainment(),
    );
  }
}

class Entertainment extends StatefulWidget {
  const Entertainment({
    super.key,
  });

  @override
  State<Entertainment> createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  final List categoryTitle = [];
  @override
  void initState() {
    context.read<ClarifynewsBloc>().add(
          const ClarifyEntertainmentStateEvent(
            categoryTitle: 'Entertainment',
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            100,
          ),
          child: const AppBarItem(appTitle: 'Entertainment News')),
      body: BlocBuilder<ClarifynewsBloc, ClarifynewsState>(
        buildWhen: (previous, current) => current is ClarifyEntertainmentState,
        builder: (context, state) {
          if (state is ClarifyEntertainmentState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  // child: CarouselSlider(
                  //   options: CarouselOptions(),
                  //   // items: state.categoryImages[index].urlToImage.toList(),
                  // ),
                  // child: ListView.builder(
                  //   itemCount: state.categoryImages.length,
                  //   itemBuilder: (context, index) {
                  //     return Image(
                  //         image: NetworkImage(
                  //             state.categoryImages[index].urlToImage));
                  //   },
                  // ),
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 900,
                    child: ListView.builder(
                      itemCount: state.fetchEntertainmentNews.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    state.fetchEntertainmentNews[index]
                                        .urlToImage,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              state.fetchEntertainmentNews[index].title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // trailing: Icon(Icons.arrow_forward),
                            // subtitle: Text('Click to read more'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading...'),
                  SizedBox(
                    height: 20,
                  ),
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
