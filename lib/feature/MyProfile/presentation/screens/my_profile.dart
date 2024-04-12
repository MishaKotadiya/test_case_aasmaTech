import 'package:flutter/material.dart';
import 'package:kwikshop/feature/Authentication/presentation/screens/login_screen.dart';

import '../../../../core/shared/appButton.dart';
import '../../../../core/shared/app_string.dart';
import '../../data/models/UserProfile_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyProfileScreen(),
    );
  }
}



class MyProfileScreen extends StatelessWidget {
    UserProfile userProfile = UserProfile(
    firstName: 'John',
    lastName: 'Doe',
    email: 'johndoe@example.com',
    phoneNumber: '1234567890',
    tag: 'Fruits',
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(''),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfileScreen(userProfile: userProfile)),
                    ).then((updatedProfile) {
                      if (updatedProfile != null) {
                        userProfile.firstName = updatedProfile.firstName;
                        userProfile.email = updatedProfile.email;
                        userProfile.lastName = updatedProfile.lastName;
                        userProfile.phoneNumber = updatedProfile.phoneNumber;
                        userProfile.tag = updatedProfile.tag;
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Name: ${userProfile.firstName + userProfile.lastName}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Email: ${userProfile.email}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'PhoneNumber: ${userProfile.phoneNumber}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'tag: ${userProfile.tag}',
              style: TextStyle(fontSize: 16.0),
            ),

            SizedBox(height: 30.0),
            AppButton(
                title: "Logout",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final UserProfile userProfile;

  EditProfileScreen({required this.userProfile});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _tagController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userProfile.firstName);
    _emailController = TextEditingController(text: widget.userProfile.email);
    _phoneNumberController = TextEditingController(text: widget.userProfile.phoneNumber);
    _tagController = TextEditingController(text: widget.userProfile.tag);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),

            SizedBox(height: 20.0),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'phoneNumber',
              ),
              maxLines: null,
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              value: "Fruits",
              decoration: InputDecoration(
                labelText: 'Tag',
                prefixIcon: Icon(Icons.category),
              ),
              items: <String>['Fruits', 'Vegetable', 'All Grocery'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {

              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a tag';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Save changes and pass updated profile data back to MyProfileScreen
                UserProfile updatedProfile = UserProfile(
                  firstName: _nameController.text,
                  email: _emailController.text,
                  tag: _tagController.text,
                  phoneNumber: _phoneNumberController.text,
                  lastName: '',
                );
                Navigator.pop(context, updatedProfile);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
