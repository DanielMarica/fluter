import 'package:flutter/material.dart';

import './create_note_form.dart';
import 'notes.dart';
import 'notes_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final notes = <Note>[
    Note("Note 1", "Contenu de la note 1"),
    Note("Note 2", "Contenu de la note 2"),
    Note("Note 3", "Contenu de la note 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutoriel 3"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: NotesList(
                notes: notes,
                deleteNote: (note) => setState(() => notes.remove(note)),
              ),
            ),
            const SizedBox(height: 16.0), // Use height for vertical spacing
            MyForm((note) => setState(() => notes.add(note))), // No casting needed
          ],
        ),
      ),
    );
  }
}