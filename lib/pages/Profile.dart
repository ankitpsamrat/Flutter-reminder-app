import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 200,
            color: Colors.amber,
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    'https://www.shutterstock.com/image-vector/man-icon-vector-600w-1040084344.jpg',
                  ),
                ),
                Text('Ankit Pratap Samrat')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
