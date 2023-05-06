import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';

import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/add_note_cubit/add_note_states.dart';
import 'colors_item_listview.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState>formkey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String ?title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(key: formkey,
      autovalidateMode: autoValidateMode,
      child: Column(children:
      [
        const SizedBox(height: 32,),
        CustomTextField(hint: 'Title', onSaved: (value) {
          title = value;
        },),
        const SizedBox(height: 16,),
        CustomTextField( hint:'content',maxLines: 5, onSaved: (value) {
          subTitle = value;
        },),
        const SizedBox(height: 32,),
           const ColorItemListView(),

        const SizedBox(height: 32,),
        BlocBuilder<AddNotesCubit, AddNoteStates>(
          builder: (context, state) {
            return CustomButton(isLoading: state is AddNotesLoading ? true : false,
                onTap: ()
                {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var noteModel = NoteModel(title: title!,
                        color: Colors.blue.value,
                        date: DateFormat(DateFormat.YEAR_MONTH_DAY).format(DateTime.now()),
                        subtitle: subTitle!);
                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                  }
                  else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                });
          },
        ),
        const SizedBox(height: 16,)


      ],),
    );
  }
}


