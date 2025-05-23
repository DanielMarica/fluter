import '../view_model/article_view_model.dart';
import '../view/article_row.dart';
import '../models/article.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();


  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();

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
                controller: nameController,
                decoration: const InputDecoration(labelText: "name of the article"),
                validator: (value) => (value == null || value == "")
                    ? "name can't be empty"
                    : null,
              ),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "price"),
                validator: (value) => (value == null || value == "")
                    ? "Author can't be empty"
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text("Create article"),
                onPressed: () {
                  if (key.currentState!.validate()) {
                    final name = nameController.text;
                    final priceString = priceController.text;
                    final price = double.tryParse(priceString);
                    // TODO F07 create article
                    Provider.of<ArticleViewModel>(context,listen: false).createArticle(name, price!, 1);
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
