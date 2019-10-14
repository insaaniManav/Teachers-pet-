import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/blue_logo_png.png');
    Image image = Image(image : assetImage);
    return Container(
      child: image,
    );
  }
}