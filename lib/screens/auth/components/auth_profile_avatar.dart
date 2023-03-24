import 'package:flutter/material.dart';

class AuthProfileAvatar extends StatelessWidget {
  final ImageProvider<Object> backgroundImage;
  final IconData icon;
  final VoidCallback onPressed;
  const AuthProfileAvatar({
    Key? key,
    required this.backgroundImage,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundImage: backgroundImage,
          backgroundColor: Colors.black,
        ),
        Positioned(
          bottom: -10,
          left: 80,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
            ),
          ),
        ),
      ],
    );
  }
}
