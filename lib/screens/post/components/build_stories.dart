import 'package:flutter/material.dart';
import 'package:rest_api_flutter/models/post_model.dart';

class BuildStories extends StatelessWidget {
  const BuildStories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const SizedBox(width: 10.0);
          }
          return Container(
            margin: const EdgeInsets.all(10.0),
            width: 60.0,
            height: 60.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: CircleAvatar(
              child: ClipOval(
                child: Image(
                  height: 60.0,
                  width: 60.0,
                  image: AssetImage(stories[index - 1]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
