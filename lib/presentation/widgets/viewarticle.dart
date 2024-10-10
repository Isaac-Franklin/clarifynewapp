import 'package:clarifyapp_blocversion/presentation/widgets/appbar.dart';
import 'package:clarifyapp_blocversion/presentation/widgets/webpageview.dart';
import 'package:flutter/material.dart';

class ViewArticle extends StatefulWidget {
  final String newsTitle;
  final String newsLink;
  final String newsContent;
  const ViewArticle({
    super.key,
    required this.newsTitle,
    required this.newsLink,
    required this.newsContent,
  });

  @override
  State<ViewArticle> createState() => _ViewArticleState();
}

class _ViewArticleState extends State<ViewArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          100,
        ),
        child: AppBarItem(appTitle: widget.newsTitle),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // child:
        // Text(
        //   widget.newsContent,
        // ),
        child: WebViewStack(
          initialUrl: widget.newsLink,
        ),
      ),
    );
  }
}
