import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget
{
  const EditNoteView({Key? key, required this.model}) : super(key: key);
final NoteModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody(note: model),);
  }
}
