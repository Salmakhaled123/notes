import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'custom_icon.dart';

class CustomAppBarNoteView extends StatefulWidget
{
  const CustomAppBarNoteView({Key? key, required this.title, required this.icon, this.onPressed}) : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  State<CustomAppBarNoteView> createState() => _CustomAppBarNoteViewState();

}

class _CustomAppBarNoteViewState extends State<CustomAppBarNoteView> {

  bool searchOpened=false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        searchOpened?Expanded(
          child: TextFormField(onChanged: (input)
          {
            BlocProvider.of<NotesCubit>(context).fetchSearchedList(input);
          },
            decoration:  InputDecoration(border: InputBorder.none,hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white)),),
        ) :
        Text(widget.title,style: TextStyle(fontSize: 24),),
        const  Spacer(),
         CustomIcon(icon:searchOpened? Icons.clear:widget.icon,onPressed:()
         {

          setState(()
          {
            searchOpened=!searchOpened;
          });

         } ,)
      ],);
  }
}
