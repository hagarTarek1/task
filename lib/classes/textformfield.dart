import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextFormfield extends StatelessWidget {
  TextEditingController Controllerr;
  String hint;
  IconData icon;
  CustomTextFormfield({required this.Controllerr,required this.hint,required this.icon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controllerr,
      scrollPadding: EdgeInsets.all(5),
      decoration: InputDecoration(border: InputBorder.none,
        prefixIcon: Icon(icon,size: 30,color: Colors.black54,),
        label: Text(hint),
        labelStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),),
    );

  }
}
