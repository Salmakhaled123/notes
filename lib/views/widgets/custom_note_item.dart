import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/edit_note_view.dart';

class NotesItem extends StatefulWidget {
  const NotesItem({Key? key, required this.model}) : super(key: key);
final NoteModel model;

  @override
  State<NotesItem> createState() => _NotesItemState();
}

class _NotesItemState extends State<NotesItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return  EditNoteView(model: widget.model,);
      }));
    },
      child: Container(padding: EdgeInsets.only(top: 20,bottom: 20,left: 16
      ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(widget.model.color)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
              title: Text(
                widget.model.title,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(
                  widget.model.subtitle,
                  style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                  onPressed: ()  {

               widget.model.delete();
               Fluttertoast.showToast(
                     msg: "Note removed successfully",
                     toastLength: Toast.LENGTH_SHORT,
                     gravity: ToastGravity.BOTTOM,
                     timeInSecForIosWeb: 1,
                     backgroundColor: Colors.red,
                     textColor: Colors.white,
                     fontSize: 16.0
                 );
               BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24,
                  )),
            ),

          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              widget.model.date,
              style: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 16),
            ),
          )
        ]),
      ),
    );
  }
}