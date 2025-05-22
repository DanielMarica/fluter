import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notes.dart';

class MyForm extends StatefulWidget {
  final void Function(Note) addNotes;

  const MyForm(this.addNotes, {super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Note title"),
              validator: (value) => (value == null || value.isEmpty)
                  ? "note title can't be empty"
                  : null,
            ),
          ),
          const SizedBox(width: 32.0),
          Expanded(
            child: TextFormField(
              controller: contentController,
              decoration: const InputDecoration(labelText: "content title"),
              validator: (value) => (value == null || value.isEmpty)
                  ? "note content can't be empty"
                  : null,
            ),
          ),
          const SizedBox(width: 32.0),
          ElevatedButton(
            child: const Text("Create Note"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                widget.addNotes(Note(titleController.text, contentController.text));
                titleController.text = "";
                contentController.text = "";
              }
            },
          ),
        ],
      ),
    );
  }
}