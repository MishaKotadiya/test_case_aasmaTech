import 'package:flutter/material.dart';
import 'package:kwikshop/config/theme/app_colors.dart';

import '../../../../core/shared/app_string.dart';
import '../../../MyProfile/presentation/screens/my_profile.dart';
import '../../../Notifications/presentations/screens/notification_screen.dart';
import '../../data/models/post_model.dart';
import '../widgets/home_screen_helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(AppString.appName),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomeContent(),
          MyProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.blackColor,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: AppColors.blackColor,),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}


class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Post> dummyPosts = [
      Post(
        profileImage: 'https://via.placeholder.com/150',
        username: 'User1',
        postText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        tag: 'Fruits',
        isLiked: true,
        comments: [
          Comment(
            profileImage: 'https://via.placeholder.com/150',
            username: 'User2',
            commentText: 'Nice post!',
          ),
          Comment(
            profileImage: 'https://via.placeholder.com/150',
            username: 'User3',
            commentText: 'Great content!',
          ),
        ],
      ),
      Post(
        profileImage: 'https://via.placeholder.com/150',
        username: 'User2',
        postText: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        tag: 'Spices',
        isLiked: false,
        comments: [
          Comment(
            profileImage: 'https://via.placeholder.com/150',
            username: 'User1',
            commentText: 'I love this!',
          ),
        ],
      ),
      Post(
        profileImage: 'https://via.placeholder.com/150',
        username: 'User3',
        postText: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        tag: 'Vegetables',
        isLiked: true,
        comments: [],
      ),
    ];
    return Scaffold(
       body: ListView.builder(
        itemCount: dummyPosts.length, // Number of posts
        itemBuilder: (context, index) {
          return PostCard(
            profileImage: dummyPosts[index].profileImage,
            username: dummyPosts[index].username,
            postText: dummyPosts[index].postText,
            tag: dummyPosts[index].tag,
            isLiked: dummyPosts[index].isLiked,
            comments: dummyPosts[index].comments,
          );
        },
       ),
    );
  }
}


