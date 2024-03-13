 import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: Container(
          alignment: Alignment.center,
          width: 80,
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(70)),
          child: Image.asset(
            "assets/images/logo.png",
            height: 40,
            // fit: BoxFit.fill,
          )),
    );
  }
}
