import 'package:card_page/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentButton extends StatefulWidget {
  @override
  _PaymentButtonState createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
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
    return ElevatedButton(
      onPressed: () {
        _togglePaidStatus();
      },
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.BackElevate,
        foregroundColor: AppColor.FronElevate,
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
      ),
    );
  }
}