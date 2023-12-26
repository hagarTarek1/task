import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRow extends StatelessWidget {
  IconData icon;
  String text;
   CustomRow({required this.text,required this.icon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(children: [
        Icon(icon),
        SizedBox(width: 20.w,),
        Text(text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.black45,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),),),
        Spacer(),
        CircleAvatar(
            radius: 15,
            backgroundColor: Colors.black54,
            child: Icon(Icons.arrow_upward,color: Colors.white,size: 15.r,))

      ],),
    );
  }
}
