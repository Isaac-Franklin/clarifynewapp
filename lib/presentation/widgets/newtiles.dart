import 'package:cached_network_image/cached_network_image.dart';
import 'package:clarifyapp_blocversion/presentation/widgets/viewarticle.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String newsTitle;
  final String newsImageText;
  final String newsDescription;
  final String newsLink;
  final String newsContent;
  const NewsTile({
    super.key,
    required this.newsTitle,
    required this.newsImageText,
    required this.newsDescription,
    required this.newsLink,
    required this.newsContent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewArticle(
                newsTitle: newsTitle,
                newsLink: newsLink,
                newsContent: newsContent,
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: newsImageText,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            // Title
            Text(
              newsTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 4,
            ),

            // Description
            Text(
              newsDescription,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
