import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRow2 extends StatelessWidget {
  String text;
  CustomRow2({required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell( onTap: (){},
      child: Row(children: [

        Text(text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.black45,
              fontSize: 14.sp,
            ),),),
        Spacer(),
        CircleAvatar(
            radius: 10.r,
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.arrow_forward_ios,color: Colors.black38,size: 10.r,))

      ],),
    );
  }
}