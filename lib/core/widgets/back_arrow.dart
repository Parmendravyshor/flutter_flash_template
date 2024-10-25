import 'package:flutter/material.dart';

/// This is backarrow button to navigate to back pages on top left
class BackArrowButton extends StatelessWidget {
  final VoidCallback onTap;
  const BackArrowButton({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onTap,
        )
      ],
    );
  }
}
