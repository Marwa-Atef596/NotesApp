import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constent/const.dart';
import 'package:notes_app/cubites/notesCubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

import 'colorslistview.dart';
import 'custom_txt.dart';
import 'editcolor.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextFielf(
            onchange: (value) {
              title = value;
            },
            hint: widget.note.title,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFielf(
            onchange: (value) {
              content = value;
            },
            hint: widget.note.subtitle,
            maxline: 5,
          ),
          SizedBox(
            height: 16,
          ),
          EditColorList(
            note: widget.note,
          )
        ],
      ),
    );
  }
}
