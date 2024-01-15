import 'package:d_luscious/core/widgets/appbard.dart';
import 'package:flutter/material.dart';

import '../../core/constant/app_string.dart';

class UserProfileScreenTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.blankAppBar(title: AppString.profile),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://placekitten.com/200/200', // Replace with user's profile image URL
              ),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe', // Replace with user's name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'john.doe@example.com', // Replace with user's email
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bio: A passionate Flutter developer who loves creating awesome apps!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            UserDetailsList(),
          ],
        ),
      ),
    );
  }
}

class UserDetailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailItem('Location', 'New York, USA'),
        DetailItem('Joined', 'January 2022'),
        DetailItem('Phone', '+1 (555) 123-4567'),
      ],
    );
  }
}

class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  DetailItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
