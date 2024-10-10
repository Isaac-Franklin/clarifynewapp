import 'package:clarifyapp_blocversion/presentation/bloc/clarifynews_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartHealthPage extends StatelessWidget {
  const StartHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClarifynewsBloc(),
      child: const Health(),
    );
  }
}

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  void initState() {
    context.read<ClarifynewsBloc>().add(
          const ClarifyEntertainmentStateEvent(
            categoryTitle: 'Health',
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health News'),
      ),
      body: BlocBuilder<ClarifynewsBloc, ClarifynewsState>(
        buildWhen: (previous, current) => current is ClarifyEntertainmentState,
        builder: (context, state) {
          if (state is ClarifyEntertainmentState) {
            return SingleChildScrollView(
              child: Column(
                children: [
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
                          'https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 1000,
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
