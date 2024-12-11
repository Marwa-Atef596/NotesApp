import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubites/notesCubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {

        List<NoteModel>notes=BlocProvider.of<NotesCubitCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount:notes.length,
            padding: EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 4),
                child: NoteItem(
                  note:notes[index] ,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
