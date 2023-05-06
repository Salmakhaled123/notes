import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';

import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> ?notes;
  fetchAllNotes()
  {
      var boxes=Hive.box<NoteModel>(notesBox);
      notes=boxes.values.toList();
      emit(NotesSuccess());
  }
  List<NoteModel>notesFiltered=[];
  void fetchSearchedList(String input)
  {
      notesFiltered= notes!.where((element) =>
          element.title.toLowerCase().startsWith(input.toLowerCase())).toList();
      emit(NotesFilteredList());
  }
}
