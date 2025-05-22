import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.go('/new_post');
            },
          ),
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: () {
              context.go('/settings');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Post List'),
      ),
    );
  }
}