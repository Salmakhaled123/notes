import 'package:flutter/material.dart';
import 'custom_icon.dart';

class CustomAppBar extends StatefulWidget
{
  CustomAppBar({Key? key, required this.title, required this.icon, this.onPressed}) : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        Text(widget.title,style: TextStyle(fontSize: 24),),
        const  Spacer(),
       CustomIcon(icon: widget.icon,onPressed: widget.onPressed,
        )
      ],);
  }
}
