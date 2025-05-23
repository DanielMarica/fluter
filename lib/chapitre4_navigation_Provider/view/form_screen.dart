import 'package:ex4/chapitre4_navigation_Provider/models/article.dart';
import 'package:ex4/chapitre4_navigation_Provider/view_model/article_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final contentController = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New article"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Article title"),
                validator: (value) => (value == null || value == "")
                    ? "Title can't be empty"
                    : null,
              ),
              TextFormField(
                controller: authorController,
                decoration: const InputDecoration(labelText: "Article author"),
                validator: (value) => (value == null || value == "")
                    ? "Author can't be empty"
                    : null,
              ),
              Expanded(
                child: TextFormField(
                  maxLines: null,
                  controller: contentController,
                  decoration:
                      const InputDecoration(labelText: "Article content"),
                  validator: (value) => (value == null || value == "")
                      ? "Content can't be empty"
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text("Create article"),
                onPressed: () {
                  if (key.currentState!.validate()) {
                    Article newArticle = Article(
                      title: titleController.text,
                      author: authorController.text,
                      content: contentController.text,);
                    // TODO F07 create article
                    Provider.of<ArticleViewModel>(context,listen: false).addArticle(newArticle);
                    // clear form thanks to the form key
                    key.currentState!.reset();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
