import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget {
  final String appTitle;
  const AppBarItem({super.key, required this.appTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: Text(
              appTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'poppins'),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Container(
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
              print('Search button pressed');
            },
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
