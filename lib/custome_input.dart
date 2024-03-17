import 'package:card_page/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomeInput extends StatefulWidget {
  const CustomeInput({super.key});

  @override
  State<CustomeInput> createState() => _AState();
}
class _AState extends State<CustomeInput> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: AppColor.InputColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      
    );
  }
}
