import 'package:flutter/material.dart';

Widget buildImage(BuildContext context, String imageUrl) {
  final screenSize = MediaQuery.sizeOf(context);
  return SizedBox(
    height: screenSize.height * 0.462,
    width: double.infinity,
    child: Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.red,
                size: screenSize.height * 0.0397,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
