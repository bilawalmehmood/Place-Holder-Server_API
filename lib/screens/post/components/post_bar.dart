import 'package:flutter/material.dart';

class PostBar extends StatelessWidget {
  const PostBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            'Posts',
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 32.0,
              color: Colors.black,
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.live_tv),
                iconSize: 30.0,
                color: Colors.black,
                onPressed: () => print('IGTV'),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: 35.0,
                child: IconButton(
                  icon: const Icon(Icons.send),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () => print('Direct Messages'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
