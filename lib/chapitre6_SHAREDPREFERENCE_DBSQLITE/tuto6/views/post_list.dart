import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context, 'Posts'),
      body: const Center(
        child: Text('Post List'),
      ),
    );
  }
}