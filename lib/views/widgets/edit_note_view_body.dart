import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/colors_item_listview.dart';
import 'package:notes/views/widgets/custom_text_form_field.dart';

import '../../constants.dart';
import 'cutom_app_bar.dart';

class EditNoteViewBody extends StatefulWidget
{
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
final NoteModel note;


  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String ? title,content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(children:  [
        const   SizedBox(height: 50,),
          CustomAppBar(title: 'Edit Note ',icon: Icons.check,onPressed: ()
          {
            widget.note.title=title?? widget.note.title;
            widget.note.subtitle=content?? widget.note.subtitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);

          }),
        const   SizedBox(height: 50,),
          CustomTextField(initialValue: widget.note.title,
            onChanged: (value)
          {
           widget.note.title=value;
         },),
        const  SizedBox(height: 16,),
         CustomTextField(initialValue:widget.note.subtitle,maxLines: 5,onChanged: (value)
         {
           widget.note.subtitle=value;
         },),
          const  SizedBox(height: 8,),
           EditNoteColorList(model: widget.note),

        ],),
      ),
    );
  }
}
class EditNoteColorList extends StatefulWidget
{
  final NoteModel model;
   EditNoteColorList({Key? key, required this.model}) : super(key: key);

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
 late int currentIndex=0;

@override
  void initState() {
currentIndex=colors.indexOf(Color(widget.model.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 38*2,
      child: ListView.builder(itemCount: colors.length,scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)
          {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(onTap: ()
              {
                currentIndex=index;
                widget.model.color=colors[index].value;

                setState(() { });
              },
                  child: ColorItem(color: colors[index],
                      isPicked: currentIndex==index)),
            );
          }),
    );
  }
}

