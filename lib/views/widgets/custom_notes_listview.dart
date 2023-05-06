import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';

import 'custom_note_item.dart';

class CustomNotesListView extends StatelessWidget {
  const CustomNotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NotesCubit, NotesState>(

      builder: (context, state) {

        var cubit = BlocProvider.of<NotesCubit>(context);
        print(cubit.notes?.length);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(itemCount:
          cubit.notesFiltered.isEmpty ? cubit.notes!.length : cubit.notesFiltered
              .length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index)
              {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NotesItem(model: cubit.notesFiltered.isEmpty ?
                  cubit.notes![index] : cubit.notesFiltered[index]),
                );
              }),
        );
      },
    );
  }
}
