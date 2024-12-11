import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constent/const.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
//  bool isloading = false;
  Color color = Colors.deepOrange;
  addNote(NoteModel note) async {
    note.color = color!.value;
    //  isloading = true;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      // isloading = false;
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      //isloading = false;
      emit(AddNoteFailure(e.toString()));
    }
  }
}
