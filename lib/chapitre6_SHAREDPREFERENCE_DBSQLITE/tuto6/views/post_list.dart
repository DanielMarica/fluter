import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/post.dart';
import '../view_model/post_view_model.dart';

import '../widgets/nav_bar.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context, 'Posts'),
      body: Consumer<PostViewModel>(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.posts.length,
            itemBuilder: (context, index) {
              final post = model.posts[index];
              return ListTile(
                title: Text(post.name),
                subtitle: Text(post.content),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    model.deletePost(post.id!);
                  },
                ),
                onTap: () => context.go('/posts/${post.id}'),
              );
            },
          );
        },
      ),
    );
  }
}