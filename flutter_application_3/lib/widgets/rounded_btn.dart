import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{
  final String btnName;
  final Icon? icon;
  final Color? bgColor ;
  final VoidCallback? callBack;


 // constructor

  const RoundedButton({super.key, 
    required this.btnName,
    this.icon,
    this.bgColor = Colors.blue,
    this.callBack
    });


@override
  Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      callBack?.call();
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      shadowColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
    ),
    child: icon != null? Row(
        children: [
              icon!,
              SizedBox(width: 8),
              Text(btnName),
        ],
      ): Text(btnName),
  );
}
}