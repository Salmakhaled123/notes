import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap, this.isLoading=false}) : super(key: key);
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap,
      child: Container(child:  Center(child: isLoading ?
      SizedBox(height: 24,width: 24,
        child: const CircularProgressIndicator(
          color: Colors.black,
        ),
      ):
       Text('Add',style:
      TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
        width: MediaQuery.of(context).size.width,
        height: 55,decoration: BoxDecoration(color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),),
    );
  }
}