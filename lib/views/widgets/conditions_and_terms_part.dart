import 'package:flutter/material.dart';

class TermsAndConditionsRow extends StatefulWidget {
  const TermsAndConditionsRow({super.key});

  @override
  TermsAndConditionsRowState createState() => TermsAndConditionsRowState();
}

class TermsAndConditionsRowState extends State<TermsAndConditionsRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.blue, // Change check icon color when checked
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Handle "terms and conditions" text tap
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Terms and Conditions'),
                  content: const Text(
                      'Here are the terms and conditions. Please read them carefully.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            child: const Text.rich(
              TextSpan(
                text: 'I agree to the ',
                children: [
                  TextSpan(
                    text: 'terms and conditions',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: '.'),
                ],
              ),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
