import 'package:flutter/material.dart';

import '../../../common_ui/Widgets/circular_image.dart';
import '../widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  CircularImage(
                    image: "assets/Images/UserIcon.png",
                    width: 80,
                    height: 80,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Change profile picture'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Profile Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            ProfileMenu(title: 'Name', value: 'Medhat Ahmed', onPressed: () {}),
            ProfileMenu(
              title: 'Username',
              value: 'Medhat_Ahmed',
              onPressed: () {},
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            ProfileMenu(
              title: 'User Id',
              value: '45689',
              onPressed: () {},
              icon: Icons.arrow_right_alt,
            ),
            ProfileMenu(
              title: 'E-mail',
              value: 'medhat@gmail.com',
              onPressed: () {},
              icon: Icons.arrow_right_alt,
            ),
            ProfileMenu(
              title: 'Phone Number',
              value: '+20111177788',
              onPressed: () {},
              icon: Icons.arrow_right_alt,
            ),
            ProfileMenu(
              title: 'Gender',
              value: 'Male',
              onPressed: () {},
              icon: Icons.arrow_right_alt,
            ),
            ProfileMenu(
              title: 'Date Of Birth',
              value: '2nd Of July 2004',
              onPressed: () {},
              icon: Icons.arrow_right_alt,
            ),
            Divider(),
            SizedBox(height: 16),

            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
