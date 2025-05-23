import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notes.dart';

class NotesList extends StatelessWidget {

  final List<Note> notes;
  final void Function(Note) deleteNote;

  const NotesList({super.key, required this.notes, required this.deleteNote});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context,index) => const Divider(),
        itemCount: notes.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(notes[index].title),
          subtitle: Text(notes[index].content),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => deleteNote(notes[index]),
          )
        )
    );
  }
}
