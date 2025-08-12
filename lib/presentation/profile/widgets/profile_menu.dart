import 'package:flutter/material.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,  this.icon, required this.onPressed, required this.title, required this.value,
  });
  final IconData? icon;
  final VoidCallback onPressed;
  final String title,value;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Expanded(flex:3,child: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black.withValues(alpha: 0.5)),)),
            Expanded(flex:5,child:Text(value,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black,)) ),
            Expanded(child: Icon(icon,size: 18,),),


          ],
        ),
      ),
    );
  }
}