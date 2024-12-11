import 'package:flutter/material.dart';
import 'package:notes_app/widgets/edit_note.dart';

import '../models/note_model.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteView(
        note: note,
      ),
    );
  }
}