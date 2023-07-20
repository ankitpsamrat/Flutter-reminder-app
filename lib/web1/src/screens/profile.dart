import 'package:desktop_application/web1/helpers/responsive.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  Widget sectionContainer({required String text}) {
    return Container(
      height: 6 * AppUI.dh,
      width: 18 * AppUI.dw,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 3 * AppUI.dh),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 20 * AppUI.dw,
            color: Color.fromARGB(255, 205, 225, 242),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    'https://www.shutterstock.com/image-vector/man-icon-vector-600w-1040084344.jpg',
                  ),
                ),
                Text('Ankit Pratap Samrat'),
                sectionContainer(text: 'My Profile'),
                sectionContainer(text: 'Settings'),
                sectionContainer(text: 'Blog'),
                sectionContainer(text: 'FAQs'),
                sectionContainer(text: 'Contact'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
