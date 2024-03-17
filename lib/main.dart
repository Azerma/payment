import 'package:card_page/constants/app_color.dart';
import 'package:card_page/constants/app_text.dart';
import 'package:card_page/custome_input.dart';
import 'package:card_page/elevatedButton.dart';
import 'package:card_page/sized_box.dart';
import 'package:card_page/switch_button.dart';
import 'package:card_page/text_widget.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Main(),
  ));
}


class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BackBrown,
      body: SingleChildScrollView(
        child: Column(
          children: [
            50.h,
           TextWidget(inputText: AppText.CHN),
            50.h,
          TextWidget(inputText: AppText.CN),
            CustomeInput(),
            10.h,
           TextWidget(inputText: AppText.CHN),
            CustomeInput(),
            10.h,
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     TextWidget(inputText: AppText.ED),
                      CustomeInput(),
                    ],
                  ),
                ),
                2.w,
                
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(inputText: AppText.CVV),
                      CustomeInput(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SwitchButton(),
            35.h,
            PaymentButton(),
            50.h,
          ],
        ),
      ),
    );
  }
}
