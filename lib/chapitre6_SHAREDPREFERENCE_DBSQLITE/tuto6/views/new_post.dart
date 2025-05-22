import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';

class NewPost extends StatelessWidget {
  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context, 'New Post'),
      body: const Center(
        child: Text('New Post'),
      ),
    );
  }
}