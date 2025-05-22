import 'dart:typed_data';

import 'package:ex4/chapitre4_navigation_Provider/view_model/article_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


import '../models/article.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ArticleViewModel>(
      builder: (context, viewModel, child) {
      var articles = [
      for (var article in viewModel.articles)
        if (viewModel.showRead || !article.read) article
    ]; // TODO F07 get state from view model

    return Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: viewModel.showRead
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            onPressed: () {
              viewModel.toggleShowRead(); // TODO F07 show/hide read articles
            }, // TODO F07 show/hide read articles
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/create-article"),
     // TODO F06 go to form screen
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: articles.isEmpty
            ? const Center(
                child: Text("There are no articles yet. Create one!"),
              )
            : ListView.separated(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  var article = articles[index];
                  return ListTile(
                    leading: IconButton(
                      icon: article.read
                          ? const Icon(Icons.check_box)
                          : const Icon(Icons.check_box_outline_blank),
                      onPressed: () => viewModel.toggleRead(article),
                      // TODO F07 mark as read
                    ),
                    title: Text(article.title),
                    subtitle: Text(article.author),
                    onTap: () => context.go("/articles/${article.id}"),
                    // TODO F06 go to article screen with a path parameter (the article id) and passing the article as an extra argument
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => viewModel.deleteArticle(article), // TODO F07 delete article
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
      ),
    );
  }
    );
  }
}
