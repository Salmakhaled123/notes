import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';

import '../../constants.dart';

class ColorItem extends StatelessWidget
{
    ColorItem({Key? key, required this.isPicked, required this.color}) : super(key: key);
  final bool isPicked;
  final Color color;


  @override
  Widget build(BuildContext context)
  {
    return isPicked ? CircleAvatar(radius: 38,backgroundColor:  Colors.white,
        child: CircleAvatar(backgroundColor: color,radius:32)): CircleAvatar(backgroundColor: color,radius: 36,
    );
  }
}
class ColorItemListView extends StatefulWidget {
  const ColorItemListView({Key? key}) : super(key: key);

  @override
  State<ColorItemListView> createState() => _ColorItemListViewState();
}

class _ColorItemListViewState extends State<ColorItemListView> {
  int currentIndex=0;

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
                BlocProvider.of<AddNotesCubit>(context).color=colors[index];
                setState(() { });
              },
                  child: ColorItem(color: colors[index],
                      isPicked: currentIndex==index)),
            );
          }),
    );
  }
}