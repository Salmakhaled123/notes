import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

class CustomTextField extends StatelessWidget {

  final String ? hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged ;
  final String? initialValue;
  const CustomTextField({super.key,  this.maxLines=1,this.hint,
     this.onSaved, this.onChanged, this.initialValue});
  @override
  Widget build(BuildContext context) {
    return TextFormField(initialValue:initialValue ,
      cursorColor:primaryColor ,
      maxLines: maxLines,
      onChanged:onChanged ,
      onSaved: onSaved,
      validator: (value){
      if(value?.isEmpty?? true)//if value not null check is empty or not if null true condition
        {
          print(value);
          return 'Field is required';
        }
      else
        {
          return null;
        }
      },
      decoration: InputDecoration(hintText: hint,
          hintStyle: const TextStyle(color: primaryColor),
          border: buildBorder(primaryColor),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(primaryColor)),
    );
  }

  OutlineInputBorder buildBorder([color]) =>
      OutlineInputBorder(borderSide: BorderSide(color: color?? Colors.white),
          borderRadius: BorderRadius.circular(8));
}
