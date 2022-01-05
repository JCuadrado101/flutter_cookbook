import 'package:flutter/material.dart';
import 'package:flutter_cookbook/chapter4/star.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/image.jpg'),
          Transform.translate(
            offset: const Offset(0, 100),
            child: Column(
              children: [
                _buildProfileImage(context),
                _buildProfileDetails(context),
                _buildActions(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildProfileImage(BuildContext context) {
  return SizedBox(
    width: 200,
    height: 200,
    child: ClipOval(
      child: Image.asset(
        'assets/dog.jpg',
        fit: BoxFit.fitWidth
      ),
    ),
  );
}

Widget _buildProfileDetails(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Wolfram Barkovich',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
      ),
      const StarRating(value: 5),
      _buildDetailsRow('Age', '4'),
      _buildDetailsRow('Status', 'Good Boy'),
    ],
  );
}


Widget _buildDetailsRow(String heading, String value) {
  return Row(
    children: [
      Text(' $heading ',
      style: TextStyle(fontWeight: FontWeight.bold)
      ),
      Text(value),
    ],
  );
}

Widget _buildActions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildIcon(Icons.restaurant, 'Feed'),
      _buildIcon(Icons.favorite, 'Pet'),
      _buildIcon(Icons.directions_walk, 'Walk'),
    ],
  );
}

Widget _buildIcon(IconData icon, String action) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Icon(icon, size: 40),
        Text(action),
      ],
    ),
  );
}