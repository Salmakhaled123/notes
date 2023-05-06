import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';

import 'add_note_states.dart';

class AddNotesCubit extends Cubit<AddNoteStates>
{
  AddNotesCubit():super(AddNotesInitial());
  Color color=const Color(0xff5b8e7d);
  addNote(NoteModel note)async
  {
    note.color=color.value;
      var boxNotes=Hive.box<NoteModel>(notesBox);
         await boxNotes.add(note);
    Fluttertoast.showToast(
        msg: "Note added successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    emit(AddNotesSuccess());



  }
}