import 'package:card_page/app_text.dart';
import 'package:card_page/custome_input.dart';
import 'package:card_page/switch_button.dart';
import 'package:card_page/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late SharedPreferences _prefs;
  String buttonText = 'Pay';
  bool isPaid = false;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  void _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      isPaid = _prefs.getBool('isPaid') ?? false;
      buttonText = isPaid ? 'Paid' : 'Pay';
    });
  }

  Future<void> _togglePaidStatus() async {
    setState(() {
      isPaid = !isPaid;
      buttonText = isPaid ? 'Paid' : 'Pay';
      _prefs.setBool('isPaid', isPaid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 30, 10),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppText.PD,
                style: TextStyle(
                  color: Color.fromARGB(255, 242, 239, 231),
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          TextWidget(inputText: AppText.CHN),
            CustomeInput(),
            SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppText.CN,
                style: TextStyle(
                  color: Color.fromARGB(255, 242, 239, 231),
                  fontSize: 12,
                ),
              ),
            ),
            CustomeInput(),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.ED,
                        style: TextStyle(
                          color: Color.fromARGB(255, 242, 239, 231),
                          fontSize: 12,
                        ),
                      ),
                      CustomeInput(),
                    ],
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.CVV,
                        style: TextStyle(
                          color: Color.fromARGB(255, 242, 239, 231),
                          fontSize: 12,
                        ),
                      ),
                      CustomeInput(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SwitchButton(),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                _togglePaidStatus();
              },
              child: Text(buttonText),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 224, 192, 105),
                foregroundColor: Color.fromARGB(255, 56, 47, 3),
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
              ),
            ),
            SizedBox(
              height: 50, // Add additional padding at the bottom
            ),
          ],
        ),
      ),
    );
  }
}
