import 'package:cached_network_image/cached_network_image.dart';
import 'package:clarifyapp_blocversion/presentation/view/Business.dart';
import 'package:clarifyapp_blocversion/presentation/view/Health.dart';
import 'package:clarifyapp_blocversion/presentation/view/Science.dart';
import 'package:clarifyapp_blocversion/presentation/view/Sports.dart';
import 'package:clarifyapp_blocversion/presentation/view/entertainment.dart';
import 'package:flutter/material.dart';

class NewsCategoryCards extends StatelessWidget {
  final String cartegoryImg;
  final String categoryTitle;
  final String categoryName;
  const NewsCategoryCards({
    super.key,
    required this.cartegoryImg,
    required this.categoryTitle,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 14),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: cartegoryImg,
                  height: 60,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                print(categoryName);
                return getPageFromApiData(categoryName);
              },
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black26),
            child: Text(
              categoryTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }

// Function to decide which page to navigate to
  Widget getPageFromApiData(String categoryName) {
    switch (categoryName) {
      case 'Entertainment':
        return const StartEntertainmentPage();
      case 'Business':
        return const StartBusinessPage();
      case 'Health':
        return const StartHealthPage();
      case 'Science':
        return const StartSciencePage();
      case 'Sports':
        return const StartSportsPage();
      default:
        return const StartEntertainmentPage(); // Handle unknown pages
    }
  }
}
